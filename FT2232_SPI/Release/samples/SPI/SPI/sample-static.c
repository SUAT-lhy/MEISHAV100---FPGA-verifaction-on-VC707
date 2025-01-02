/*��׼C��*/
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<windows.h>
/* ����D2XXͷ�ļ�*/
#include "ftd2xx.h"

/* ����libMPSSEͷ�ļ�*/
#include "libMPSSE_spi.h"

#define APP_CHECK_STATUS(exp) {if(exp!=FT_OK){printf("%s:%d:%s(): status(0x%x) \
!= FT_OK\n",__FILE__, __LINE__, __FUNCTION__,exp);exit(1);}else{;}};
#define CHECK_NULL(exp){if(exp==NULL){printf("%s:%d:%s():  NULL expression \
encountered \n",__FILE__, __LINE__, __FUNCTION__);exit(1);}else{;}};

/******************************************************************************/
/*								ȫ�ֱ���					  	    */
/******************************************************************************/
static FT_HANDLE ftHandle;
static uint8 buffer[256] = { 0 };

static FT_STATUS write_byte(uint8 slaveAddress, uint8 address, uint16 data)
{
	uint32 sizeToTransfer = 0;
	uint32 sizeTransfered = 0;
	uint8 writeComplete = 0;
	uint32 retry = 0;
	FT_STATUS status;

	/* д����EWEN(��CS_High &gt;CS_Low) */
	sizeToTransfer = 11;
	sizeTransfered = 0;

	//buffer[0]=0xff;/* SPI_EWEN ->;������10011xxxxxx(11λ) */
	//
	//buffer[1]=0xff;
	status = SPI_Write(ftHandle, buffer, sizeToTransfer, &sizeTransfered,
		SPI_TRANSFER_OPTIONS_SIZE_IN_BITS |
		SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE |
		SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE); Sleep(300);

	/* CS_High +д����+��ַ */
	sizeToTransfer = 1;
	sizeTransfered = 0;
	buffer[0] = 0xA0;/*д����(3λ) */
	buffer[0] = buffer[0] | ((address >> 3) & 0x0F);/*5 �����Чλ*/
	status = SPI_Write(ftHandle, buffer, sizeToTransfer, &sizeTransfered,
		SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES |
		SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE);
	APP_CHECK_STATUS(status);

	/*д3����Сsig��ַλ*/
	sizeToTransfer = 3;
	sizeTransfered = 0;
	buffer[0] = (address & 0x07) << 5; /* �����Ч��3λ��ַλ */
	status = SPI_Write(ftHandle, buffer, sizeToTransfer, &sizeTransfered,
		SPI_TRANSFER_OPTIONS_SIZE_IN_BITS);
	APP_CHECK_STATUS(status);

	/*д��2�ֽ�����+ CS_Low*/
	sizeToTransfer = 0;
	sizeTransfered = 0;
	buffer[0] = (uint8)(data & 0xFF);
	buffer[1] = (uint8)((data & 0xFF00) >> 8);
	status = SPI_Write(ftHandle, buffer, sizeToTransfer, &sizeTransfered,
		SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES |
		SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE);
	APP_CHECK_STATUS(status);

	/* �ȵ�D0�ߵ�ʱ��*/
#if 1
	/*Ƶ����оƬѡ�� */
	sizeToTransfer = 0;
	sizeTransfered = 0;
	status = SPI_Write(ftHandle, buffer, sizeToTransfer, &sizeTransfered,
		SPI_TRANSFER_OPTIONS_SIZE_IN_BITS |
		SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE);
	APP_CHECK_STATUS(status);
#ifndef __linux__
	Sleep(10);
#endif
	sizeToTransfer = 0;
	sizeTransfered = 0;
	status = SPI_Write(ftHandle, buffer, sizeToTransfer, &sizeTransfered,
		SPI_TRANSFER_OPTIONS_SIZE_IN_BITS |
		SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE);
	APP_CHECK_STATUS(status);
#else
	retry = 0;
	state = FALSE;
	SPI_IsBusy(ftHandle, &state);
	while ((FALSE == state) && (retry < SPI_WRITE_COMPLETION_RETRY))
	{
		printf("SPI device is busy(%u)\n", (unsigned)retry);
		SPI_IsBusy(ftHandle, &state);
		retry++;
	}
#endif
	/* Write command EWEN(with CS_High -> CS_Low) */
	sizeToTransfer = 11;
	sizeTransfered = 0;
	buffer[0] = 0x8F;/* SPI_EWEN -> binary 10011xxxxxx (11bits) */
	buffer[1] = 0xFF;
	status = SPI_Write(ftHandle, buffer, sizeToTransfer, &sizeTransfered,
		SPI_TRANSFER_OPTIONS_SIZE_IN_BITS |
		SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE |
		SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE);
	APP_CHECK_STATUS(status);
	return status;
}


/*!
*\��Ҫ����ʾ��Ӧ�ó���������� / ��ڵ�
*�˺�����ʾ��Ӧ�ó������ڵ㡣����ͨ����д��EEPROM���ض���
*\param[in] none
* \return����0��ʾ�ɹ�
* \ sa
* \ע
* \����
*/

void qspi_send_cmd_addr_write(uint8 *command, uint32 *addr,uint32 *data)
{
	uint8 buffer[9] = {0};
	// �� command ���� buffer
	buffer[0] = *command;

	// �� addr �� 4 ���ֽ����δ��� buffer��addr �� uint32 ����
	buffer[1] = (uint8)((*addr >> 24));  // ����ֽ�
	buffer[2] = (uint8)((*addr >> 16));  // �θ��ֽ�
	buffer[3] = (uint8)((*addr >> 8));   // �ε��ֽ�
	buffer[4] = (uint8)(*addr);          // ����ֽ�
	buffer[5] = (uint8)((*data >> 24));  // ����ֽ�
	buffer[6] = (uint8)((*data >> 16));  // �θ��ֽ�
	buffer[7] = (uint8)((*data >> 8));   // �ε��ֽ�
	buffer[8] = (uint8)(*data);          // ����ֽ�
	
	uint32 transferCount_qspi_1 = 0;
	uint32 option_qspi_1 = SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES | SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE | SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE;
	FT_STATUS status;
	// ���� command
	status = SPI_Write(ftHandle, buffer, sizeof(buffer), &transferCount_qspi_1, option_qspi_1);
	
	APP_CHECK_STATUS(status);
}

void qspi_send_cmd_addr_read(uint8* command, uint32* addr,uint32 data_len)
{
	printf("command=%x\n",*command);
	printf("addr=%x\n", *addr);
	uint8 buffer[9] = { 0 };
	uint8 buffer_dummy[4] = { 0 };
	uint8 dummy = 0;
	buffer[0] = *command;
	// �� addr �� 4 ���ֽ����δ��� buffer��addr �� uint32 ����
	buffer[1] = (uint8)((*addr >> 24));  // ����ֽ�
	buffer[2] = (uint8)((*addr >> 16));  // �θ��ֽ�
	buffer[3] = (uint8)((*addr >> 8));   // �ε��ֽ�
	buffer[4] = (uint8)(*addr);          // ����ֽ�
	uint8 *tx_data_2 = (uint8*)malloc((sizeof(uint32)) * (data_len - 9));
	uint8 *rx_data = (uint8 *)malloc((sizeof(uint32)) * (data_len - 9));
	memset(tx_data_2, 0, sizeof(tx_data_2));
	memset(rx_data, 0, sizeof(rx_data));
	
	for (uint8 i = 0; i < 9; i++) {
		printf("buffer[%d]=%02x\n",i,buffer[i]);
	}
	//uint8 tx_data_2[1024] = { 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 };
	//uint8 rx_data[1024] = { 0 };
	uint32 sizeTransferred = 0;
	uint64 combined_value = 0;
	SPI_Write(ftHandle, buffer, 9, &sizeTransferred,
		SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES | SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE);
	
	sizeTransferred = 0;
	SPI_Write(ftHandle, &dummy, 1, &sizeTransferred,
		SPI_TRANSFER_OPTIONS_SIZE_IN_BITS);
	sizeTransferred = 0;
	SPI_ReadWrite(ftHandle, rx_data,
		tx_data_2, data_len-9, &sizeTransferred,
		SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES | SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE);
	for (uint32 i = 0; i < data_len - 9; i++) {
		printf("rx_data[%d]=%02x\n",i, rx_data[i]);
	}
	//for (int i = 0; i < 4; i++) {
	//	combined_value |= (rx_data[i]) << (8 * (4 - 1 - i));
	//}
	//combined_value <<= 1;
	//uint8 highest_bit = (rx_data[4] & 0x80) >> 7;
	//combined_value |= highest_bit;
	//printf("combined_value = %08x\n", combined_value);
	free(tx_data_2);
	free(rx_data);
}

int main()
{
	FT_STATUS status = FT_OK;
	FT_DEVICE_LIST_INFO_NODE devList = { 0 };
	ChannelConfig channelConf = { 0 };
	uint8 address = 0;
	uint32 channels = 0;
	uint16 data = 0;
	uint8 i = 0;
	uint8 latency = 0;

	channelConf.ClockRate = 100000;
	channelConf.LatencyTimer = latency;
	channelConf.configOptions = SPI_CONFIG_OPTION_MODE0 | SPI_CONFIG_OPTION_CS_DBUS3 | SPI_CONFIG_OPTION_CS_ACTIVELOW;// | SPI_CONFIG_OPTION_CS_ACTIVELOW;
	channelConf.Pin = 0x00000000;/*FinalVal-FinalDir-InitVal-InitDir (for dir 0=in, 1=out)*/

	/* ��ʼ���� */
	Init_libMPSSE();
	status = SPI_GetNumChannels(&channels);
	APP_CHECK_STATUS(status);
	printf("Number of available SPI channels = %d\n", (int)channels);

	if (channels > 0)
	{
		for (i = 0; i < channels; i++)
		{
			status = SPI_GetChannelInfo(i, &devList);
			APP_CHECK_STATUS(status);
			printf("Information on channel number %d:\n", i);
			/* print the dev info */
			printf("		Flags=0x%x\n", devList.Flags);
			printf("		Type=0x%x\n", devList.Type);
			printf("		ID=0x%x\n", devList.ID);
			printf("		LocId=0x%x\n", devList.LocId);
			printf("		SerialNumber=%s\n", devList.SerialNumber);
			printf("		Description=%s\n", devList.Description);
			printf("		ftHandle=0x%x\n", (unsigned int)devList.ftHandle);/*Ϊ0�����Ǵ�*/
		}
		/* �򿪵�һ�����õ�ͨ�� */
		status = SPI_OpenChannel(0, &ftHandle);
		APP_CHECK_STATUS(status);
		printf("\nhandle=0x%x status=0x%x\n", (unsigned int)ftHandle, status);
		status = SPI_InitChannel(ftHandle, &channelConf);
		APP_CHECK_STATUS(status);	
	}
	/*--------------------------------------------���ļ�---------------------------------------------*/
	FILE* file;
	unsigned char* buffer = NULL;
	long file_size = 0;

	file = fopen("D:\\software\\Test_Code\\FT2232_SPI\\Release\\samples\\SPI\\SPI\\hello.rv64.img", "rb");  // ʹ��"rb"ģʽ�򿪶������ļ�
	if (file == NULL) {
		perror("File opening failed");
		return 1;
	}

	// ��ȡ�ļ���С
	fseek(file, 0, SEEK_END);  // �ƶ��ļ�ָ�뵽�ļ�ĩβ
	file_size = ftell(file);   // ��ȡ�ļ���С
	rewind(file);              // ���ļ�ָ���ƻ��ļ���ͷ
	printf("file_size = %ld\n", file_size);

	buffer = (unsigned char*)malloc(file_size);
	if (buffer == NULL) {
		perror("Memory allocation failed");
		fclose(file);
		return 1;
	}

	//��ȡ�ļ����ݵ��ڴ�  
	size_t bytes_read = fread(buffer, 1, file_size, file);
	if (bytes_read != file_size) {
		perror("Reading error");
		free(buffer);
		fclose(file);
		return 1;
	}
	int len = bytes_read / sizeof(int);
	uint32 value[128] = { 0 };

	// ��ӡ�ļ���ǰ64���ֽڣ�����ļ�С��64�ֽ����ӡȫ����
	for (size_t i = 0; i + 3 < bytes_read; i += 4) {  // i + 3 ����С�� bytes_read
		value[i / 4] = buffer[i] | (buffer[i + 1] << 8) | (buffer[i + 2] << 16) | (buffer[i + 3] << 24);
		printf("0x%08X ", value[i / 4]);  // ��ӡ value[i / 4] ������ value
		if ((i / 4 + 1) % 2 == 0) {  // ÿ�д�ӡ4������
			printf("\n");
		}
	}

	printf("\n");
	/*--------------------------------------------���ļ�---------------------------------------------*/

	/*while (1) {*/
	uint32	addr = 0x50000000;
	uint8	command_write = 0x02;
	uint8   command_read = 0x0B;
	uint8   command_read_reg_1 = 0x05;
	uint8   command_read_reg_2 = 0x07;
	uint8   command_write_reg_0 = 0x11;
	uint8   command_write_reg = 0x01;
	uint8   dummy = 0x00;
	uint32  qspi_data = 0x12345678;
	uint32 sizeTransferred = 0;
	uint8 rx_data = 1;
	uint8 rx_data_1[64] = { 0 };
	uint8 tx_data_1[64] = { 0 };
	/*SPI_Write(ftHandle, &command_read_reg_1, 1, &sizeTransferred,
		SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES | SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE);
	SPI_Write(ftHandle, &dummy, 5, &sizeTransferred,
		SPI_TRANSFER_OPTIONS_SIZE_IN_BITS);
	SPI_ReadWrite(ftHandle, &rx_data,
		&dummy, 1, &sizeTransferred,
		SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES | SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE);
	printf("rx_data_1=%x\n", rx_data);*/

	for (uint32 i = 0; i < len; i++) {
		printf("value[%d]=%08x\n",i,value[i]);
	}
	for (uint32 i = 0; i < len; i++) {
		qspi_send_cmd_addr_write(&command_write, &addr, &value[i]);
		addr = addr + 4;
	}
	//SPI_Write(ftHandle, &command_read_reg_2, 1, &sizeTransferred,
	//	SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES | SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE);
	//SPI_Write(ftHandle, &dummy, 5, &sizeTransferred,
	//	SPI_TRANSFER_OPTIONS_SIZE_IN_BITS);
	//rx_data = 1;
	//SPI_ReadWrite(ftHandle, rx_data_1,
	//	tx_data_1, 64, &sizeTransferred,
	//	SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES | SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE);
	//for (uint8 i = 0; i < 64; i++) {
	//	printf("rx_data_1[%d]=%x\n", i, rx_data_1[i]);
	//}

	//printf("addr=%x\n", addr);
	addr = 0x50000004;
	//printf("addr=%x\n", addr);
	uint32 data_len = 0; 
	data_len = ((len+1) * 4)+1;
	printf("data_len=%d\n",data_len);
	qspi_send_cmd_addr_read(&command_read, &addr,data_len);
	
	//addr = addr + 4;
	//qspi_send_cmd_addr_read(&command_read, &addr);
	//printf("addr=%x\n", addr);

	status = SPI_CloseChannel(ftHandle);

	Cleanup_libMPSSE();
	return 0;
}


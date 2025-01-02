# Makefile to build the libMPSSE.dll
# --- macros

EXTERNAL_INC_DIR = ../../../../External/Windows/CDMv2.12.28
ALL_INC = ../../../
ALL_INC_DIR = -I$(EXTERNAL_INC_DIR) -I$(ALL_INC)

ALL_SRC = ../../../
ALL_SRC_DIR = -I$(ALL_SRC)

#Put macros here
#MACROS = -DINFRA_DEBUG_ENABLE
MACROS = 

CC=gcc
AR=ar
LD=ld
#use only o0 during debugging

#flags for release mode compilation
CFLAGS= -O3 -Wall $(MACROS) $(ALL_INC_DIR)

#without profiling & coverage
#CFLAGS=  -g -O0 -Wall $(MACROS) $(ALL_INC_DIR)

#with profiling & coverage
#CFLAGS=  -g -O0 -Wall -fprofile-arcs -ftest-coverage D$(MACROS) $(ALL_INC_DIR)

# i2c only
#OBJECTS= ftdi_infra.o ftdi_mid.o ftdi_i2c.o

# spi only
#OBJECTS= ftdi_infra.o ftdi_mid.o ftdi_spi.o

# i2c and spi
OBJECTS= ftdi_infra.o ftdi_mid.o ftdi_i2c.o ftdi_spi.o

LIBS = -L /MinGW/lib

# --- targets
all:    libMPSSE
libMPSSE:   $(OBJECTS)
		$(CC)  -o libMPSSE.dll -shared $(OBJECTS) $(LIBS) -Wl,--output-def,libMPSSE.def
		$(AR) -rcs libMPSSE.a $(OBJECTS)

ftdi_infra.o: $(INFRA_INC_DIR)
		$(CC) $(CFLAGS) -c $(ALL_SRC)/ftdi_infra.c
		
ftdi_mid.o: $(MIDDLE_INC_DIR)
		$(CC) $(CFLAGS) -c $(ALL_SRC)/ftdi_mid.c
		
ftdi_i2c.o: $(I2C_INC_DIR)
		$(CC) $(CFLAGS) -c $(ALL_SRC)/ftdi_i2c.c

ftdi_spi.o: $(SPI_INC_DIR)
		$(CC) $(CFLAGS) -c $(ALL_SRC)/ftdi_spi.c

# --- remove binary and executable files
#clean:
#		del -f tst $(OBJECTS)

clean :
	del *.i *.o *.exe *.bak *.txt *.dll *.lib *.a *.def *.exp
#	rm tst.o serial.o tst.exe



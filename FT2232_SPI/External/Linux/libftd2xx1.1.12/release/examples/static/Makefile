CC=gcc
CFLAGS=libftd2xx.a -ldl -lrt -lpthread -Wall -Wextra
APP = static_link

all: $(APP)

$(APP): main.c	
	$(CC) main.c -o $(APP) $(CFLAGS)
	
clean:
	rm -f *.o ; rm $(APP)

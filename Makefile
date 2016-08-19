

all: compile program

compile:
	avr-gcc -Os -DF_CPU=15000000UL -mmcu=atmega328p -c -o led.o led.c
	avr-gcc -mmcu=atmega328p led.o -o led.out
	avr-objcopy -O ihex led.out led.hex
	
program:
	sudo avrdude -c avrisp2 -p ATMEGA328P -P /dev/ttyUSB0 -U flash:w:led.hex


clean:
	rm -rf *.o *.out *.hex

	

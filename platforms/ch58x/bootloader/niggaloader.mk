include ../platform.mk



BOOTLOADER_SRC =



bootloader: $(BOOTLOADER_SRC)
	$(CC) $(CFLAGS) $(LDFLAGS) $(MCUFLAGS) -c $(BOOTLOADER_SRC) -O $(BOOTLOADER_SRC).o

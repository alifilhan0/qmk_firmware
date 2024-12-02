# Makefile for CH58x hardware. WIP(Add clang/llvm support)

CC = riscv-none-eabi-gcc
OBJCOPY = riscv-none-eabi-objcopy
OBJDUMP = riscv-none-eabi-objdump
SIZE = riscv-none-eabi-size
AR = riscv-none-eabi-ar
NM = riscv-none-eabi-nm
HEX = $(OBJCOPY) -O ihex
EEP =
BIN = $(OBJCOPY) -O binary


COMPILEFLAGS += -funsigned-char
COMPILEFLAGS += -ffunction-sections
COMPILEFLAGS += -fdata-sections
COMPILEFLAGS += -fshort-enums
COMPILEFLAGS += -mno-ms-bitfields

CFLAGS += $(COMPILEFLAGS)
CFLAGS += -fno-strict-aliasing

CXXFLAGS += $(COMPILEFLAGS)
CXXFLAGS += -fno-exceptions
CXXFLAGS += $(CXXSTANDARD)

LDFLAGS  += -Xlinker --gc-sections -Wl,-Map,keyboard.map -Wl,--print-memory-usage
LDFLAGS  += --specs=nano.specs --specs=nosys.specs
LDFLAGS  += -Wall -nostartfiles
LDFLAGS	 += -TLink_APP.ld -lISP583 -lRV3UFI -lBLECH58x
MCUFLAGS += -march=rv32imac -mabi=ilp32 -mcmodel=medany -msmall-data-limit=8 -mno-save-restore -fmessage-length=0 -fsigned-char

ASFLAGS += $(CFLAGS) $(COMPILEFLAGS) $(MCUFLAGS)

VENDOR_MK 		+= $(PLATFORM_COMMON_DIR)/vendor/vendor.mk
BOOTLOADER_MK 	+= $(PLATFORM_COMMON_DIR)/bootloader/bootloader.mk
CHERRYUSB_MK	+= $(PLATFORM_COMMON_DIR)/usb/cherryusb.mk

include $(VENDOR_MK)
include $(BOOTLOADER_MK)
include $(CHERRYUSB_MK)

#Using CherryUSB's stack for the USB support in this module.

PLATFORM_SRC += $(VENDORSRC) \
				eeprom/*.c	\
				*.c	\
				$(CHERRYUSB)

EXTRAINCDIRS += $(PLATFORM_COMMON_DIR)/vendor/HAL/include	\
				$(PLATFORM_COMMON_DIR)/vendor/printf	\
				$(PLATFORM_COMMON_DIR)/vendor/RVMVSIS	\
				$(PLATFORM_COMMON_DIR)/vendor/StdPeriphDriver/inc	\
				$(PLATFORM_COMMON_DIR)/vnedor/USB_LIB	\
				$(PLATFORM_COMMON_DIR)/eeprom	\
				$(PLATFORM_COMMON_DIR)/bootloader/IAP	\
				$(TOP_DIR)/tmk_core/protocol/ch5xx	\
				$(PLATFORM_COMMON_DIR)/bootloader/mcuboot-main/ext/mbedtls/include	\
				$(PLATFORM_COMMON_DIR)/bootloader/mcuboot-main/ext/mbedtls/library	\
				$(PLATFORM_COMMON_DIR)/bootloader/mcuboot_porting	\
				$(PLATFORM_COMMON_DIR)/bootloader/mcuboot-main/boot/bootutil/include	\
				$(PLATFORM_COMMON_DIR)/cherryusb/


EXTRALIBDIRS = $(PLATFORM_COMMON_DIR)/vendor/BLE_LIB	\
				$(PLATFORM_COMMON_DIR)/vendor/MESH_LIB	\
				$(PLATFORM_COMMON_DIR)/vendor/USB_LIB	\
				$(PLATFORM_COMMON_DIR)/vendor/StdPeriphDriver
				
				
bin: $(BUILD_DIR)/$(TARGET).hex
	$(OBJCOPY) -I ihex -O binary $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin
	$(COPY) $(BUILD_DIR)/$(TARGET).bin $(TARGET).bin

	

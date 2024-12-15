MCUBOOT_SRC	=	$(PLATFORM_COMMON_DIR)/bootloader/mcuboot-main/boot/bootutil/src/*.c	\
				$(PLATFORM_COMMON_DIR)/bootloader/mcuboot_porting/mcuboot_port.c


MBEDTLS_SRC = 	$(PLATFORM_COMMON_DIR)/bootloader/mcuboot-main/ext/mbedtls/library/[^x][^5]*.c

BOOTLOADER_SRC =  ${PLATFORM_COMMON_DIR}/bootloader/IAP/*.c 	\
					${PLATFORM_COMMON_DIR}/battery_measure.c	\
					${PLATFORM_COMMON_DIR}/bootloader.c	\
					${PLATFORM_COMMON_DIR}/gpio.c	\
					${PLATFORM_COMMON_DIR}/retention_register.c	\
					${PLATFORM_COMMON_DIR}/cherryusb/core/usbd_core.c	\
					${PLATFORM_COMMON_DIR}/cherryusb/port/ch32/usb_ch58x_dc_usbfs.c	\
					${PLATFORM_COMMON_DIR}/cherryusb/class/msc/usbd_msc.c	\
					${CMAKE_CURRENT_LIST_DIR}/platforms/ch58x/eeprom/eeprom_wear_leveling.c	\
					${CMAKE_CURRENT_LIST_DIR}/platforms/ch58x/eeprom/wear_leveling_ch58x.c	\
					${CMAKE_CURRENT_LIST_DIR}/platforms/ch58x/eeprom/wear_leveling.c		\
					${CMAKE_CURRENT_LIST_DIR}/platforms/ch58x/eeprom/fnv/*.c	\
					$(VENDORSRC)	\
					$(MCUBOOT_SRC)	\
					$(MBEDTLS_SRC)

BOOTLOADER_INCDIRS = -I$(PLATFORM_COMMON_DIR)/vendor/HAL/include	\
				-I$(PLATFORM_COMMON_DIR)/vendor/printf	\
				-I$(PLATFORM_COMMON_DIR)/vendor/RVMVSIS	\
				-I$(PLATFORM_COMMON_DIR)/vendor/StdPeriphDriver/inc	\
				-I$(PLATFORM_COMMON_DIR)/vendor/USB_LIB	\
				-I$(PLATFORM_COMMON_DIR)/eeprom	\
				-I$(PLATFORM_COMMON_DIR)/bootloader/IAP	\
				-I$(TOP_DIR)/tmk_core/protocol/ch5xx	\
				-I$(PLATFORM_COMMON_DIR)/bootloader/mcuboot-main/ext/mbedtls/include	\
				-I$(PLATFORM_COMMON_DIR)/bootloader/mcuboot-main/ext/mbedtls/library	\
				-I$(PLATFORM_COMMON_DIR)/bootloader/mcuboot_porting	\
				-I$(PLATFORM_COMMON_DIR)/bootloader/mcuboot-main/boot/bootutil/include	\
				-I$(PLATFORM_COMMON_DIR)/cherryusb/

BOOTLOADER_LDFLAGS = -L$(PLATFORM_COMMON_DIR)/vendor/BLE_LIB	\
				-L$(PLATFORM_COMMON_DIR)/vendor/MESH_LIB	\
				-L$(PLATFORM_COMMON_DIR)/vendor/USB_LIB	\
				-L$(PLATFORM_COMMON_DIR)/vendor/StdPeriphDriver	\
				$(LDLAGS) -TLink_IAP.ld

BOOTLOADER_DEFS = -D__BUILDING_IAP__

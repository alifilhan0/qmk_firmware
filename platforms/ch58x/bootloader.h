/*
Copyright 2024 Alif Ilhan <https://github.com/alifilhan0>
Copyright 2022 Huckies <https://github.com/Huckies>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#pragma once

#if __BUILDING_APP__
#ifdef USB_ENABLE
#include "protocol_usb.h"
#endif
#ifdef BLE_ENABLE
#include "protocol_ble.h"
#endif
#ifdef ESB_ENABLE
#include "protocol_esb.h"
#endif
#include "config.h"
#endif

enum {
    BOOTLOADER_BOOT_MODE_IAP = 0x05,
    BOOTLOADER_BOOT_MODE_USB = 0x0A,
    BOOTLOADER_BOOT_MODE_BLE = 0x50,
    BOOTLOADER_BOOT_MODE_ESB = 0xA0,
};

extern volatile uint8_t kbd_protocol_type;

bool bootmagic_allow_jump();
void bootloader_boot_mode_set(uint8_t mode);
uint8_t bootloader_boot_mode_get();
void bootloader_select_boot_mode();
uint8_t bootloader_set_to_default_mode(const char *reason);
void bootloader_jump();
void mcu_reset();

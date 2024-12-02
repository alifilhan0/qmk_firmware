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

#include "quantum_keycodes.h"
#include "action.h"
#include "quantum.h"

enum {
#ifdef VIA_ENABLE
    CUSTOM_START = QK_KB_0 - 1,
#else
    CUSTOM_START = SAFE_RANGE,
#endif
    USB_MODE,
    BLE_SLOT0,
    BLE_SLOT1,
    BLE_SLOT2,
    BLE_SLOT3,
    BLE_SLOT4,
    BLE_SLOT5,
    BLE_SLOT6,
    BLE_SLOT7,
    BLE_SLOT8,
    BLE_SLOT9,
    BLE_SLOT10,
    BLE_SLOT11,
    BLE_SLOT12,
    BLE_SLOT13,
    BLE_SLOT14,
    BLE_SLOT15,
    BLE_ALL_CLEAR,
    ESB_MODE,
    BATTERY_INDICATOR,
    CUSTOM_MAX,
    NEW_SAFE_RANGE = CUSTOM_MAX,
};

#ifdef VIA_ENABLE
_Static_assert(CUSTOM_MAX <= QK_KB_31 + 1, "");
#endif

#
# Copyright 2020 The LineageOS Project.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/bq/kaito

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Thermal
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/thermal/.ht120.mtc:system/etc/.tp/.ht120.mtc \
    $(DEVICE_PATH)/configs/thermal/thermal.conf:system/etc/.tp/thermal.conf \
    $(DEVICE_PATH)/configs/thermal/thermal.off.conf:system/etc/.tp/thermal.off.conf

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=MediaTekRIL

# Call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

# Vendor
$(call inherit-product-if-exists, vendor/bq/kaito/kaito-vendor.mk)

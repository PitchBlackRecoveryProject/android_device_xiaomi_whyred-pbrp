#
# Copyright 2017 The Android Open Source Project
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

# Release name
PRODUCT_RELEASE_NAME := whyred
DEVICE_PATH := device/xiaomi/whyred

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/pb/config/common.mk)

cc_prebuilt_binary += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := whyred
PRODUCT_NAME := omni_whyred
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi Note 5 Pro
PRODUCT_MANUFACTURER := Xiaomi

# enable stock zip packages flash
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=1 \
    ro.adb.secure=0 \
    ro.allow.mock.location=0 \
    ro.hardware.keystore=sdm660 \
    ro.hardware.gatekeeper=sdm660

# Blacklist Properties
PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.build.date \
    ro.build.date.utc

# [E] El builder usa el prefijo twrp_<DEVICE_NAME> en el README del proyecto; se registran ambos productos
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_dew.mk \
    $(LOCAL_DIR)/fox_dew.mk

COMMON_LUNCH_CHOICES := \
    twrp_dew-eng \
    twrp_dew-userdebug \
    fox_dew-eng \
    fox_dew-userdebug

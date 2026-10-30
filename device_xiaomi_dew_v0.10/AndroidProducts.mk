# [E] El builder pide twrp_<DEVICE_NAME> (lo confirma el log: product spec twrp_dew). Se registran ambos productos.
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_dew.mk \
    $(LOCAL_DIR)/fox_dew.mk

COMMON_LUNCH_CHOICES := \
    twrp_dew-eng \
    twrp_dew-userdebug \
    fox_dew-eng \
    fox_dew-userdebug

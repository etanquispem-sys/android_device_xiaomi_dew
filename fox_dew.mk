# fox_dew.mk v0.4
# Leyenda: [V] verificado | [E] plantilla estandar | [?] pendiente
$(call inherit-product, device/xiaomi/dew/device.mk)

# [V] ro.product.vendor.device y ro.product.board
PRODUCT_DEVICE := dew
# [E] debe coincidir con el nombre del makefile
PRODUCT_NAME := fox_dew
# [V]
PRODUCT_BRAND := Redmi
# [E]
PRODUCT_MANUFACTURER := Xiaomi
# [?] confirmar con: adb shell getprop ro.product.model
PRODUCT_MODEL := Redmi 15C 4G

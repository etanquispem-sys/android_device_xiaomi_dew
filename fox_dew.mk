# fox_dew.mk v0.7
# Leyenda: [V] verificado | [E] plantilla estandar | [?] pendiente
$(call inherit-product, device/xiaomi/dew/device.mk)

# [V] ro.product.vendor.device y ro.product.board
PRODUCT_DEVICE := dew
# [E] debe coincidir con el nombre del makefile
PRODUCT_NAME := fox_dew
# [E] nombre de release que usan los scripts de version
PRODUCT_RELEASE_NAME := dew
# [V]
PRODUCT_BRAND := Redmi
# [E]
PRODUCT_MANUFACTURER := Xiaomi
# [V] adb shell getprop ro.product.model
PRODUCT_MODEL := 25078RA3EL

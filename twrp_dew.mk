# twrp_dew.mk v0.2
# Leyenda: [V] verificado en tus imágenes | [E] plantilla estándar | [?] pendiente
$(call inherit-product, device/xiaomi/dew/device.mk)

PRODUCT_DEVICE := dew                 # [V] ro.product.vendor.device / ro.product.board
PRODUCT_NAME := twrp_dew              # [E] debe coincidir con el nombre del makefile
PRODUCT_BRAND := Redmi                # [V]
PRODUCT_MANUFACTURER := Xiaomi        # [E]
PRODUCT_MODEL := Redmi 15C 4G         # [?] confirmar con: adb shell getprop ro.product.model

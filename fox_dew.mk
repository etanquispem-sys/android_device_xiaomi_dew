# Leyenda: [V] verificado en tus imágenes | [E] plantilla estándar, validar con el log | [?] pendiente

# [E] La ruta del makefile común de la rama de OrangeFox/TWRP puede variar; si falta, el log lo dirá
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

PRODUCT_DEVICE := dew                 # [V] ro.product.vendor.device / ro.product.board
PRODUCT_NAME := fox_dew               # [E] debe coincidir con DEVICE_MAKEFILE (fox_dew.mk)
PRODUCT_BRAND := Redmi                # [V] brand Redmi
PRODUCT_MANUFACTURER := Xiaomi        # [E]
PRODUCT_MODEL := Redmi 15C 4G         # [?] confirmar con: adb shell getprop ro.product.model

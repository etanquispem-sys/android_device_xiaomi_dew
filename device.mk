# device.mk v0.2 - dew
# [E] plantilla estándar; si el log reclama otra ruta del makefile común de la rama, se ajusta
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product-if-exists, vendor/twrp/config/common.mk)

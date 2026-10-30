# device.mk v0.5 - dew
# Corrige el error del build #1 "Building a 32-bit-app-only product on a 64-bit device".
# core_64_bit.mk fija TARGET_SUPPORTS_32_BIT_APPS y TARGET_SUPPORTS_64_BIT_APPS en true [V, AOSP].
# La propia AOSP indica que su herencia debe ir ANTES de la cadena que lleva a core_minimal.mk.
# El dispositivo usa zygote64_32 [V], que es lo que configura core_64_bit.mk.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
# [E] la ruta del makefile comun de la rama puede variar; si falta, el log lo dira
$(call inherit-product-if-exists, vendor/twrp/config/common.mk)

# [E] plataforma para los scripts de OrangeFox/TWRP
PRODUCT_PLATFORM := mt6768

# Virtual A/B y particiones dinamicas [?]: activar en el build aparte, junto con las lineas
# comentadas de BoardConfig.mk. Necesario para OTA/sideload y para que el recovery maneje snapshots.
# $(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
# PRODUCT_USE_DYNAMIC_PARTITIONS := true

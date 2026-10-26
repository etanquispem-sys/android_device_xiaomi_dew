# device.mk v0.3 - dew
# Corrige el error del build #1: "Building a 32-bit-app-only product on a 64-bit device".
# core_64_bit.mk define TARGET_SUPPORTS_32_BIT_APPS y TARGET_SUPPORTS_64_BIT_APPS := true [V, AOSP] y la propia
# AOSP indica que su herencia debe ir ANTES de la cadena que lleva a core_minimal.mk, por eso va primero.
# El dispositivo usa zygote64_32 [V], que es lo que configura core_64_bit.mk.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
# [E] la ruta del makefile común de la rama puede variar; si falta, el log lo dirá
$(call inherit-product-if-exists, vendor/twrp/config/common.mk)

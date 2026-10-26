# device_xiaomi_dew (borrador v0.3)
Redmi 15C 4G (dew, MT6768). Recovery en vendor_boot (header v4).

Archivos: AndroidProducts.mk, BoardConfig.mk, device.mk, twrp_dew.mk, fox_dew.mk, recovery.fstab,
recovery/root/init.recovery.mt6768.rc

Leyenda en cada archivo: [V] verificado en imágenes, [R] patrón de un árbol público de MT6769H, [E] plantilla estándar, [?] pendiente.

Cambios v0.2 (ver también v0.3 abajo): base de direcciones alineada con el árbol de referencia (mismo resultado absoluto), productos twrp_dew y fox_dew,
flag de fastbootd, init.recovery.mt6768.rc, y metadata encryption confirmada en la documentación de AOSP.
Pendiente: resolución, brillo, touch, particiones lógicas, descifrado (2.º build).
No subir imágenes ni módulos del firmware a este repositorio.

v0.3: resolución 720x1600, touch Novatek NT36528 (SPI) con TW_LOAD_VENDOR_MODULES y /vendor_dlkm en recovery.fstab. Aún sin probar en el teléfono.

v0.3.1: device.mk hereda core_64_bit.mk antes de base.mk (error del build #1: 32-bit-app-only en dispositivo de 64 bits).

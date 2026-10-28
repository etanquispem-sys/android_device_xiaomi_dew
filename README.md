# device_xiaomi_dew 
Redmi 15C 4G (dew, MT6768). Recovery en vendor_boot (header v4).

Archivos: AndroidProducts.mk, BoardConfig.mk, device.mk, twrp_dew.mk, fox_dew.mk, recovery.fstab,
recovery/root/init.recovery.mt6768.rc

Leyenda en cada archivo: [V] verificado en imagenes, [R] patron de un arbol publico de MT6769H, [E] plantilla estandar, [?] pendiente.

Cambios v0.2 (ver tambien v0.3 abajo): base de direcciones alineada con el arbol de referencia (mismo resultado absoluto), productos twrp_dew y fox_dew,
flag de fastbootd, init.recovery.mt6768.rc, y metadata encryption confirmada en la documentacion de AOSP.
Pendiente: resolucion, brillo, touch, particiones logicas, descifrado (2.o build).
No subir imagenes ni modulos del firmware a este repositorio.

v0.3: resolucion 720x1600, touch Novatek NT36528 (SPI) con TW_LOAD_VENDOR_MODULES y /vendor_dlkm en recovery.fstab. Aun sin probar en el telefono.

v0.3.1: device.mk hereda core_64_bit.mk antes de base.mk (error del build #1: 32-bit-app-only en dispositivo de 64 bits).

v0.4: sin TARGET_COPY_OUT_PRODUCT/VENDOR (error del build #2); sin comentarios en la misma linea que un valor (en make, el espacio antes de # queda en el valor y rompe ifeq ... true); fstab sin comentarios en linea.

v0.5: TW_BRIGHTNESS_PATH, TW_MAX_BRIGHTNESS y TW_DEFAULT_BRIGHTNESS (OrangeFox los exige; error del build #3). Valores provisionales de MediaTek.

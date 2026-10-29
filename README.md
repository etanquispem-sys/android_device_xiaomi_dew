# device_xiaomi_dew (borrador v0.8)
Redmi 15C 4G (dew, MT6768). Recovery en vendor_boot (header v4). Sin probar en el telefono.

Archivos: AndroidProducts.mk, BoardConfig.mk, device.mk, twrp_dew.mk, fox_dew.mk, recovery.fstab,
recovery/root/init.recovery.mt6768.rc

Leyenda en cada archivo: [V] verificado en imagenes, [R] patron de un arbol publico de MT6769H, [E] plantilla estandar, [?] pendiente.
Regla de estilo: ningun comentario en la misma linea que un valor (en make, el espacio antes de # queda en el valor y rompe ifeq y las listas).
No subir imagenes ni modulos del firmware a este repositorio.

## Estado
Hecho: resolucion 720x1600, touch Novatek NT36528 (SPI) via TW_LOAD_VENDOR_MODULES, fastbootd, A/B, tamanos de particion, fstab base.
Pendiente: brillo real, TW_INPUT_BLACKLIST, particiones logicas en recovery.fstab, Virtual A/B + particiones dinamicas (bloques comentados en BoardConfig.mk y device.mk), descifrado FBE (2.o build, flags listos y comentados al final de BoardConfig.mk).

## Cambios
v0.2: base de direcciones alineada con el arbol de referencia, productos twrp_dew y fox_dew, flag de fastbootd, init.recovery.mt6768.rc, metadata encryption confirmada en AOSP.
v0.3: resolucion, touch NT36528 y /vendor_dlkm en recovery.fstab.
v0.3.1: device.mk hereda core_64_bit.mk antes de base.mk (build #1).
v0.4: sin TARGET_COPY_OUT_PRODUCT/VENDOR (build #2); sin comentarios en linea.
v0.5: TW_BRIGHTNESS_PATH, TW_MAX_BRIGHTNESS y TW_DEFAULT_BRIGHTNESS (build #3). Valores provisionales.
v0.6: AB_OTA_PARTITIONS (build #5); PRODUCT_MODEL = 25078RA3EL [V].
v0.6.1: marcador DEW-DIAG (build #6 repitio el error de AB_OTA_PARTITIONS).
v0.7: TARGET_COPY_OUT_VENDOR := vendor para el conflicto rsync root/vendor (build #7).
v0.8: el marcador DEW-DIAG estaba descrito pero su linea $(warning) no existia; restaurada. PRODUCT_RELEASE_NAME y PRODUCT_PLATFORM. Bloques comentados de Virtual A/B y particiones dinamicas. Limpieza de lineas en blanco y comentarios.

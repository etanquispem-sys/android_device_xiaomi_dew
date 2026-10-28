# BoardConfig.mk v0.6 - dew (Redmi 15C 4G, MT6768)
#
# Leyenda (siempre en lineas aparte, nunca detras de un valor):
#   [V] verificado en tus imagenes, en fastboot o en lsmod
#   [R] patron de un arbol OFRP publico de MT6769H que compila
#   [E] plantilla estandar
#   [?] pendiente
# Regla de estilo: ningun comentario en la misma linea que un valor. En make, el espacio antes
# de un # queda dentro del valor y rompe ifeq(...,true) y las listas.

DEVICE_PATH := device/xiaomi/dew

# Minimal manifest [R]
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# A/B [V] ro.build.ab_update=true, Virtual A/B con compresion
AB_OTA_UPDATER := true
# AOSP exige AB_OTA_PARTITIONS cuando hay AB_OTA_UPDATER (error del build #5, Makefile:4904).
# Lista = particiones de arranque con slot _a/_b [V] segun fastboot getvar all (has-slot: yes).
AB_OTA_PARTITIONS := boot init_boot vendor_boot dtbo vbmeta vbmeta_system vbmeta_vendor

# Arquitectura [V] abi arm64-v8a, zygote64_32. Variantes [E] conservadoras
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# Plataforma [V] mt6768, ro.product.board=dew
TARGET_BOARD_PLATFORM := mt6768
TARGET_BOOTLOADER_BOARD_NAME := dew
# [E] el kernel es el de boot.img stock; si el log pide kernel, se quita
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
# [R]
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2127-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Header vendor_boot v4 [V]. Direcciones absolutas: kernel 0x40080000, ramdisk 0x47c80000, tags y dtb 0x4bc80000.
# La division base 0x40078000 + offsets reproduce esas direcciones y coincide con el arbol MT6769H de referencia [R]:
# 0x40078000+0x00008000=0x40080000 | +0x07c08000=0x47c80000 | +0x0bc08000=0x4bc80000
BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_DTB_OFFSET := 0x0bc08000
# cmdline de vendor_boot [V], identico al del arbol de referencia [R]
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_MKBOOTIMG_ARGS += --header_version 4 --pagesize 4096
BOARD_MKBOOTIMG_ARGS += --kernel_offset 0x00008000 --ramdisk_offset 0x07c08000
BOARD_MKBOOTIMG_ARGS += --tags_offset 0x0bc08000 --dtb_offset 0x0bc08000

# Recovery dentro de vendor_boot [V] (documentacion AOSP de vendor_boot)
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
# [E] el formato stock es LZ4 legacy [V]; confirmar el nombre del flag en el log
BOARD_RAMDISK_USE_LZ4 := true

# Tamanos de particion [V] fastboot getvar all: boot y vendor_boot 0x4000000, init_boot 0x800000
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
# [V] super = 0x240000000 = 9663676416 B, sin slot (Virtual A/B). Solo informativo:
# BOARD_SUPER_PARTITION_SIZE := 9663676416

# Sistemas de archivos [V] /data es f2fs
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
# [R]
BOARD_SUPPRESS_SECURE_ERASE := true

# TARGET_COPY_OUT_PRODUCT / TARGET_COPY_OUT_VENDOR: NO se definen a proposito.
# Con TARGET_COPY_OUT_PRODUCT := product, AOSP exige BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE o una imagen prebuilt
# (error del build #2). No hacen falta para un recovery.

# /metadata [V] f2fs
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata

# Recovery e interfaz
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
# [V] densidad 320 y resolucion 720x1600
TARGET_SCREEN_DENSITY := 320
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1600
# [R] si los colores salen invertidos, se cambia el formato de pixel
TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TW_FRAMERATE := 60
# Brillo [?]. OrangeFox exige TW_MAX_BRIGHTNESS (error del build #3, orangefox.mk:709).
# Valores provisionales tipicos de MediaTek, tomados del arbol de referencia MT6769H [R]. Confirmar con:
#   adb shell cat /sys/class/leds/lcd-backlight/max_brightness
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TW_EXTRA_LANGUAGES := true
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_HAS_MTP := true
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_TWRPAPP := true
TW_INCLUDE_FB2PNG := true
TARGET_USES_MKE2FS := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_FUSE_NTFS := true

# fastbootd [R] nombre del flag confirmado en el arbol de referencia. El recovery stock lo trae [V]
TW_INCLUDE_FASTBOOTD := true

# Touch [V]: Novatek NT36528 por SPI (NVTCapacitiveTouchScreen, bus SPI).
# Sus modulos viven en vendor_dlkm y NO estan en el recovery stock.
# Orden segun dependencias de lsmod [V]: lct_tp -> xiaomi_touch -> nt36528_spi.
# El resto (miev, mtk_disp_notify, mtk_panel_ext, spi-mt65xx, paneles p15a) ya va en vendor_boot [V].
# [E] lista de modulos entre comillas; requiere montar /vendor_dlkm
TW_LOAD_VENDOR_MODULES := "lct_tp.ko xiaomi_touch.ko nt36528_spi.ko"

# [?] Pendiente: TW_INPUT_BLACKLIST
# [?] TW_EXCLUDE_DEFAULT_USB_INIT no se activa: init.recovery.mt6768.rc fija musb-hdrc + configfs [V]

# Descifrado: DESACTIVADO en el primer build a proposito.
# [V] /data = f2fs + FBE v2 aes-256-xts:aes-256-cts + metadata encryption (keydirectory=/metadata/vold/metadata_encryption,
# algoritmo por defecto aes-256-xts, sin wrappedkey) segun la documentacion AOSP.
# [V] los HAL beanpod no estan en el recovery stock: hay que traer los binarios del vendor.
# Flags listos para el segundo build [R]:
# TW_INCLUDE_CRYPTO := true
# TW_INCLUDE_CRYPTO_FBE := true
# TW_INCLUDE_FBE_METADATA_DECRYPT := true
# TW_PREPARE_DATA_MEDIA_EARLY := true

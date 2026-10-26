# BoardConfig.mk v0.3 - dew (Redmi 15C 4G, MT6768)
# Leyenda: [V] verificado en tus imágenes | [R] patrón tomado de un árbol OFRP público de MT6769H (fire) que compila; validar con el log
#          [E] plantilla estándar | [?] pendiente
# Objetivo del primer build: que COMPILE y ARRANQUE. El descifrado va después.
DEVICE_PATH := device/xiaomi/dew

# Minimal manifest [R]
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# A/B [V] ro.build.ab_update=true, Virtual A/B con compresión
AB_OTA_UPDATER := true

# Arquitectura [V] abi arm64-v8a, zygote64_32; variantes [E] conservadoras
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

# Plataforma
TARGET_BOARD_PLATFORM := mt6768                  # [V]
TARGET_BOOTLOADER_BOARD_NAME := dew              # [V] ro.product.board
TARGET_NO_BOOTLOADER := true                     # [E]
TARGET_NO_KERNEL := true                         # [E] el kernel es el de boot.img stock; si el log pide kernel, se quita
PLATFORM_VERSION := 99.87.36                     # [R]
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2127-12-31            # [R]
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Header vendor_boot v4. [V] direcciones absolutas: kernel 0x40080000, ramdisk 0x47c80000, tags/dtb 0x4bc80000
# La división base 0x40078000 + offsets coincide con el árbol MT6769H de referencia [R] y reproduce esas direcciones:
#   0x40078000+0x00008000=0x40080000 | +0x07c08000=0x47c80000 | +0x0bc08000=0x4bc80000
BOARD_BOOT_HEADER_VERSION := 4                   # [V]
BOARD_KERNEL_PAGESIZE := 4096                    # [V]
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_DTB_OFFSET := 0x0bc08000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2   # [V] cmdline de vendor_boot (idéntico al árbol de referencia [R])
BOARD_MKBOOTIMG_ARGS += --header_version 4 --pagesize 4096
BOARD_MKBOOTIMG_ARGS += --kernel_offset 0x00008000 --ramdisk_offset 0x07c08000
BOARD_MKBOOTIMG_ARGS += --tags_offset 0x0bc08000 --dtb_offset 0x0bc08000

# Recovery dentro de vendor_boot [V] (documentación AOSP de vendor_boot)
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_RAMDISK_USE_LZ4 := true                    # [E] el formato stock es LZ4 legacy [V]; confirmar el nombre en el log

# Tamaños de partición [V] fastboot getvar all: boot_a/b 0x4000000, vendor_boot_a/b 0x4000000, init_boot_a/b 0x800000, dtbo_a/b 0x800000
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
# [V] super = 0x240000000 = 9663676416 B, sin slot (Virtual A/B). Solo informativo para recovery:
# BOARD_SUPER_PARTITION_SIZE := 9663676416

# Sistemas de archivos
TARGET_USERIMAGES_USE_EXT4 := true               # [E]
TARGET_USERIMAGES_USE_F2FS := true               # [V]
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs     # [V]
BOARD_SUPPRESS_SECURE_ERASE := true              # [R]

# Workaround de copia de archivos de vendor/product al ramdisk [R]
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product

# /metadata [V] f2fs
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata

# Recovery / interfaz
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_SCREEN_DENSITY := 320                     # [V] ro.sf.lcd_density
TARGET_SCREEN_WIDTH := 720                       # [V] wm size
TARGET_SCREEN_HEIGHT := 1600                     # [V] wm size
TW_THEME := portrait_hdpi                        # [R]
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888        # [R] si los colores salen invertidos, se cambia
TW_FRAMERATE := 60                               # [R]
TW_EXTRA_LANGUAGES := true                       # [R]
TW_USE_TOOLBOX := true                           # [R]
TW_INCLUDE_REPACKTOOLS := true                   # [R]
TW_INCLUDE_RESETPROP := true                     # [R]
TW_INCLUDE_LIBRESETPROP := true                  # [R]
TWRP_INCLUDE_LOGCAT := true                      # [R]
TARGET_USES_LOGD := true                         # [R]
TW_SCREEN_BLANK_ON_BOOT := true                  # [R]
TW_HAS_MTP := true                               # [R]
RECOVERY_SDCARD_ON_DATA := true                  # [R]
TW_EXCLUDE_TWRPAPP := true                       # [R]
TW_INCLUDE_FB2PNG := true                        # [R]
TARGET_USES_MKE2FS := true                       # [R]
TW_INCLUDE_NTFS_3G := true                       # [R]
TW_INCLUDE_FUSE_EXFAT := true                    # [R]
TW_INCLUDE_FUSE_NTFS := true                     # [R]

# fastbootd [R] nombre del flag confirmado en el árbol de referencia. El recovery stock lo trae [V] (system/bin/fastbootd)
TW_INCLUDE_FASTBOOTD := true

# Touch [V]: Novatek NT36528 por SPI (NVTCapacitiveTouchScreen, bus SPI). Sus módulos viven en vendor_dlkm y NO están
# en el recovery stock. Orden según dependencias de lsmod [V]: lct_tp -> xiaomi_touch -> nt36528_spi.
# El resto de dependencias (miev, mtk_disp_notify, mtk_panel_ext, spi-mt65xx, paneles p15a) ya van en vendor_boot [V].
TW_LOAD_VENDOR_MODULES := "lct_tp.ko xiaomi_touch.ko nt36528_spi.ko"   # [E] lista de módulos entre comillas; requiere montar /vendor_dlkm

# [?] Pendientes de datos del teléfono:
# TW_BRIGHTNESS_PATH := ...       (ruta del backlight)
# TW_MAX_BRIGHTNESS := ...
# TW_INPUT_BLACKLIST := ...
# [?] TW_EXCLUDE_DEFAULT_USB_INIT: no se activa; init.recovery.mt6768.rc fija musb-hdrc + configfs [V]

# Descifrado: DESACTIVADO en el primer build a propósito.
# [V] /data = f2fs + FBE v2 aes-256-xts:aes-256-cts + metadata encryption (keydirectory=/metadata/vold/metadata_encryption,
#     algoritmo por defecto aes-256-xts, sin wrappedkey) según la documentación AOSP de metadata encryption.
# [V] HALs beanpod no incluidos en el recovery stock: hay que traer los binarios del vendor.
# Flags listos para el segundo build [R]:
# TW_INCLUDE_CRYPTO := true
# TW_INCLUDE_CRYPTO_FBE := true
# TW_INCLUDE_FBE_METADATA_DECRYPT := true
# TW_PREPARE_DATA_MEDIA_EARLY := true

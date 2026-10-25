# Leyenda: [V] verificado en tus imágenes | [D] derivado | [E] plantilla estándar, validar con el log | [?] pendiente
# Primer objetivo: que ARRANQUE. El descifrado y el touch van después.
DEVICE_PATH := device/xiaomi/dew

# Arquitectura: [V] abi arm64-v8a (zygote64_32); [E] variante generic
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

# Plataforma
TARGET_BOARD_PLATFORM := mt6768           # [V]
TARGET_BOOTLOADER_BOARD_NAME := dew       # [V] ro.product.board
TARGET_NO_BOOTLOADER := true              # [E]
AB_OTA_UPDATER := true                    # [V] ro.build.ab_update=true

# Header y direcciones de vendor_boot (v4). [V] direcciones absolutas; [D] la división base/offset
BOARD_BOOT_HEADER_VERSION := 4            # [V]
BOARD_KERNEL_PAGESIZE := 4096             # [V]
BOARD_KERNEL_BASE := 0x40000000           # [D]
BOARD_KERNEL_OFFSET := 0x00080000         # [V] 0x40080000
BOARD_RAMDISK_OFFSET := 0x07c80000        # [V] 0x47c80000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc80000    # [V] 0x4bc80000
BOARD_DTB_OFFSET := 0x0bc80000            # [V] 0x4bc80000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2   # [V] cmdline de vendor_boot

# Recovery dentro de vendor_boot [V] (documentación AOSP de vendor_boot)
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_RAMDISK_USE_LZ4 := true             # [E] el formato stock es LZ4 legacy [V]; confirmar el nombre del flag en el log

# Tamaños de partición [V si tus archivos son dumps completos]
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864

# Sistemas de archivos
TARGET_USERIMAGES_USE_EXT4 := true        # [E]
TARGET_USERIMAGES_USE_F2FS := true        # [V] /data es f2fs

# fstab: v0.1 adaptado de fstab.mt6768 [V]; el formato exacto se valida con el log y el primer arranque [E]
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# Pantalla: [V] densidad 320; [?] resolución sin confirmar
# TARGET_SCREEN_DENSITY := 320
# TARGET_SCREEN_WIDTH := ?
# TARGET_SCREEN_HEIGHT := ?

# Descifrado (desactivado en el primer arranque a propósito) [?]
# FBE v2 aes-256-xts, sin wrappedkey [V]; HALs beanpod [V]; falta traer los binarios del vendor
# TW_INCLUDE_CRYPTO := true
# TW_INCLUDE_CRYPTO_FBE := true

# Touch: [?] pendiente de /proc/bus/input/devices

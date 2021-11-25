#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:2a7a9ac8f792709b444c961cb7c460ef7ac7ea67; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:61444362d18449a25b4690f99d5d1d35cf9b8719 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:2a7a9ac8f792709b444c961cb7c460ef7ac7ea67 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

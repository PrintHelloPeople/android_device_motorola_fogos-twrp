#!/sbin/sh

# Reference: https://dumps.tadiphone.dev/dumps/motorola/devon/-/blob/2e2fbd5c0267953cd52bd917370bdaddf6a7e1fe/vendor/bin/init.mmi.touch.sh#L447-L498

touch_class_path=/sys/class/touchscreen
touch_instance=ft3681
firmware_path=/vendor/firmware
firmware_file=focaltech-csot-ft3681-22-0000-fogos.bin

if [ -d $touch_class_path/$touch_instance ]; then
  cd $firmware_path

  touch_path=/sys$(cat $touch_class_path/$touch_instance/path)

  echo "forcing firmware upgrade"
  echo 1 > $touch_path/forcereflash

  echo "sending reflash command"
  echo 0 > $touch_path/flash_mode
  echo $firmware_file > $touch_path/doreflash
fi

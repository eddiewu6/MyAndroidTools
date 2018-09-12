adb devices

adb shell screencap -p /sdcard/screen.png
adb pull -p -a /sdcard/screen.png Screenshots\.
adb shell rm /sdcard/screen.png


set timeStamp=%DATE:~6,4%%DATE:~0,2%%DATE:~3,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%


ren Screenshots\screen.png Screenshot_%timeStamp%.png
start Screenshots\Screenshot_%timeStamp%.png
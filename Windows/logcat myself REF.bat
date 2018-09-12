mkdir logcatREF
del logcatREF\* /q/s
adb -s ba9d545b logcat -b main -b system -b radio -b events -v threadtime > logcatREF/main_system_radio_event.txt
pause
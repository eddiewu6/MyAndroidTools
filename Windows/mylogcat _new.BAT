@echo off
echo ץȡLOG����ǰĿ¼�� logcat��ͷ �ļ���

set timeStamp=%DATE:~6,4%%DATE:~0,2%%DATE:~3,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set folderName=logcat_%timeStamp%

mkdir %folderName%

rmdir /s /q logcat

adb pull /cache/logs/ %folderName%\.
adb pull /data/anr %folderName%\anr\.
adb pull /data/data/com.android.providers.settings/databases/settings.db %folderName%\.
adb pull /data/data/com.android.providers.telephony/databases/mmssms.db %folderName%\.
adb pull /data/data/com.android.providers.telephony/databases/telephony.db %folderName%\.
adb pull /data/data/com.android.providers.telephony/app_parts/ %folderName%\.
adb pull /data/data/com.android.providers.telephony/shared_prefs/preferred-apn.xml %folderName%\.
# adb pull /data/data/com.android.browser/databases/browser.db %folderName%\.
# adb pull /data/data/com.android.browser/databases/browser2.db %folderName%\.
adb pull /data/data/com.android.providers.telephony/ %folderName%\.

echo ץȡ������־���������ɵ�Ŀ¼��
adb shell cat /sys/class/switch/snd_debug/*  >"%folderName%\����log.txt"
adb shell cat /sys/kernel/debug/pcm_log >>"%folderName%\����log.txt"

echo ����״̬���������ɵ�Ŀ¼��
#adb shell getprop >"%folderName%\����״̬.txt"
#adb shell netcfg >>"%folderName%\����״̬.txt"
#adb shell busybox ifconfig >>"%%folderName%\����״̬.txt"
#adb shell busybox route >>"%%folderName%\����״̬.txt"

adb shell getprop >"%folderName%\prop.txt"
adb shell netcfg >"%folderName%\netcfg.txt"
adb shell busybox ifconfig >"%folderName%\ifconfig.txt"
adb shell busybox route >"%folderName%\route.txt"

adb shell ps >"%folderName%\ps.txt"
adb shell ls -l /system/bin/ >"%folderName%\system_bin.txt"
adb shell ls -l /system/xbin/ >"%folderName%\system_xbin.txt"
adb shell ls -l /system/app/ >"%folderName%\system_app.txt"
adb shell ls -l /system/priv-app/ >"%folderName%\system_priv-app.txt"
adb shell ls -l /system/lib/ >"%folderName%\system_lib.txt"
adb shell ls -l /system/lib64/ >"%folderName%\system_lib64.txt"
adb shell ls -l /system/vendor/app/ >"%folderName%\system_vendor_app.txt"
adb shell ls -l /system/vendor/bin/ >"%folderName%\system_vendor_bin.txt"
adb shell ls -l /system/vendor/lib/ >"%folderName%\system_vendor_lib.txt"


adb pull /data/system/package-usage.list %folderName%\.
adb pull /data/system/packages.list %folderName%\.
adb pull /data/system/packages.xml %folderName%\.

adb pull /system/etc/apns-conf.xml %folderName%\apns-conf.xml
adb pull /carrier/apns-conf.xml  %folderName%\carrier-apns-conf.xml
adb pull /carriers/apns-conf.xml  %folderName%\carriers-apns-conf.xml
adb pull /persist/apns-conf.xml  %folderName%\persist-apns-conf.xml
adb pull /etc/apns-conf.xml %folderName%\etc-apns-conf.xml

#adb pull /sdcard/sd_logs/ %folderName%\sd_logs\.

adb pull /sdcard/Pictures/Screenshots %folderName%\ScreenShots\.

pause
@echo on
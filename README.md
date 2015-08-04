# AndroidDevTools
<p>Some simple Windows batch files to speed up development for Android.</p>

<h2>choose_device.bat</h2>
<p>Used by other batch files to determine which Android device to use. This batch file is not used on its own. Instead, it is used by other batch files.</p>

<h2>install.bat</h2>
<p>Use to install an APK onto an Android device. Example usage, drag the APK you want to install onto this batch file.</p>

<h2>sign.bat</h2>
<p>Use to sign this APK with the certificates provided in the sign folder. You will need to supply these certificates yourself. Example usage, drag the APK you want to sign onto this batch file.</p>

<h2>sign_install.bat</h2>
<p>Firstly sign.bat the supplied APK, then install.bat this APK. Example usage, drag the APK you want to sign & install onto this batch file.</p>

<h2>wifi_adb.bat</h2>
<p>Connect your Android device by USB, run this command, remove your USB cable. Now you can access your phone via <b>adb connect your.device.ip.address</b> and debug on it as if you were connected by USB. This will need to be done each time your phone turns on.</p>

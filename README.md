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

<h2>add_binary.bat</h2>
<p>Copy a binary executable onto your Android device. It will be copied to `/system/xbin/`.</p>

<h2>add_lib.bat</h2>
<p>Copy an so library onto your Android device. It will be copied to `/system/lib/`.</p>

<h2>add_priv_app.bat</h2>
<p>Copy an APK onto the private app folder of your Android device. It will be copied to `/system/priv-app/`.</p>

<h2>add_sqlite3.bat</h2>
<p>Copy sqlite3 onto your Android device. It will be copied to `/system/xbin/sqlite3`.</p>

<h2>export_svg.bat</h2>
<p>Export a given SVG into many Android related sizes. NOTICE: Uses Inkscape! Change the installation directory of Inkscape in this file!</p>

<h2>ffmpeg_concat.bat</h2>
<p>Not Android related. Drag your mp4 files onto this batch file and FFmpeg will create a concat list and action it.</p>

<h2>make_screenshot.bat</h2>
<p>Generate a screenshot.</p>

<h2>test_critical_memory.bat</h2>
<p>Send RUNNING_CRITICAL memory message to your Android App. Drag your APK onto this file to generate the package name automatically. Requires setting the Android SDK location manually in this batch file.</p>

<h2>test_moderate_memory.bat</h2>
<p>Send MODERATE memory message to your Android App. Drag your APK onto this file to generate the package name automatically. Requires setting the Android SDK location manually in this batch file.</p>

<h2>view_signature.bat</h2>
<p>Drag your APK onto this file to print out all signatures of your APK. Useful for finding your signature for supplying to Google Cloud services, as an example.</p>

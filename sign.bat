@echo off

REM Sign an APK with supplied platform certificates.

if not exist "%~dp0\sign\signapk.jar" (
    echo You are missing the signing jar. Please add signapk.jar to the sign\ folder.
	pause
	exit /b
)
if not exist "%~dp0\sign\platform.x509.pem" (
    echo You are missing your firmware signing certificate. Please add platform.x509.pem to the sign\ folder. 
	pause
	exit /b
)
if not exist "%~dp0\sign\platform.pk8" (
    echo You are missing your firmware signing certificate. Please add platform.pk8 to the sign\ folder. 
	pause
	exit /b
)

echo Signing APK %1 with platform certificate.
java -Xms256m -Xmx512m -jar "%~dp0\sign\signapk.jar" -w "%~dp0\sign\platform.x509.pem" "%~dp0\sign\platform.pk8" "%1" test.apk
move test.apk "%1" >NUL
echo APK is signed.

timeout 2
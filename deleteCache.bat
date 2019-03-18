@echo off
REM Sets the time
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
REM Cycles through each user and deletes the specified folders
For /f "usebackq" %%m in (`Dir /b C:\Users`) do (
Del /q /f /s /y "C:\Users\%%m\AppData\Local\Google\Chrome\User Data\Default\Cache\*"
Del /q /f /s /y "C:\Users\%%m\AppData\Local\Google\Chrome\User Data\Default\GPUCache\*"
Del /q /f /s /y "C:\Users\%%m\AppData\Local\Google\Chrome\User Data\Default\Media Cache\*"
Del /q /f /s /y "C:\Users\%%m\AppData\Local\Google\Chrome\User Data\Default\Application Cache\*"
Del /q /f /s /y "C:\Users\%%m\AppData\Local\Microsoft\Terminal Server Client\Cache\*"
Rmdir /s /q /y "C:\Users\%%m\AppData\Local\Google\Chrome\User Data\Default\File System\*"
Del /q /f /s /y "C:\Users\%%m\AppData\Local\CrashDumps\*"
Attrib -r "C:\Users\%%m\Downloads\*" /s
Attrib -r "C:\Users\%%m\Desktop\*" /s
Del /q /f /s /y "C:\Users\%%m\Downloads\*"
REM Clears everything on desktop except shortcuts
For /f /y "delims=" %%F in ('Dir /b "C:\Users\%%m\Desktop" ^| findstr /vile ".lnk"') do Del "C:\Users\%%m\Desktop\%%F"
)
REM Writes time and task into log
echo Cleared cache at %mydate%_%mytime% >> log.txt

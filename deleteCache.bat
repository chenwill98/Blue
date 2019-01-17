@echo off
REM Sets the time
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
REM Cycles through each user and deletes the specified folders
For /f "usebackq" %%m in (`dir /b C:\Users`) do (
Del /q /f /s "C:\Users\%%m\AppData\Local\Google\Chrome\User Data\Default\Cache\*"
Del /q /f /s "C:\Users\%%m\AppData\Local\Google\Chrome\User Data\Default\GPUCache\*"
Del /q /f /s "C:\Users\%%m\AppData\Local\Google\Chrome\User Data\Default\Media Cache\*"
Del /q /f /s "C:\Users\%%m\AppData\Local\CrashDumps\*"
Del /q /f /s "C:\Users\%%m\Downloads\*"
For /f "delims=" %%F in ('Dir /b "C:\Users\%%m\Desktop" ^| findstr /vile ".lnk"') do Del "C:\Users\%%m\Desktop\%%F"
)
REM Writes time and task into log
echo Cleared cache at %mydate%_%mytime% >> log.txt

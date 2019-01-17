@echo off
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
For /f "usebackq" %%m in (`dir /b C:\Users`) do (
Del /q /f /s "C:\Users\%%m\AppData\Local\Google\Chrome\User Data\Default\Cache\*"
Del /q /f /s "C:\Users\%%m\AppData\Local\Google\Chrome\User Data\Default\CPUCache\*"
Del /q /f /s "C:\Users\%%m\AppData\Local\Google\Chrome\User Data\Default\Media Cache\*"
)
echo Cleared cache at %mydate%_%mytime% >> log.txt

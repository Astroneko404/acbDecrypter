@echo off

echo:
echo �L�[���[�h�͈Í����^�C�v8�Ŏg�p����܂��B
set /P X_K="�L�[���[�h: "

"%~dp0adx.exe" -y 1 -k "%X_K%" "@"
echo:
pause

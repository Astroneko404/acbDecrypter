@echo off

echo:
echo �������͈Í����^�C�v9�Ŏg�p����܂��B
set /P X_B="������ (16�i��16���Ŏw��): "

"%~dp0adx.exe" -y 2 -b %X_B% "@"
echo:
pause

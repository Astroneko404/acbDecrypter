@echo off

if "%~1" == "" (
  echo �����̃E�B���h�E����āA��͂������t�@�C�����h���b�O���h���b�v���Ă��������B
  pause
  exit /b
)

echo:
set X_Z=
echo �������͂��Ȃ��ꍇ�A�f�����g���ĉ�͂��܂��B
set /P X_Z="�S�Ă̒l�ŉ�͂��܂����H(�������͂���ƑS�Ă̒l�ŉ��): "
echo:
if "%X_Z%" neq "" (set X_Z=-z)
"%~dp0adx.exe" -x %X_Z% %1
echo:
pause

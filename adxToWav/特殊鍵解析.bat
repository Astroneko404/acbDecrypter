@echo off

if "%~1" == "" (
  echo �����̃E�B���h�E����āA��͂������t�@�C�����h���b�O���h���b�v���Ă��������B
  pause
  exit /b
)

echo:
set X_X=1
echo ��̓��[�h
echo 1. �ʏ���(�f�t�H���g)
echo 2. �f�����
echo 3. �S�l���
set /P X_X="�ԍ��Ŏw�肵�Ă��������B: "
echo:
"%~dp0adx.exe" -x %X_X% %1
echo:
pause

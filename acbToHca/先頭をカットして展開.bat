@echo off

if "%~1" == "" (
  echo �����̃E�B���h�E����āA�A�[�J�C�u�������t�@�C����t�H���_���h���b�O���h���b�v���Ă��������B
  pause
  exit /b
)

echo:
"%~dp0afs2.exe" -c %*
rem echo:
rem pause

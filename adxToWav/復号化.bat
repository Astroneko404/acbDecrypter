@echo off

rem ********************************************************************************
rem *           �f�t�H���g�l�ݒ�                                                   *
rem *                                                                              *
rem *   �L�[���[�h                                                                 *
set X_K=
rem *                                                                              *
rem *   ������ (16�i��16���Ŏw��)                                                  *
set X_B=CF222F1FE0748978
rem *                                                                              *
rem *   ���ꌮ (16�i��12���Ŏw��)                                                  *
set X_A=000000000000
rem *                                                                              *
rem *                                                                              *
rem ********************************************************************************

if "%~1" == "" (
  echo �����̃E�B���h�E����āA�������������t�@�C�����h���b�O���h���b�v���Ă��������B
  pause
  exit /b
)

echo:
echo �L�[���[�h�͈Í����^�C�v8�Ŏg�p����܂��B
set /P X_K="�L�[���[�h: "
set X_BB=
if "%X_K%" == "" (
  echo:
  echo �������͈Í����^�C�v9�Ŏg�p����܂��B
  set /P X_BB="������ (16�i��16���Ŏw��): "
)
if "%X_K%%X_BB%" == "" (
  echo:
  echo ���ꌮ�͈Í����^�C�v�Ɋ֌W�Ȃ��g�p����܂��B
  set /P X_A="���ꌮ (16�i��12���Ŏw��): "
)
if "%X_BB%" neq "" (
  set X_B=%X_BB%
)
echo:
set X=-c -a %X_A% -b %X_B% -k "%X_K%"
for %%f in (%*) do "%~dp0adx.exe" %X% %%f
echo:
pause

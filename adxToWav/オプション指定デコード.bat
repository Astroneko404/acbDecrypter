@echo off

rem ********************************************************************************
rem *           �f�t�H���g�l�ݒ�                                                   *
rem *                                                                              *
rem *                                                                              *
rem *   �r�b�g���[�h (8�A16�A24�A32�Afloat�Adouble �̂ǂꂩ���w��)                 *
set X_M=16
rem *                                                                              *
rem *   �L�[���[�h                                                                 *
set X_W=
rem *                                                                              *
rem *   ������ (16�i��12���Ŏw��)                                                  *
set X_K=000000000000
rem *                                                                              *
rem *                                                                              *
rem ********************************************************************************

if "%~1" == "" (
  echo �����̃E�B���h�E����āA�f�R�[�h�������t�@�C�����h���b�O���h���b�v���Ă��������B
  pause
  exit /b
)

echo:
echo �r�b�g���[�h����͂��Ȃ��ꍇ�A16bitPCM�Ƃ��ďo�͂���܂��B
set /P X_M="�r�b�g���[�h (8�A16�A24�A32�Afloat(f)�Adouble(d) �̂ǂꂩ���w��): "
echo:
echo �Í�������ĂȂ��ꍇ�A�L�[���[�h�͕s�v�ł��B
set /P X_W="�L�[���[�h: "
if "%X_W%" == "" (
  echo:
  echo �Í�������ĂȂ��ꍇ�A�������͕s�v�ł��B
  set /P X_K="������ (16�i��12���Ŏw��): "
)
echo:
if "%X_M:~0,1%" == "f" (set X_M=0)
if "%X_M:~0,1%" == "d" (set X_M=1)
set X=-m %X_M% -a %X_K:~4,8% -b %X_K:~0,4% -k "%X_W%"
for %%f in (%*) do "%~dp0adx.exe" %X% %%f
echo:
pause

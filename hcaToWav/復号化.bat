@echo off

rem ********************************************************************************
rem *           �f�t�H���g�l�ݒ�                                                   *
rem *                                                                              *
rem *   ������ (16�i��16���Ŏw��)                                                  *
rem set X_K=CF222F1FE0748978
rem *                                                                              *
rem *                                                                              *
rem ********************************************************************************

rem if "%~1" == "" (
rem   echo �����̃E�B���h�E����āA�������������t�@�C�����h���b�O���h���b�v���Ă��������B
rem   pause
rem   exit /b
rem )

rem echo:
rem echo ����������͂��Ȃ��ꍇ�A�f�t�H���g�����g�p���܂��B
rem set /P X_K="������ (16�i��16���Ŏw��): "
set X_K=%~1
rem echo:
set X=-c -a %X_K:~8,8% -b %X_K:~0,8%
rem for %%f in (%*) do "%~dp0hca.exe" %X% %%f
for %%f in (%~2) do "%~dp0hca.exe" %X% %%f
rem echo:
rem pause

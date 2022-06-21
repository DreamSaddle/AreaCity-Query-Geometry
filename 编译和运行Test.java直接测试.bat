@echo off

:Run
cls

javac -version
if errorlevel 1 (
	echo ��Ҫ��װJDK���ܱ�������java�ļ�
	goto Pause
)

javac -encoding utf-8 -Djava.ext.dirs=./ *.java
if errorlevel 1 (
	echo java�ļ�����ʧ��
	goto Pause
)

set dir=com\github\xiangyuecn\areacity\query
if not exist %dir% (
	md %dir%
) else (
	del %dir%\*.class > nul
)
move *.class %dir% > nul

echo java -Xmx300m Test -cmd ������java�������ʹ��300M�ڴ�
java -Djava.ext.dirs=./ -Xmx300m com.github.xiangyuecn.areacity.query.Test -cmd

:Pause
pause
:End
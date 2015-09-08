IF  "%1"=="" (	
	GOTO HELL
) ELSE (
	SET _FULLVERSION_="%1"
)

IF NOT EXIST _TempNugets md _TempNugets

.nuget\nuget.exe pack src\AppStudio.DataProviders\AppStudio.DataProviders.nuspec -OutPutDirectory _TempNugets -Version %_FULLVERSION_% -Prop Configuration=Release
.nuget\nuget.exe pack src\AppStudio.Common\AppStudio.Common.nuspec -OutPutDirectory _TempNugets -Version %_FULLVERSION_% -Prop Configuration=Release

.nuget\nuget.exe restore -Source %cd%\_TempNugets waslibs.Controls.sln -Verbosity detailed

GOTO END

:END
ECHO Nuget Pack 1 OK

:HELL
ECHO Wrong ARGS. Version not found
set /a curMinute=%time:~3,2%
set /a curHour=%time:~0,2%

if %curMinute% == 59 (
	set curMinute=0
	if %curHour% == 23 (
		set curHour=0
	) else (
		set /a curHour=%curHour%+1
	)
) else (
	set /a curMinute=%curMinute%+1
)

if %curHour% LSS 10 (
	set curHour=0%curHour%
)

if %curMinute% LSS 10 (
	set curMinute=0%curMinute%
)

schtasks /create /SC once /TN myTestTask /TR "E:\Programming\OS\Lab6\task2\script2.bat" /ST %curHour%:%curMinute%
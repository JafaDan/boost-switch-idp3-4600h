powercfg /q scheme_current sub_processor PERFBOOSTMODE >> val.txt

findstr /m "0x00000000" val.txt >Nul
if %errorlevel%==0 (
Powercfg -setacvalueindex scheme_current sub_processor PERFBOOSTMODE 1
Powercfg -setactive scheme_current
) 

findstr /m "0x00000001" val.txt >Nul
if %errorlevel%==0 (
Powercfg -setacvalueindex scheme_current sub_processor PERFBOOSTMODE 0
Powercfg -setactive scheme_current
)

del val.txt

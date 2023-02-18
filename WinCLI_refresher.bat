:: this is my Windows CLI (command line interface, i.e. CMD) helper
:: ============================================================================================================================
:: Important Environment Variables
:: %Username% : Used to find the id of the user logged in
:: %computername%: Name of the computer. It gives NetBios name not the FQDN name.
:: %path% : List of directories windows need to look for finding an executable
:: %systemdrive% : Installation drive for the currently running OS.
:: %userdomain% : Domain where the current logged in user account is created
:: %PROCESSOR_ARCHITECTURE% : Architecture model of the processor (AMD64/X86)
:: %windir% : Directory for the Windows OS files. If the OS is installed on C: drive, this variable would point to C:\Windows
:: %TMP%, %TEMP% : Points to folder that applications can use to create temporary files.
:: ============================================================================================================================
:: A list of all Environment Variables (separated by commas)
:: ALLUSERSPROFILE, APPDATA, CommonProgramFiles, CommonProgramFiles(x86), CommonProgramW6432, COMPUTERNAME,
:: ComSpec, DEFLOGDIR, FP_NO_HOST_CHECK, HOMEDRIVE, HOMEPATH, LOCALAPPDATA, LOGONSERVER, NUMBER_OF_PROCESSORS,
:: OS, Path, PATHEXT, PROCESSOR_ARCHITECTURE, PROCESSOR_IDENTIFIER, PROCESSOR_LEVEL, PROCESSOR_REVISION,
:: ProgramData, ProgramFiles, ProgramFiles(x86), ProgramW6432, PROMPT, PSModulePath, PUBLIC, SESSIONNAME,
:: SystemDrive, SystemRoot, TEMP, USERDNSDOMAIN, USERDOMAIN, USERNAME, userpath, USERPROFILE, VSEDEFLOGDIR, windir
:: ============================================================================================================================
:: Other very helpful CLI Variables
:: %CD%  : can be used to get the current directory
:: %DATE%    : can be used to get the date
:: %TIME%   : can be used to get the time
:: %RANDOM%  : can be used to get random number between 0 and 32767
:: %ERRORLEVEL%  : can be used to get the error level value
:: %CMDEXTVERSION% : gets current Command Processor Extensions
:: %CMDCMDLINE% : gets the command line executable that invoked the command prompt.
:: %HIGHESTNUMANODENUMBER%  : Gets the highest numa node number on this computer
:: ============================================================================================================================
:: How to wait for a user's input in Windows CLI through command-prompt
@echo off
echo "Type a integer and then press <Enter>"
set /p a_new_arg=
echo "Type a integer and then press <Enter>"
set /p b_new_arg=
echo "Now adding the first integer with the second"
set new_answer=%a_new_arg%+%b_new_arg%
echo "The result of adding both integers is: %new_answer%"
:: ============================================================================================================================
:: How to find files by extention in Windows CLI
@echo off
:: Find one thing, all text file in current directory without looking through sub-directories
dir "." /b /s | findstr .txt$
:: Find all text and batch files in current directory and all sub-directories
dir "." /b /s | findstr ".txt$ .bat$"
:: ============================================================================================================================
:: How to set a batch file with incoming args, compare those args, impliment goto, then finally make and test run
:: We'll do it all in the CLI
setlocal EnableDelayedExpansion
@echo off
(
echo ^@echo off
echo:
echo If ^!^%1^=^=^! ^(goto^:helping^) Else ^(echo ^"^"^)
echo:
echo echo ^"Going to starting^"
echo goto^:starting
echo:
echo ^:first
echo echo ^"In first goto, and passing to second^"
echo goto^:second
echo:
echo ^:second
echo echo ^"In second goto, and passing to third^"
echo goto^:third
echo:
echo ^:third
echo echo ^"In third goto, and passing to fourth^"
echo goto^:fourth
echo:
echo ^:fourth
echo echo ^"In fourth goto, and passing to fifth^"
echo goto^:fifth
echo:
echo ^:fifth
echo echo ^"In fifth goto, and passing to ending^"
echo goto^:ending
echo:
echo ^:starting
echo echo ^"Batch Started^"
echo:
echo echo ^"Setting Arguments ... ^"
echo set arg1^=^%1
echo set arg2^=^%2
echo set arg3^=^%3
echo set arg4^=^%4
echo set arg5^=^%5
echo:
echo echo ^"Checking Arguments with Logical Not^"
echo If ^!^%arg1^%^=^=^! ^(echo ^"No argument for arg1^" ^& set arg1^=NONE^) Else ^(echo ^"Argument 1 is ^%arg1^%^"^)
echo If ^!^%arg2^%^=^=^! ^(echo ^"No argument for arg2^" ^& set arg2^=NONE^) Else ^(echo ^"Argument 2 is ^%arg2^%^"^)
echo If ^!^%arg3^%^=^=^! ^(echo ^"No argument for arg3^" ^& set arg3^=NONE^) Else ^(echo ^"Argument 3 is ^%arg3^%^"^) 
echo If ^!^%arg4^%^=^=^! ^(echo ^"No argument for arg4^" ^& set arg4^=NONE^) Else ^(echo ^"Argument 4 is ^%arg4^%^"^)
echo If ^!^%arg5^%^=^=^! ^(echo ^"No argument for arg5^" ^& set arg5^=NONE^) Else ^(echo ^"Argument 5 is ^%arg5^%^"^)
echo:
echo echo ^"Checking Arguments with If this, do this Else that, do that^"
echo If ^%arg1^%^=^=a ^(echo ^"Called path setting ^%arg1^%^"^) Else ^(goto^:first^)
echo If ^%arg2^%^=^=b ^(echo ^"Called path setting ^%arg2^%^"^) Else ^(goto^:first^)
echo If ^%arg3^%^=^=c ^(echo ^"Called path setting ^%arg3^%^"^) Else ^(goto^:first^)
echo If ^%arg4^%^=^=d ^(echo ^"Called path setting ^%arg4^%^"^) Else ^(goto^:first^)
echo If ^%arg5^%^=^=e ^(echo ^"Called path setting ^%arg5^%^"^) Else ^(goto^:first^)
echo:
echo echo ^"Onto goto command sections^"
echo goto^:first
echo:
echo ^:helping
echo echo ^"This is the help section^"
echo rem This is a remark
echo rem echo This is a remark with a echo
echo goto^:ending
echo:
echo ^:ending
echo ^@echo on
echo:
) > testingThings.bat
@echo on
setlocal DisableDelayedExpansion
:: What it will look like if we open it in a text editor or Edit mode ::
@echo off

If !%1==! (goto:helping) Else (echo "")

echo "Going to starting"
goto:starting

:first
echo "In first goto, and passing to second"
goto:second

:second
echo "In second goto, and passing to third"
goto:third

:third
echo "In third goto, and passing to fourth"
goto:fourth

:fourth
echo "In fourth goto, and passing to fifth"
goto:fifth

:fifth
echo "In fifth goto, and passing to ending"
goto:ending

:starting
echo "Batch Started"

echo "Setting Arguments ... "
set arg1=%1
set arg2=%2
set arg3=%3
set arg4=%4
set arg5=%5

echo "Checking Arguments with Logical Not"
If !%arg1%==! (echo "No argument for arg1" & set arg1=NONE) Else (echo "Argument 1 is %arg1%")
If !%arg2%==! (echo "No argument for arg2" & set arg2=NONE) Else (echo "Argument 2 is %arg2%")
If !%arg3%==! (echo "No argument for arg3" & set arg3=NONE) Else (echo "Argument 3 is %arg3%") 
If !%arg4%==! (echo "No argument for arg4" & set arg4=NONE) Else (echo "Argument 4 is %arg4%")
If !%arg5%==! (echo "No argument for arg5" & set arg5=NONE) Else (echo "Argument 5 is %arg5%")

echo "Checking Arguments with If this, do this Else that, do that"
If %arg1%==a (echo "Called path setting %arg1%") Else (goto:first)
If %arg2%==b (echo "Called path setting %arg2%") Else (goto:first)
If %arg3%==c (echo "Called path setting %arg3%") Else (goto:first)
If %arg4%==d (echo "Called path setting %arg4%") Else (goto:first)
If %arg5%==e (echo "Called path setting %arg5%") Else (goto:first)

echo "Onto goto command sections"
goto:first

:helping
echo "This is the help section"
rem This is a remark
rem echo This is a remark with a echo
goto:ending

:ending
@echo on

:: End of what it will look like in a text editor or in Edit mode ::
:: Also, look at Wiki for image aid 
:: 
:: Usage
:: Returns :helping :: This is the help section
testingThings.bat
:: Returns the full monte, jumping all around the batch file
testing.bat 1 2 3 4 5
:: Returns the full monte, jumping all around the batch file
testing.bat a 2 3 4 5
:: Returns the full monte, jumping all around the batch file
testing.bat a b c d e
:: ============================================================================================================================

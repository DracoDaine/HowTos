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

echo off
cls
del *.o *.exe *.dll output.txt



echo --------------------------------------------------------------------------------
echo Building libMPSSE using VisualStudio...
echo --------------------------------------------------------------------------------

MSBuild ..\..\..\LibMPSSE\Build\Windows\VisualStudio\libMPSSE.sln /t:rebuild /p:Platform=x64   /p:Configuration=Debug
MSBuild ..\..\..\LibMPSSE\Build\Windows\VisualStudio\libMPSSE.sln /t:rebuild /p:Platform=x64   /p:Configuration=Release
MSBuild ..\..\..\LibMPSSE\Build\Windows\VisualStudio\libMPSSE.sln /t:rebuild /p:Platform=Win32 /p:Configuration=Debug
MSBuild ..\..\..\LibMPSSE\Build\Windows\VisualStudio\libMPSSE.sln /t:rebuild /p:Platform=Win32 /p:Configuration=Release

echo --------------------------------------------------------------------------------
echo Copying VisualStudio-compiled libMPSSE libraries (.dll and .lib)...
echo --------------------------------------------------------------------------------

copy/y ..\..\..\LibMPSSE\Build\Windows\VisualStudio\binaries\win32\Release\libMPSSE.lib ..\..\lib\windows\VisualStudio\win32\Release\
copy/y ..\..\..\LibMPSSE\Build\Windows\VisualStudio\binaries\win32\Release\libMPSSE.dll ..\..\lib\windows\VisualStudio\win32\Release\
copy/y ..\..\..\LibMPSSE\Build\Windows\VisualStudio\binaries\x64\Release\libMPSSE.lib   ..\..\lib\windows\VisualStudio\x64\Release\
copy/y ..\..\..\LibMPSSE\Build\Windows\VisualStudio\binaries\x64\Release\libMPSSE.dll   ..\..\lib\windows\VisualStudio\x64\Release\
copy/y ..\..\..\LibMPSSE\Build\Windows\VisualStudio\binaries\win32\Debug\libMPSSE.lib   ..\..\lib\windows\VisualStudio\win32\Debug\
copy/y ..\..\..\LibMPSSE\Build\Windows\VisualStudio\binaries\win32\Debug\libMPSSE.dll   ..\..\lib\windows\VisualStudio\win32\Debug\
copy/y ..\..\..\LibMPSSE\Build\Windows\VisualStudio\binaries\x64\Debug\libMPSSE.lib     ..\..\lib\windows\VisualStudio\x64\Debug\
copy/y ..\..\..\LibMPSSE\Build\Windows\VisualStudio\binaries\x64\Debug\libMPSSE.dll     ..\..\lib\windows\VisualStudio\x64\Debug\
popd



echo --------------------------------------------------------------------------------
echo Building libMPSSE using MinGW...
echo --------------------------------------------------------------------------------

del/q ..\..\lib\windows\mingw\i386\*.*
pushd ..\..\..\libMPSSE\Build\Windows\MinGW\
mingw32-make clean
mingw32-make

echo --------------------------------------------------------------------------------
echo Copying MinGW-compiled libMPSSE libraries (.dll and .a)...
echo --------------------------------------------------------------------------------

copy/y libMPSSE.a ..\..\..\..\Release\lib\windows\mingw\i386
copy/y libMPSSE.dll ..\..\..\..\Release\lib\windows\mingw\i386



pause
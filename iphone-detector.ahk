;#NoEnv ; iTunes won't launch without it, cba to fix
#NoTrayIcon
#SingleInstance, force
#Persistent

Random, DeviceCheckSleep , 5000, 25000
SetTimer, CheckForDevice, %DeviceCheckSleep%

CheckForDevice:
; get handle to the device
phone := GetDeviceFolder()
camera := phone.ParseName("Internal storage\DCIM\").GetFolder()

; get the device's name to be used in constructing the folder path
name := GetDeviceName()

if (camera.Items.Count() > 0)
	{
    Process, Exist, AltServer.exe ; check to see if Altserver.exe is running
    if (ErrorLevel = 0) ; if its not running
      {
      Run, C:\Program Files (x86)\AltServer\AltServer.exe
      }
    #if

    Process, Exist, iTunes.exe ; check to see if iTunes.exe is running
    if (ErrorLevel = 0) ; if its not running
      {
        TempFile = %temp%\iphone_detector.vbs
        VBScript = 
        (
        Set iTunes=CreateObject("iTunes.Application")
        iTunes.Windows.Item(1).Minimized=True
        )
        FileDelete, %TempFile%
        FileAppend, %VBScript%, %TempFile%
        RunWait, %a_windir%\system32\cscript.exe "%TempFile%", "%temp%", hide
        FileDelete, %TempFile%
      }
    #if

	; get the most recent folder
	;lastItem := camera.Items.Item(camera.Items.Count()-1)
	; open it
	;if lastItem.IsFolder
	;	lastItem.InvokeVerb()
	}


GetDeviceFolder() {
    shell := ComObjCreate("Shell.Application")
    computer := shell.Namespace("::{20d04fe0-3aea-1069-a2d8-08002b30309d}")
    for item in computer.Items
		if (item.Type =="Portable Device")
			return item.GetFolder()
   }
   
   GetDeviceName() {
       shell := ComObjCreate("Shell.Application")
       computer := shell.Namespace("::{20d04fe0-3aea-1069-a2d8-08002b30309d}")
       for item in computer.Items
   		if (item.Type =="Portable Device")
   			return item.Name
   }

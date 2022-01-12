# iphone-detector.ahk

Detect when an iPhone is connected to the computer, launches [Altserver](https://altstore.io/) and iTunes to sync and renew developer apps

# What it does

First the script will look for an external device with a DCIM folder (usually a picture folder)

As long as the device has 1 (one) item in the `Internal storage\DCIM` folder, the script will register it as an iPhone and continue

The script then checks for Itunes.exe and Altstore.exe every 5-25 seconds. If the .exes are running the script does nothing. If either or neither programs are running, the script will start them (minimized)

# Setup 
## Windows only

1. Download or save the .ahk file to your computer
2. Win+R to open the Run window and type `shell:startup`
 
![image](https://user-images.githubusercontent.com/15201298/149204307-852b7156-31a8-48cc-9c2c-5bb093f6ddf4.png)

3. Place the .ahk script, or a shortcut to it in the folder that opened up

![image](https://user-images.githubusercontent.com/15201298/149200983-e494bb67-4114-433e-812c-cd36a5ba8c50.png)

4. Double click the shortcut, relog into your profile, or restart your computer for the script to take effect.
5. Plug your phone in, unlock it and wait for the iTunes window to pop up for half a second or so

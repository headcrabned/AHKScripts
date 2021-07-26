#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Win+A to change Audio Playback Device
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#a::
	toggle:=!toggle ; This toggles the variable between true/false
	if toggle
	{
		Run nircmd setdefaultsounddevice "Speakers"
		soundToggleBox("Speakers")
	}
	else
	{
		Run nircmd setdefaultsounddevice "Headset"
		soundToggleBox("Headset")
	}
Return

; Display sound toggle GUI
soundToggleBox(Device)
{
	IfWinExist, soundToggleWin
	{
		Gui, destroy
	}
	
	Gui, +ToolWindow -Caption +0x400000 +alwaysontop
	Gui, Add, text, x35 y8, Default sound: %Device%
	SysGet, screenx, 0
	SysGet, screeny, 1
	xpos:=screenx-275
	ypos:=screeny-100
	Gui, Show, NoActivate x%xpos% y%ypos% h30 w200, soundToggleWin
	
	SetTimer,soundToggleClose, 2000
}
soundToggleClose:
    SetTimer,soundToggleClose, off
    Gui, destroy
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Permanent media F Keys, ctrl to revert
; Use $ Keyboard hook to avoid self-triggering keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

$F7::Send {Media_Prev}
$^F7::Send {F7}
$F8::Send {Media_Play_Pause}
$^F8::Send {F8}
$F9::Send {Media_Next}
$^F9::Send {F9}
$F10::Send {Volume_Mute}
$^F10::Send {F10}
$F11::Send {Volume_Down 1}
$^F11::Send {F11}
$F12::Send {Volume_Up 1}
$^F12::Send {F12}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Firefox-specific tab control via mouse
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive ahk_class MozillaWindowClass
		;Forward Mouse + Left click: close tab 
        Xbutton2 & LButton::Send ^w

		;Forward Mouse + Right click: Re-open closed tab
        Xbutton2 & RButton::Send ^+t

		;Forward Mouse + Scroll Up: Tab Right
        Xbutton2 & WheelUp::Send ^{Tab}

		;Forward Mouse + Scroll Down: Tab Left
        Xbutton2 & WheelDown::Send ^+{Tab}

#IfWinActive
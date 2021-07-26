; My keyboard is uncomfortable small and I need some media control keys
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Volume Up
PgUp::
Send {Volume_Up 1}
return

;Volume Down
PgDn::
Send {Volume_Down 1}
return

;Page Up
>^PgUp::
Send {PgUp}
return

;Page down
>^PgDn::
Send {PgDn}
return

;Pause
Insert::
Send {Media_Play_Pause}
return

;Insert
>^Insert:
Send {Insert}
return
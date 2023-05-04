; ██████╗ ██████╗ ██████╗ ███████╗██████╗     ██████╗ ██╗   ██╗       ██████╗ ██╗   ██╗███╗   ██╗███╗   ██╗██╗  ██╗██╗   ██╗
;██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔══██╗    ██╔══██╗╚██╗ ██╔╝██╗    ██╔══██╗██║   ██║████╗  ██║████╗  ██║██║ ██╔╝╚██╗ ██╔╝
;██║     ██║   ██║██║  ██║█████╗  ██║  ██║    ██████╔╝ ╚████╔╝ ╚═╝    ██████╔╝██║   ██║██╔██╗ ██║██╔██╗ ██║█████╔╝  ╚████╔╝ 
;██║     ██║   ██║██║  ██║██╔══╝  ██║  ██║    ██╔══██╗  ╚██╔╝  ██╗    ██╔══██╗██║   ██║██║╚██╗██║██║╚██╗██║██╔═██╗   ╚██╔╝  
;╚██████╗╚██████╔╝██████╔╝███████╗██████╔╝    ██████╔╝   ██║   ╚═╝    ██████╔╝╚██████╔╝██║ ╚████║██║ ╚████║██║  ██╗   ██║   
; ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═════╝     ╚═════╝    ╚═╝          ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═══╝╚═╝  ╚═╝   ╚═╝   
#Persistent 
#SingleInstance Force
#MaxThreadsPerHotkey 2
SetWorkingDir %A_ScriptDir%
SendMode Input
CoordMode Mouse, Window
SetTitleMatchMode, 2
DetectHiddenWindows, On
SetBatchLines -1
#MenuMaskKey vk07

;================================================
;
;				Variables
;
;================================================
sleepTime := 200
spX := 1009
spY := 792
csX := 655
csY := 353
offsetX := 357
offsetY := 257
pbX := 1675
pbY := 996
nbX := 596 
nbY := 795 
nbX2 := 1430
nbY2 := 793 

;================================================
;
;					GUI Stuff
;
;================================================
IfNotExist, %A_ScriptDir%\idleSplash.png
	URLDownloadToFile, https://www.dropbox.com/s/54ltltggmbgzidb/idleSplash.png?dl=1, idleSplash.png

Gui:
Gui, -Caption +ToolWindow +0x400000
Gui, Add, Link, x265 y2, <a href="https://github.com/Bunnky/IdleonActiveAssistant">GitHub</a>
Gui, Show
Gui, Add, Picture, x0 y0 w300 h215 Border Center vMain GuiMove, %A_ScriptDir%\idleSplash.png
Gui, Show, x0 y0 h215 w300
MsgBox, 48,IdleOn Active Assistant, Note:`n- Hotkeys only work while IdleOn window is focused except `END` to close script`n- Collect water clicks purchase 10 times
Return

;------------------------------------------------
;------------------------------------------------
; Close Script
End::
Gui, Destroy
Gui Cancel
ExitApp

;================================================
;
;				Keybinds
;
;================================================
#IfWinActive, ahk_exe LegendsOfIdleon.exe
+NumpadAdd::Gosub, GetColors
F1::GoSub, Char1
F2::GoSub, Char2
F3::GoSub, Char3
F4::GoSub, Char4
F5::GoSub, Char5
F6::GoSub, Char6
F7::GoSub, Char7
NumpadSub::GoSub, GoToTown
NumpadMult::GoSub, CheckProduction
NumpadDiv::GoSub, CollectWater

;================================================
;
;				Subroutines
;
;================================================
GetColors:
	MouseGetPos, xpos, ypos 
	PixelGetColor, color, xpos, ypos, Fast RGB ;Arrows
	msgbox %color%
Return
;------------------------------------------------
;------------------------------------------------
PageOnePlayers:
	MouseClick, Left, nbX, nbY				;Move mouse and click previous button
	Sleep sleepTime
Return
;------------------------------------------------
;------------------------------------------------
PageTwoPlayers:
	MouseClick, Left, nbX2, nbY2			;Move mouse and click previous button
	Sleep sleepTime
Return
;------------------------------------------------
;------------------------------------------------

;------------------------------------------------
;------------------------------------------------
Char1:
	MouseClick, Left, pbX, pbY				;Move mouse and click players button
	Sleep sleepTime
	GoSub, PageOnePlayers					;Move mouse and click next button						
	MouseClick, Left, csX, csY				;Move mouse and click character
	Sleep sleepTime						
	MouseClick, Left, spX, spY				;Move mouse and click select player
Return
;------------------------------------------------
;------------------------------------------------
Char2:
	MouseClick, Left, pbX, pbY				;Move mouse and click players button
	Sleep sleepTime
	GoSub, PageOnePlayers					;Move mouse and click next button			
	MouseClick, Left, csX + offsetX, csY	;Move mouse and click character
	Sleep sleepTime			
	MouseClick, Left, spX, spY				;Move mouse and click select player
Return
;------------------------------------------------
;------------------------------------------------
Char3:
	MouseClick, Left, pbX, pbY				;Move mouse and click players button
	Sleep sleepTime
	GoSub, PageOnePlayers					;Move mouse and click next button			
	MouseClick, Left, csX + offsetX*2, csY	;Move mouse and click character
	Sleep sleepTime			
	MouseClick, Left, spX, spY				;Move mouse and click select player
Return
;------------------------------------------------
;------------------------------------------------
Char4:
	MouseClick, Left, pbX, pbY				;Move mouse and click players button
	Sleep sleepTime
	GoSub, PageOnePlayers					;Move mouse and click next button
	MouseClick, Left, csX, csY + offsetY	;Move mouse and click character
	Sleep sleepTime			
	MouseClick, Left, spX, spY				;Move mouse and click select player
Return
;------------------------------------------------
;------------------------------------------------
Char5:
	MouseClick, Left, pbX, pbY						;Move mouse and click players button
	Sleep sleepTime
	GoSub, PageOnePlayers							;Move mouse and click next button
	MouseClick, Left, csX + offsetX, csY + offsetY	;Move mouse and click character
	Sleep sleepTime
	MouseClick, Left, spX, spY						;Move mouse and click select player
Return
;------------------------------------------------
;------------------------------------------------
Char6:
	MouseClick, Left, pbX, pbY							;Move mouse and click players button
	Sleep sleepTime	
	GoSub, PageOnePlayers								;Move mouse and click next button
	MouseClick, Left, csX + offsetX*2, csY + offsetY	;Move mouse and click character
	Sleep sleepTime	
	MouseClick, Left, spX, spY							;Move mouse and click select player
Return
;------------------------------------------------
;------------------------------------------------
Char7:
	MouseClick, Left, pbX, pbY				;Move mouse and click players button
	Sleep sleepTime
	GoSub, PageTwoPlayers					;Move mouse and click next button
	MouseClick, Left, csX, csY				;Move mouse and click character
	Sleep sleepTime
	MouseClick, Left, spX, spY				;Move mouse and click select player
Return
;------------------------------------------------
;------------------------------------------------
Char8:
	MouseClick, Left, pbX, pbY				;Move mouse and click players button
	Sleep sleepTime
	GoSub, PageTwoPlayers					;Move mouse and click next button			
	MouseClick, Left, csX + offsetX, csY	;Move mouse and click character
	Sleep sleepTime			
	MouseClick, Left, spX, spY				;Move mouse and click select player
Return
;------------------------------------------------
;------------------------------------------------
Char9:
	MouseClick, Left, pbX, pbY				;Move mouse and click players button
	Sleep sleepTime
	GoSub, PageTwoPlayers					;Move mouse and click next button			
	MouseClick, Left, csX + offsetX*2, csY	;Move mouse and click character
	Sleep sleepTime			
	MouseClick, Left, spX, spY				;Move mouse and click select player
Return
;------------------------------------------------
;------------------------------------------------
Char10:
	MouseClick, Left, pbX, pbY				;Move mouse and click players button
	Sleep sleepTime
	GoSub, PageTwoPlayers					;Move mouse and click next button
	MouseClick, Left, csX, csY + offsetY	;Move mouse and click character
	Sleep sleepTime			
	MouseClick, Left, spX, spY				;Move mouse and click select player
Return
;------------------------------------------------
;------------------------------------------------
Char11:
	MouseClick, Left, pbX, pbY						;Move mouse and click players button
	Sleep sleepTime
	GoSub, PageTwoPlayers							;Move mouse and click next button
	MouseClick, Left, csX + offsetX, csY + offsetY	;Move mouse and click character
	Sleep sleepTime
	MouseClick, Left, spX, spY						;Move mouse and click select player
Return
;------------------------------------------------
;------------------------------------------------
Char12:
	MouseClick, Left, pbX, pbY							;Move mouse and click players button
	Sleep sleepTime	
	GoSub, PageTwoPlayers								;Move mouse and click next button
	MouseClick, Left, csX + offsetX*2, csY + offsetY	;Move mouse and click character
	Sleep sleepTime	
	MouseClick, Left, spX, spY							;Move mouse and click select player
Return
;------------------------------------------------
;------------------------------------------------
GoToTown:
	WinActivate, ahk_exe LegendsOfIdleon.exe
	Send {Enter}							;Chat Mode
	Sleep sleepTime
	SendInput {Raw}If u love me let me go	;Text to say
	Sleep sleepTime
	Send {Enter}							;Send message
	Sleep, 2300
	Send {Esc}								;Open Menu
	Sleep sleepTime
	MouseClick, Left, 1731, 779				;Move mouse and click gem button
	Sleep, 1000
	MouseClick, Left, 150, 111				;Move mouse and click exit button
Return
;------------------------------------------------
;------------------------------------------------
CheckProduction:
	MouseClick, Left, 1408, 997				;Move mouse and click codex button
	Sleep sleepTime
	MouseClick, Left, 1182, 232				;Move mouse and click quick ref button
	Sleep sleepTime
	MouseClick, Left, 924, 379				;Move mouse and click anvil button
	Sleep sleepTime
	MouseClick, Left, 1034, 232				;Move mouse and click produce button
	Sleep sleepTime
	MouseClick, Left, 883, 227 				;Move mouse and click quick deposit button
	Sleep sleepTime
	MouseClick, Left, 883, 227 				;Move mouse and click quick deposit button x2
	Sleep sleepTime
	Send {Esc}								;Close Menu
Return
;------------------------------------------------
;------------------------------------------------
CollectWater:
	MouseClick, Left, 1408, 997				;Move mouse and click codex button
	Sleep sleepTime
	MouseClick, Left, 1182, 232				;Move mouse and click quick ref button
	Sleep sleepTime
	MouseClick, Left, 929, 585				;Move mouse and click cauldron button
	Sleep sleepTime
	MouseClick, Left, 294, 111 				;Move mouse and click liquid button
	Sleep sleepTime
	MouseClick, Left, 991, 248 				;Move mouse and click distilled water
	Sleep sleepTime
	MouseClick, Left, 683, 440 				;Move mouse and click chest button
	Sleep sleepTime
	Loop 10 {
		MouseClick, Left, 720, 512 			;Move mouse and click purchase button 10 times
		Sleep sleepTime	
	}
	Send {Esc}								;Close Menu
Return


























;------------------------------------------------
;------------------------------------------------
uiMove:
PostMessage, 0xA1, 2,,, A 
Return
;------------------------------------------------
;------------------------------------------------
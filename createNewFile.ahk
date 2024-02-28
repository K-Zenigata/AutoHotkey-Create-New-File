#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Shift + Ctrl + F で、ファイルの新規作成
^+f::
{
     ; エクスプローラーウィンドウがアクティブでなければ終了
    IfWinNotActive, ahk_class CabinetWClass
        return
    
    Send, !d 
    Send, ^c
    Sleep, 100
    Run %A_ScriptDir%\newfile.bat %Clipboard%

    Sleep, 500
    ; エクスプローラーをアクティブにする
    WinActivate, ahk_class CabinetWClass

    Sleep, 1500
    Send, {a}
    Send, {f2}
    
    return
}
#Requires AutoHotkey v2.0

; Guide - https://www.autohotkey.com/docs/v2/Tutorial.htm

#SingleInstance Force ;this will replace the script in one action when reruning it

#HotIf WinActive("ahk_exe Adobe Premiere Pro.exe")
;Ripple delete clip at playhead!! This was the first AHK script I ever wrote, I think!
F1::
{
    Send "u" ;u  is assigned to [select clip at playhead]
    sleep 1
    ;Send ^+!d ;ctrl alt shift d  is [ripple delete]. I had disabled CTRL CHIFT D for some raisin. i guess I'll see why later.
    Send "w" ;ctrl  shift d  is also [ripple delete]. Premier 2024 wasn't working with the old shortcut, for some reason. Note there are two versions of it, and only one of them is explicitly for the timeline panel. That's the one that I think you're supposed to use now, but it's also finicky now, perhaps getting confused if it has another general assignment.
    sleep 1
}

; FIREFOX SHORTCUTS

#HotIf WinActive("ahk_exe firefox.exe") ; Only works if Firefox is active

; ^+F1:: { ; this was to make pinning these tabs faster but it ends up being more work
;     ; Open each tab
;     Run "https://docs.google.com/document/d/1okrpUhcLESdLfXn77oZ1GivLRKZW64Mxa-de29_8RCg/edit?usp=sharing"
;     Run "https://docs.google.com/document/d/1ECUjXG1cPk6Ty3v3OqkZGKlEbD7O-YrqlQMJ3Xs_Txw/edit?usp=sharing"
;     Run "https://www.gmail.com/"
;     Run "https://calendar.google.com/calendar"
;     Run "https://www.chatgpt.com/"
;     Run "https://drive.google.com"
;     Run "https://www.youtube.com/"
; }

; --- Move Tabs ---
!F1:: Send "^+{PgUp}"   ; Alt+F1 -> Move tab left
!F2:: Send "^+{PgDn}"   ; Alt+F2 -> Move tab right

^F1:: Send "!{Left}"    ;Ctrl+F1 -> control alt left, go back one page
^F2:: Send "!{Right}"   ;Ctrl+F2 -> control alt right, go forward one page

; --- Switch Tabs ---
F1:: Send "^+{Tab}"     ; F1 -> Previous tab
F2:: Send "^{Tab}"      ; F2 -> Next tab
F3:: Send "^w"          ; F3 -> control w, which closes a tab
F4:: Send "^+t"         ; F4 -> control shift t, reopens tab

; --- GMAIL ---

#HotIf WinActive("ahk_exe firefox.exe")

^F9:: { ; Jump to unread emails
    Send "/"             ; Gmail’s search box shortcut
    Sleep 75
    Send "is:unread{Enter}"
}

; CAPCUT

#HotIf WinActive("ahk_exe CapCut.exe") ; Only works if capcut is active

^+Space:: { ; Jump to start and playback
    Send "{Home}"
    Send "{Space}"
}

^right:: { ; cut at next cut point
    Send "{Down}"
    Send "r"
}

^left:: { ; cut at prevous cut point
    Send "{Up}"
    Send "r"
}

F1:: { ; Delete clip at mouse pointer
    Click
    Sleep 75
    Send "c"
}

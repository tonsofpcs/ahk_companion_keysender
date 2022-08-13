#NoEnv
SetBatchLines, -1
CoordMode, Mouse, Screen

#Include Socket.ahk

Server := new SocketTCP()
Server.OnAccept := Func("OnAccept")
Server.Bind(["0.0.0.0", 1337])
Server.Listen()

MsgBox, Serving on port 1337
SitHere: 
Sleep, 100000
Goto, SitHere
ExitApp

OnAccept(Server)
{
	static Counter := 0
	
	Sock := Server.Accept()
	
	LoopRecv:
	Request := StrSplit(Sock.RecvLine(), " ")

    ;Sock.Disconnect()

	if (Request[1] = "SEND")
	{
        chars := Request[2]
        Loop, Parse, chars
        {
            Switch A_LoopField
            {
                case "0":
                    Send, {Numpad0}
                case "1":
                    Send, {Numpad1}
                case "2":
                    Send, {Numpad2}
                case "3":
                    Send, {Numpad3}
                case "4":
                    Send, {Numpad4}
                case "5":
                    Send, {Numpad5}
                case "6":
                    Send, {Numpad6}
                case "7":
                    Send, {Numpad7}
                case "8":
                    Send, {Numpad8}
                case "9":
                    Send, {Numpad9}
            }
        }
        Send, {NumpadEnter}

		;return
	}
	Goto, LoopRecv
    
}

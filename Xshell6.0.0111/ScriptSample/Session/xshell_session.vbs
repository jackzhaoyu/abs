Sub Main
	' *** Open, Close, Sleep ***
	xsh.Session.Open("ssh://test:test@192.168.X.X")
	'xsh.Session.Open("C:\...\NetSarang\Xshell\Sessions\New Session.xsh")
	xsh.Screen.Synchronous = true
	xsh.Session.Sleep(1000)
	
	'*** StartLog, StopLog ***
	xsh.Session.LogFilePath = "C:\...\NetSarang\Xshell\Logs\example.log"
	xsh.Session.StartLog()
	
	'*** Property ***
	Dim MsgInfo
	MsgInfo = "LogPath: " + xsh.Session.LogFilePath + ", "
	MsgInfo = MsgInfo + "LocalAddress: " + xsh.Session.LocalAddress + ", " 
	MsgInfo = MsgInfo + "Path: " + xsh.Session.Path + ", "  
	MsgInfo = MsgInfo + "RemoteAddress: " + xsh.Session.RemoteAddress + ", "  
	MsgInfo = MsgInfo + "RemotePort: " + CStr(xsh.Session.RemotePort) + ", "
	MsgInfo = MsgInfo + "Connected: " + CStr(xsh.Session.Connected) + ", "
	MsgInfo = MsgInfo + "Logging: " + CStr(xsh.Session.Logging)
	xsh.Dialog.MsgBox(MsgInfo)
	
	xsh.Session.Close()
	xsh.Session.StopLog()
End Sub
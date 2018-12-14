def Main():
	# *** Open, Close, Sleep ***
	xsh.Session.Open("ssh://test:test@192.168.X.X")
	#xsh.Session.Open("C:\\...\\NetSarang\\Xshell\\Sessions\\New Session.xsh")
	xsh.Screen.Synchronous = True		#True or False
	xsh.Session.Sleep(1000)
	
	#*** StartLog, StopLog ***
	xsh.Session.LogFilePath = "C:\\...\\NetSarang\\Xshell\\Logs\\example.log"
	xsh.Session.StartLog()
	
	#*** Property ***
	MsgInfo = "LogPath: " + xsh.Session.LogFilePath + ", "
	MsgInfo = MsgInfo + "LocalAddress: " + xsh.Session.LocalAddress + ", " 
	MsgInfo = MsgInfo + "Path: " + xsh.Session.Path + ", "  
	MsgInfo = MsgInfo + "RemoteAddress: " + xsh.Session.RemoteAddress + ", "  
	MsgInfo = MsgInfo + "RemotePort: " + str(xsh.Session.RemotePort) + ", "
	MsgInfo = MsgInfo + "Connected: " + str(xsh.Session.Connected) + ", "
	MsgInfo = MsgInfo + "Logging: " + str(xsh.Session.Logging)
	xsh.Dialog.MsgBox(MsgInfo)
	
	xsh.Session.Close()
	xsh.Session.StopLog()
	
	

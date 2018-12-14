function Main()
{
	// *** Open, Close, Sleep ***
	xsh.Session.Open("ssh://test:test@192.168.X.X") 	
	xsh.Session.Open("C:\...\NetSarang\Xshell\Sessions\New Session.xsh");
	xsh.Screen.Synchronous = true;
	xsh.Session.Sleep(1000);
	
	//*** StartLog, StopLog ***
	xsh.Session.LogFilePath = "C:\...\NetSarang\Xshell\Logs\example.log";
	xsh.Session.StartLog();
	
	//*** Property ***
	var MsgInfo;
	MsgInfo = "LogPath: " + xsh.Session.LogFilePath + ", ";
	MsgInfo = MsgInfo + "LocalAddress: " + xsh.Session.LocalAddress + ", ";
	MsgInfo = MsgInfo + "Path: " + xsh.Session.Path + ", ";
	MsgInfo = MsgInfo + "RemoteAddress: " + xsh.Session.RemoteAddress + ", ";
	
	var RPort, Conn, Log;
	RPort = xsh.Session.RemotePort;
	Conn = xsh.Session.Connected;
	Log = xsh.Session.Logging;
	MsgInfo = MsgInfo + "RemotePort: " + RPort + ", ";
	MsgInfo = MsgInfo + "Connected: " + Conn + ", ";
	MsgInfo = MsgInfo + "Logging: " + Log;
	xsh.Dialog.MsgBox(MsgInfo);
	
	xsh.Session.Close();
	xsh.Session.StopLog();
}
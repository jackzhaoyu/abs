def Main():
	xsh.Session.Open("C:\\...\\NetSarang\\Xshell\\Sessions\\New Session.xsh")
	xsh.Screen.Synchronous = True		#True or False
	xsh.Session.Sleep(1000)
	
	#*** WaitForString ***
	xsh.Screen.WaitForString("aaa")		# input "aaa" in Terminal
	
	#*** Send ***
	xsh.Screen.Send("cat /etc/passwd")
	xsh.Screen.Send('\r')
	xsh.Session.Sleep(1000)
	
	#*** Get, Clear ***	
	ScreenRow = xsh.Screen.CurrentRow - 1
	ReadLine = xsh.Screen.Get(ScreenRow, 1, ScreenRow, 40)
	Items = ReadLine.split(':');
	xsh.Dialog.MsgBox(Items[2])
	xsh.Screen.Clear()
	
	#*** Property ***
	xsh.Screen.Synchronous = False
	MsgProp = "Col:" + str(xsh.Screen.CurrentColumn) + ", "
	MsgProp = MsgProp + "Row:" + str(xsh.Screen.CurrentRow) + ", "
	MsgProp = MsgProp + "TermCol:" + str(xsh.Screen.Columns) + ", "
	MsgProp = MsgProp + "TermRow:" + str(xsh.Screen.Rows) 
	xsh.Dialog.MsgBox(MsgProp)

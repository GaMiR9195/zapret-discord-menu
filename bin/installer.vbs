   Set oWS = WScript.CreateObject("WScript.Shell")
   sLinkFile = oWS.ExpandEnvironmentStrings("%HOMEDRIVE%%HOMEPATH%") & "\Desktop\unblock.lnk"
   Set oLink = oWS.CreateShortcut(sLinkFile)
   oLink.TargetPath = oWS.CurrentDirectory & "\bin\main.bat"
   oLink.IconLocation = oWS.CurrentDirectory & "\bin\icon.ico"
   oLink.Save
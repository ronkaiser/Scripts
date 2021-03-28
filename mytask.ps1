$FileLocation = "$env:userprofile\file.txt"

New-Item $FileLocation
Set-Content $FileLocation 'I love the bootcamp!'
Start-Process notepad $FileLocation


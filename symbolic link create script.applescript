on run
	
	set options to {"Folder", "File"}
	
	set choice to choose from list options with prompt "Select if you want to do files or folders:" default items {"Folder"} with title "It’s your choice"
	
	if choice is not false then
		
		set selected to {}
		
		try
			
			if item 1 of choice is "Folder" then
				
				set selected to choose folder with prompt "Choose a folder to create a symbolic link:" with multiple selections allowed without invisibles
				
			else
				
				set selected to choose file with prompt "Choose a file to create a symbolic link:" with multiple selections allowed without invisibles
				
			end if
			
		on error errorMessage number errorNumber
			
			if errorNumber = -128 then return
			
			displayError(errorMessage & " " & errorNumber)
			
			return
			
		end try
		
		if (count selected) > 0 then handle(selected)
		
	end if
	
end run

on handle(theFiles)
	
	set errorMessages to ""
	
	repeat with i from 1 to (count theFiles)
		
		set posixPath to POSIX path of (item i of theFiles)
		
		if posixPath ends with "/" then set posixPath to text 1 thru -2 of posixPath
		
		try
			
			do shell script "ln -s " & quoted form of posixPath & " " & quoted form of (posixPath & ".sym")
			
		on error errorMessage number errorNumber
			
			set errorMessages to errorMessages & errorMessage & " " & errorNumber & return
			
		end try
		
	end repeat
	
	if errorMessages is not equal to "" then displayError(errorMessages)
	
end handle

on displayError(message)
	
	display dialog message with title "Create Symbolic Link(s) Script" buttons {"OK"} default button "OK"
	
end displayError






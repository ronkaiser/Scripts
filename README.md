# DevOps BootCamp Scripts


## Powershell script
Task-Generator.ps1 script will create new scheduled task by first execute mytask.ps1 which create new text file that contain string.
Task name will be define by the user which will open the file via notepad.
The user will define number of seconds that this task will remain enabled and print all enabled tasks.

**Flags:**
Passing the following flags is mandatory
`-TaskName` - task name.
`-WaitSeconds`- time in seconds until task will be disabled.

**Script execution:**
- Clone the script using `git clone <source>
- Open Powershell with administrator permissions and run `.\Task-Generator.ps1 -TaskName [task name] -WaitSeconds [number of seconds]`


## Bash script
This script will validate password strengh by meet the requirments.
if the password is not strong enough it will print the reson with RED color.
if the password is strong, it will print "Your password is awesome!" with GREEN color.

**Password requirements:**
Length – minimum of 10 characters.
Contain both alphabet and number.
Include both the small and capital case letters.

**Script execution:**
- Clone the script using `git clone <source>
- Change execution permissions by running the following command: `sudo chmod 777 password-validator.sh`
- Run the script: ./password-validator.sh '[password]'

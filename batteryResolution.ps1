while ($true) {
    $PowerStatus = (Get-WmiObject -Class BatteryStatus -Namespace root\wmi -ErrorAction SilentlyContinue).PowerOnLine
    $monitors = Get-WmiObject -Namespace "root\wmi" -Query "SELECT * FROM WmiMonitorID"

    # The source file for changing the refresh rate
    . "C:\Users\zalem\Documents\Desktop\Scripts\Power saving on battery\refreshRate.ps1"
    
    # Check if the monitor is connected
        # Check if the InstanceName contains "2841"
    if ($monitors -like "*2841*") {
		;
            }
    
    elseif ($PowerStatus -ne $True) {
        Set-DisplayResolution -Width 1440 -Height 960
        # Execute SetDPI.exe with appropriate parameters for battery mode
        Start-Process -FilePath "C:\Users\zalem\Documents\Desktop\Scripts\Power saving on battery\SetDPI-master\x64\Debug\SetDPI.exe" -ArgumentList "125" -NoNewWindow
        Set-ScreenRefreshRate -Frequency 60
    } 

    else {
        # plugged mode
        Set-DisplayResolution -Width 2880 -Height 1920
        # Execute SetDPI.exe with appropriate parameters for plugged-in mode
        Start-Process -FilePath "C:\Users\zalem\Documents\Desktop\Scripts\Power saving on battery\SetDPI-master\x64\Debug\SetDPI.exe" -ArgumentList "250" -NoNewWindow
        Set-ScreenRefreshRate -Frequency 120
    }
    
    Start-Sleep 10
}
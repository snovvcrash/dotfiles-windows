# -- PSReadLine ------------------------------------------------------

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
    
    # Remove single command length limit (PowerShell 7+)
    Set-PSReadLineOption -AddToHistoryHandler $null

    # Binding for moving through history by prefix
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
}

# -- PSFzf -----------------------------------------------------------

Import-Module PSFzf

# Override PSReadLine's history search
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# Override default tab completion
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

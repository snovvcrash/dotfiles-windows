# -- Terminal-Icons --------------------------------------------------

#Import-Module -Name Terminal-Icons

# -- PSReadLine ------------------------------------------------------

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine

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

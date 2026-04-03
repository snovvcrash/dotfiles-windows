# subl.exe $PROFILE

# -- PSReadLine ------------------------------------------------------

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine

    # Remove single command length limit (PowerShell 7+)
    Set-PSReadLineOption -AddToHistoryHandler $null

    # Complete predictions by delimiters
    Set-PSReadLineKeyHandler -Key Ctrl+RightArrow -Function ForwardWord
    Set-PSReadLineKeyHandler -Key Ctrl+LeftArrow -Function BackwardWord
    # Binding for moving through history by prefix
    #Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    #Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

    # ^D is exit
    Set-PSReadLineKeyHandler -Key Ctrl+d -Function DeleteCharOrExit
    # ^E is go to end of line
    Set-PSReadLineKeyHandler -Key Ctrl+e -Function EndOfLine

    # Cursor is not blinking
    Set-PSReadLineOption -ExtraPromptLineCount 0
    [Console]::Write("`e[2 q")
}

# -- Aliases ---------------------------------------------------------

# Git

Function GitStatus {git status $args}
Set-Alias -Name gs -Value GitStatus

Function GitAdd {git add $args}
Set-Alias -Name ga -Value GitAdd

Function GitDiff {git diff $args}
Set-Alias -Name gd -Value GitDiff

# -- PSFzf -----------------------------------------------------------

#Install-Module PSFzf
#winget upgrade junegunn.fzf
Import-Module PSFzf

# Override PSReadLine's history search
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# Override default tab completion
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

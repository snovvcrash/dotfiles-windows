# -- PSReadLine ------------------------------------------------------

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine

    # -- Always start the tab in the EN layout -----------------------
    # PSReadLine 2.4.5 bug (github.com/PowerShell/PSReadLine/issues/1393): if the
    # session's first keypresses happen under the RU layout, Ctrl+key chords are
    # mistranslated for the whole session (Ctrl+D inserts "^D"). Sessions that
    # start in EN are immune, and layout switches afterwards work fine both ways,
    # so force EN once at startup. Alt+Shift to RU whenever needed.
    if ($env:WT_SESSION) {
        Add-Type -Namespace Win32 -Name Kb -MemberDefinition @'
[DllImport("user32.dll")] public static extern IntPtr GetForegroundWindow();
[DllImport("user32.dll")] public static extern uint GetWindowThreadProcessId(IntPtr hWnd, out uint pid);
[DllImport("user32.dll")] public static extern bool PostMessage(IntPtr hWnd, uint msg, IntPtr wParam, IntPtr lParam);
[DllImport("user32.dll", CharSet=CharSet.Unicode)] public static extern IntPtr LoadKeyboardLayout(string klid, uint flags);
[DllImport("user32.dll")] public static extern IntPtr GetKeyboardLayout(uint tid);
'@
        $fgPid = [uint32]0
        $fg = [Win32.Kb]::GetForegroundWindow()
        $fgTid = [Win32.Kb]::GetWindowThreadProcessId($fg, [ref]$fgPid)
        if ((Get-Process -Id $fgPid -ErrorAction SilentlyContinue).ProcessName -eq 'WindowsTerminal') {
            $cur = [Win32.Kb]::GetKeyboardLayout($fgTid)
            if (($cur.ToInt64() -band 0xFFFF) -eq 0x0419) {
                $en = [Win32.Kb]::LoadKeyboardLayout('00000409', 1)
                [void][Win32.Kb]::PostMessage($fg, 0x50, [IntPtr]::Zero, $en)
            }
        }
    }

    # Remove single command length limit (PowerShell 7+)
    Set-PSReadLineOption -AddToHistoryHandler $null

    # Complete predictions by delimiters
    Set-PSReadLineKeyHandler -Key Ctrl+RightArrow -Function ForwardWord
    Set-PSReadLineKeyHandler -Key Ctrl+LeftArrow -Function BackwardWord
    # Binding for moving through history by prefix
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
    Set-PSReadLineOption -HistorySearchCursorMovesToEnd:$true

    # ^C is cancel line
    Set-PSReadLineKeyHandler -Key 'Ctrl+c','Ctrl+с' -Function CancelLine
    # ^D is exit
    Set-PSReadLineKeyHandler -Key 'Ctrl+d','Ctrl+в','Shift+Ctrl+в' -Function DeleteCharOrExit
    # ^A is go to the beginning of line
    Set-PSReadLineKeyHandler -Key 'Ctrl+a','Ctrl+ф','Shift+Ctrl+ф' -Function BeginningOfLine
    # ^E is go to the end of line
    Set-PSReadLineKeyHandler -Key 'Ctrl+e','Ctrl+у','Shift+Ctrl+у' -Function EndOfLine

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

# -- ArgumentCompleter -----------------------------------------------

function Get-SSHHosts {
    $configFile = "$env:USERPROFILE\.ssh\config"
    if (Test-Path $configFile) {
        Get-Content $configFile | 
            Select-String -Pattern "^Host\s+(.+)$" | 
            ForEach-Object { $_.Matches.Groups[1].Value.Split(' ') } |
            Where-Object { $_ -notmatch '[*?]' } |
            Sort-Object -Unique
    }
}

Register-ArgumentCompleter -CommandName ssh, scp, sftp -Native -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
    $hosts = Get-SSHHosts
    $hosts | Where-Object { $_ -like "$wordToComplete*" } | ForEach-Object {
        [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
    }
}

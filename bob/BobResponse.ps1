Function Get-BobResponse() {
    <#
    .SYNOPSIS
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.
    
    .DESCRIPTION
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.

    Bob answers 'Sure.' if you ask him a question.

    He answers 'Whoa, chill out!' if you yell at him.

    He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

    He says 'Fine. Be that way!' if you address him without actually saying
    anything.

    He answers 'Whatever.' to anything else.
    
    .PARAMETER HeyBob
    The sentence you say to Bob.
    
    .EXAMPLE
    Get-BobResponse -HeyBob "Hi Bob"
    #>
    [CmdletBinding()]
    Param(
        [string]$HeyBob
    )

    $HeyBob = $HeyBob.Trim()
    $hasAtLeastOneUppercaseLetter = $HeyBob -cmatch "[A-Z]"
    $isAllCaps = $hasAtLeastOneUppercaseLetter -and $HeyBob.ToUpper() -ceq $HeyBob
    $isQuestion = $HeyBob.EndsWith("?")

    if ([string]::IsNullOrWhiteSpace($HeyBob)) {
        return "Fine. Be that way!"
    }
    elseif ($isQuestion -and $isAllCaps) {
        return "Calm down, I know what I'm doing!"
    }
    elseif ($isQuestion) {
        return "Sure."
    }
    elseif ($isAllCaps) {
        return "Whoa, chill out!"
    }
    else {
        return "Whatever."
    }
}

Function Invoke-Row() {
    <#
    .SYNOPSIS
    Get a row from a matrix.
    
    .DESCRIPTION
    Given a string containing newlines, extract the given row from the matrix.
    
    .PARAMETER String
    The matrix as a string

    .PARAMETER Index
    The index of the row to extract
    
    .EXAMPLE
    Invoke-Row -String "1 2\n3 4" -Index 2
    
    Returns: @(3, 4)
    #>
    [CmdletBinding()]
    Param(
        [string]$String,
        [int]$Index
    )

    $rows = $String.Split([Environment]::NewLine)
    return $rows[$Index - 1].Split(" ")
}

Function Invoke-Column() {
    <#
    .SYNOPSIS
    Get a column from a matrix.
    
    .DESCRIPTION
    Given a string containing newlines, extract the given column from the matrix.
    
    .PARAMETER String
    The matrix as a string

    .PARAMETER Index
    The index of the column to extract
    
    .EXAMPLE
    Invoke-Column -String "1 2 3\n4 5 6\n7 8 9" -Index 3
    
    Returns: @(3, 6, 9)
    #>
    [CmdletBinding()]
    Param(
        [string]$String,
        [int]$Index
    )

    $rows = $String.Split([Environment]::NewLine)
    $matrix = @()
    Foreach ($row in $rows) {
        $matrix += , $row.Split(" ")
    }

    $column = @()
    foreach ($row in $matrix) {
        $column += $row[$Index - 1]
    }

    return $column
}

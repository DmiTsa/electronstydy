# $ft = "[тег]"
# $rt = "замена"
# $word = New-Object -ComObject Word.Application
# $word.Visible = $true
# $document = $word.Documents.Open('C:\\Users\\Dmitry\\Documents\\electronstydy\\word.docx')
# $range = $document.Content
# $find = $range.Find
# $find.Execute($ft, $true, $true, $false, $false, $false, $false, 0, 0, $rt, 2)

param (
    [string]$templatePath,
    [string]$outputPath,
    [hashtable]$replacements
)

$word = New-Object -ComObject Word.Application
$word.Visible = $true

$document = $word.Documents.Open($templatePath)

$range = $document.Content
$find = $range.Find

$find.Execute("[Тег1]", $true, $true, $false, $false, $false, $false, 0, 0, "заменааааа", 2)


# Function to find and replace text using Range
function Replace {
    param (
        [string]$ft,
        [string]$rt
    )

    # $range = $document.Content
    # $find = $range.Find



    # $find.Text = $findText
    # $find.Replacement.Text = $replaceText
    # $find.Forward = $true
    # $find.Wrap = 1 # wdFindContinue
    # $find.Format = $false
    # $find.MatchCase = $false
    # $find.MatchWholeWord = $false
    # $find.MatchWildcards = $false
    # $find.MatchSoundsLike = $false
    # $find.MatchAllWordForms = $false

    # $find.Execute() | Out-Null
    $find.Execute($ft, $true, $true, $false, $false, $false, $false, 0, 0, $rt, 2)

    # $find.Execute($findText, $true, $true, $false, $false, $false, $false, 0, 0, $replaceText, 2) | Out-Null
}

# Replace tags with values
# foreach ($key in $replacements.Keys) {
#     Replace $key $replacements[$key]
# }

# Replace -ft "[Тег1]" -rt "замена"


# Save the document
$document.SaveAs([ref] $outputPath)
# $document.Close()
# $word.Quit()

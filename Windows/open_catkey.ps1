param(
  [Parameter(Mandatory)]
  [int]$Key,

  [string]$ViewMode,

  [switch]$Help
)

$CatalogURL = "https://catalog.libraries.psu.edu/catalog/"

function Help() {
  Write-Output ""
  Write-Output "open_catkey.ps1 -Key CATKEY# -ViewMode 'option'"
  Write-Output ""
  Write-Output "-ViewMode options:"
  Write-Output "  <leave blank> - go to library catalog website."
  Write-Output "  json - navigate to raw.json page."
  Write-Output "  djson - download the json to the user's current directory."
  Write-Output "  marc - download marc file to the user's current directory."
  Write-Output "  view - open marc view on library catalog website."
  Write-Output "  help - view this text."
  Write-Output "  options - view this text."
  Write-Output ""
  Write-Output "The `help` and `options` strings can be used instead of `CATKEY#` as well"
  Write-Output ""

  Exit 0
}

$EndSubstring = ""

switch ($ViewMode.ToLower()) {
  "json" { $EndSubstring = "/raw.json" }
  "djson" { 
    Invoke-WebRequest -Uri "$CatalogURL$Key/raw.json" -OutFile "$Key.json"
    Exit 0
  }
  "marc" { 
    Invoke-WebRequest -Uri "$CatalogURL$Key.marc" -OutFile "$Key.mrc"
    Exit 0
  }
  "view" { $EndSubstring = "/marc_view" }
  "help" { Help }
  "options" { Help }
  Default {}
}

function Main() {
  if ($Help) {
    Help
  } else {
    Start-Process "$CatalogURL$Key$EndSubstring"
  }
}

Main

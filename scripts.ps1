# write-output Apigee Artifacts
$token = $env:TOKEN
$org = $env:ORG
$baseURL = "https://apigee.googleapis.com/v1/organizations/"
$headers = @{Authorization = "Bearer $token"}

# Set your GitHub repository information
$repositoryOwner = "rajeshjanapati@gmail.com"
$repositoryName = "apigee-encrypt-keys"
$branchName = "encrypt/keys"  # Change this to the branch you want to access
$githubToken = "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"

# # Clone the repository
git clone https://github.com/rajeshjanapati/apigee-encrypt-keys.git
# cd $repositoryName

cd jsonfiles

# # Use Get-ChildItem to list all files in the directory with a .zip extension
$zipFiles = Get-ChildItem -Path $directoryPath -Filter *.zip

# Read JSON files
$jsonFiles = Get-ChildItem -Filter *.json -Recurse

# Loop through each JSON file and make POST requests
foreach ($jsonFile in $jsonFiles) {
    $jsonContent = Get-Content -Path $jsonFile -Raw
    # Parse the JSON content
    $jsonData = ConvertFrom-Json $jsonContent

    Write-Host $jsonData
}

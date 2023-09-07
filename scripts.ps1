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


# Define your GitHub username, repository names, branch name, and file path
$githubUsername = "rajeshjanapati"
$sourceRepo = "apigee-encrypt-keys"
$branchName = "encrypt/keys"
$filePath = "jsonfiles/base64_encoded_app.json"
$pat = "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"

# Define the GitHub API URL for fetching the file content from a specific branch
$apiUrl = "https://api.github.com/repos/$githubUsername/$sourceRepo/contents/$filePath?ref=$branchName"

# Set the request headers with your PAT
$headers = @{
    Authorization = "Bearer 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"
}

# Make a GET request to fetch the file content
$fileContent = Invoke-RestMethod -Uri $apiUrl -Headers $headers

# Parse and display the file content (in this case, it's assumed to be JSON)
$jsonContent = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($fileContent.content))
Write-Host "JSON File Content:"
Write-Host $jsonContent


# # # Clone the repository
# git clone https://github.com/rajeshjanapati/apigee-encrypt-keys.git
# # cd $repositoryName

# cd jsonfiles

# # # Use Get-ChildItem to list all files in the directory with a .zip extension
# $zipFiles = Get-ChildItem -Path $directoryPath -Filter *.zip

# # Read JSON files
# $jsonFiles = Get-ChildItem -Filter *.json -Recurse

# # Loop through each JSON file and make POST requests
# foreach ($jsonFile in $jsonFiles) {
#     $jsonContent = Get-Content -Path $jsonFile -Raw
#     # Parse the JSON content
#     $jsonData = ConvertFrom-Json $jsonContent

#     Write-Host $jsonData
# }

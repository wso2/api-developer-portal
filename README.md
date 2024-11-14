# Devportal Developer App

## Steps to Set Up the Project Locally

**Product Setup and Startup**
   - Download the project artifacts from the release
   - Execute the startup script based on the os

      - For Linux or MacOS

         ```bash
         sh startup.sh
         ```
      - For Windows
   
         ```bash
         startup.bat
         ```

   - Navigate to 'http://localhost:3000'
   - To change the design, edit the files in the pages, partials and layout folder and refresh.

## Steps to Set Up the Project in Production Environment

**Fork and Clone the Repository**
   - Fork the repository to your GitHub account.
   - Clone the repository using:
     ```bash
     git clone https://github.com/wso2/api-developer-portal.git
     ```

**Prerequisites [only in production]**
   - Install postgresql.
   - Create a database.

**Configs**
   - In the Config.toml, change the database configs accordingly.
   - Set the config.mode as production
      ```bash
      config.mode = 'production'
      ```

**Start the Project**

   - To populate the DB with mock data, run the data-dump.sql in the artifacts folder.

   - To create tables without mock data, run the script.sql in the artifacts folder.

   - To start the project and explore with mock data, run the following command.
      ```bash
     sh startup.sh
     ```
   - If you started with a data-dump, navigate to 'http://localhost:3000/ACME' and explore the pages.

   - If you started without data, first create an organization
      ```bash
      curl --location --request POST 'http://localhost:3000/devportal/organizations' \
         --header 'Content-Type: application/json' \
         --data-raw '{
         "orgName": "ACME",
         "businessOwner": "John Doe",
         "businessOwnerContact": "+94-76-123-456",
         "businessOwnerEmail": "john.doe@example.com"
      }'
     ```

   - Navigate to 'http://localhost:3000/{{orgName}}'
  
   - To change the design, edit the files in the pages, partials and layout folder and refresh.

   -  To create APIs, run the following command.
   ```bash
    curl --location 'http://localhost:devportal/organizations/{organizationID}/apis' \
      --form 'api-metadata="{
                     "apiInfo": { 
                        "referenceID": "12344",
                        "apiName": "NavigationAPI",
                        "orgName": "ACME",
                        "apiCategory": "Travel",
                        "apiDescription": "API for retrieving information about hotels and managing reservations",
                        "visibility" : "PRIVATE",
                        "visibleGroups": ["HR"],
                        "owners" : {
                        "technicalOwner": "john",
                        "technicalOwnerEmail": "john@gmail.com",
                        "businessOwner" : "sam",
                        "businessOwnerEmail":"sam@gmail.com"
                        },
                        "apiVersion" : "3.0.2",
                        "apiType" : "REST"    
                     },
                     "subscriptionPolicies": [
                        {
                           "policyName": "gold"
                        },
                        {
                           "policyName": "advanced"
                        },
                        {
                           "policyName": "platinum"
                        }
                     ],
                     "endPoints": {
                        "sandboxURL": "string",
                        "productionURL": "https://taxi-navigation.mnm.abc.com"
                     }
               }"; type=application/json' \
      --form 'apiDefinition=@"{apiDefinition.json}"'
   ```
-  The apiType values include REST, AsyncAPI, GraphQL or SOAP

-  This is a multi part request containing a json with metadata related to the API and a file attachement of the api schema definition file.

-  To upload the content to be displayed on the api-landing page, create a zip file with the folder structure as follows:
   ```
   {API NAME}
   └───content
      │   api-content.hbs
      │   apiContent.md
   └───images
      │   icon.svg
      │   product.png
   ```
   This is a mullti part request, containing the metadata about the images in the api landing page. This should be sent as a jsoon key value map,
   with the key referring to the name in the hbs where the image is referenced and the name of the image file as the value.
- Run the following command to upload the content
   ```bash
   curl --location --request PUT 'http://localhost:3000/devportal/organizations/{organizationID}/apis/{apiID}/template' \
        --form 'apiContent=@"{path-to-zip-file}"' \
        --form 'imageMetadata="{
                  \"api-icon\" : \"navigation.jpeg\",
                  \"api-hero\": \"api.svg\"
               }"'
   ```

## Project Structure and Layout

**Project Structure**
   - The `src` folder contains the page layout and content.
        - The `/src/layout` folder includes the main layout of the dev portal.
        - Other pages inherit this layout.
        - The `/src/pages` folder holds the content for the pages.
        - The `/src/partials` folder holds the common content for the pages.
        - The header and footer are injected as partials into the layout.
        - The `/src/images` folder contains the images.
   - The `mock` direcrory includes the mock API information.
  
**Mock APIs**
   - Mock APIs are displayed to define the structure.
   - In a production scenario, these will be replaced by actual publised APIs.

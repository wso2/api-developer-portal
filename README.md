# Devportal Developer App

## Steps to Set Up the Project

**Fork and Clone the Repository**
   - Fork the repository to your GitHub account.
   - Clone the repository using:
     ```bash
     git clone https://github.com/wso2/api-developer-portal.git
     ```
   
**Install Dependencies**
   - Navigate to the project directory and execute:
     ```bash
     npm install
     ```

**Start the Project**

   - To start the project and explore with mock data, run the following command.
      ```bash
     npm start
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
        - The `/src/styles` folder contains the styles applied for each component.
   - The `mock` directory includes the mock API information.
  
**Mock APIs**
   - Mock APIs are displayed to define the structure.
   - In a production scenario, these will be replaced by actual published APIs.

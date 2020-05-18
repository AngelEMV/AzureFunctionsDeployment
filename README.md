## Create infrastructure in Azure

As the infrastucture is created in Azure you have to be connected to an Azure subscription (It doesn't matter if is free or a "pay as you go"). 

Secondly, infrastructure scripts are done using [Hashicorp](https://www.hashicorp.com/ "Hashicorp")'s tool called [Terraform](https://www.terraform.io/ "Terraform"), so you must have to have it installed before running the scripts.

Place yourself inside Infrastructure folder where Terraform scripts are located and run ``` terraform apply ```

## Using Publish Profile as Deployment Credential

You may want to get the publish profile from your function app. Using publish profile as deployemnt credential is recommended
if you are not the owner of your Azure subscription.
1. In Azure portal, go to your function app.
2. Click **Get publish profile** and download **.PublishSettings** file.
3. Open the **.PublishSettings** file and copy the content.
4. Paste the XML content to your Github Repository > Settings > Secrets > Add a new secret > **SCM_CREDENTIALS**

## Create Azure function app and Deploy using GitHub Actions (Publish Profile)

Use the Function example created and the GitHub Actions template created to deploy to Azure

Remember to change **AZURE_FUNCTIONAPP_NAME** everytime you create the infrastructure or find unique name for it
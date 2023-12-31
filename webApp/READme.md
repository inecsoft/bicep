---

<div align="center">
<img src="images/bicep.jpg" width="700" />
</div>

### **Log in to Azure account using Azure CLI as a first step to interact with Azure resources by using the following command:**

```
az login -u student-3290-1937515@labscloudacademy.onmicrosoft.com -p Ca1_CLGWMsYV
```

#### The .bicep extension tells you that this is a deployment template written in the Bicep language. For any Bicep syntax-highlighting to occur, the file extension needs to be .bicep.

```
az deployment group --help
```

### **Initiate the following variables that will store the required values for the arguments mentioned:**

```
resourceGroupName=$(az group list --query "[].{name:name}" --output tsv)
deploymentName="cawebappdeployment"
templateFile="webApp.bicep"
```

### **Deploy the Bicep template using the following command:**

```
az deployment group create --resource-group $resourceGroupName --name $deploymentName --template-file $templateFile
```

```
 webAppName=$(az webapp list --query "[].{name:name}" --output tsv)
 az webapp show \
 --name $webAppName \
 --resource-group $resourceGroupName \
 --query "{Name:name, Location:location, ResourceGroup:resourceGroup}" \
 --output table
```

{
  $schema httpsschema.management.azure.comschemas2015-01-01deploymentTemplate.json#,
  contentVersion 1.0.0.0,
  parameters {
    innerResourceGroup {
      type string
    },
    innerSubscriptionID {
      type string,
      defaultValue 
    }
  },
  resources [
    {
      type Microsoft.StoragestorageAccounts,
      apiVersion 2019-06-01,
      name demostoreprimary1000,
      location East US,
      sku{
        name Standard_LRS
      },
      kind Storage,
      properties {
      }
    },
    {
      type Microsoft.Resourcesdeployments,
      apiVersion 2019-10-01,
      name nestedTemplate,
      resourceGroup [parameters('innerResourceGroup')],
      subscriptionId [parameters('innerSubscriptionID')],
      properties {
      mode Incremental,
      template {
          $schema httpsschema.management.azure.comschemas2015-01-01deploymentTemplate.json#,
          contentVersion 1.0.0.0,
          parameters {},
          variables {},
          resources [
          {
            type Microsoft.StoragestorageAccounts,
            apiVersion 2019-06-01,
            name demostoresecondary1000,
            location Central US,
            sku{
              name Standard_LRS
            },
            kind Storage,
            properties {
            }
          }
          ]
      },
      parameters {}
      }
    }
  ]
}
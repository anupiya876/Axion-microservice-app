1. Reader on rg-aks-env
az role assignment create \
  --assignee-object-id e79475a5-6d2c-4f1d-904a-5bddf3d2b7f2 \
  --assignee-principal-type ServicePrincipal \
  --role "Reader" \
  --scope "/subscriptions/f6fbc1c9-3988-4011-b7f4-179b5a7acf84/resourceGroups/rg-aks-env"

2. Contributor on Application Gateway
  az role assignment create \
  --assignee-object-id e79475a5-6d2c-4f1d-904a-5bddf3d2b7f2 \
  --assignee-principal-type ServicePrincipal \
  --role "Contributor" \
  --scope "/subscriptions/f6fbc1c9-3988-4011-b7f4-179b5a7acf84/resourceGroups/rg-aks-env/providers/Microsoft.Network/applicationGateways/appgw-aks-anu"


3. Network Contributor on AKS managed RG
  az role assignment create \
  --assignee-object-id e79475a5-6d2c-4f1d-904a-5bddf3d2b7f2 \
  --assignee-principal-type ServicePrincipal \
  --role "Network Contributor" \
  --scope "/subscriptions/f6fbc1c9-3988-4011-b7f4-179b5a7acf84/resourceGroups/MC_rg-aks-env_test-aks-anu_eastus"

4. AKS Role for Contribution
  az role assignment create \
    --assignee 6f2a8637-202e-492a-adb5-c03630e92833 \
    --role "Azure Kubernetes Service RBAC Cluster Admin" \
    --scope "/subscriptions/f6fbc1c9-3988-4011-b7f4-179b5a7acf84/resourceGroups/rg-aks-env/providers/Microsoft.ContainerService/managedClusters/test-aks-anu" 
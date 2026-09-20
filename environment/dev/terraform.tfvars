sub_id = "b8e77924-89da-41ce-8257-846989faab77"

resource_groups = {
  aks-rg = {
    name     = "axion-app-aks-rg"
    location = "koreacentral"
    tags = {
      env     = "dev"
      team    = "jarvis"
      project = "axion"
    }
  }
}

acrs = {
  acr1 = {
    acr_name      = "axionappacrakkc01"
    sku           = "Standard"
    admin_enabled = false
    rg_name       = "axion-app-aks-rg"
    location      = "koreacentral"
    tags = {
      env     = "dev"
      team    = "jarvis"
      project = "axion"
    }
  }
}

spns = {
  spn1 = {
    application_name       = "axion-terraform-app"
    service_principal_name = "axion-terraform-sp"
  }
  # ado-apn = {
  #   name = "spn-axion-cicd"
  # }
}


aks_clusters = {
  aks1 = {
    aks_name                  = "axion-app-aks"
    dns_prefix                = "devaksdns"
    rg_name                   = "axion-app-aks-rg"
    location                  = "koreacentral"
    oidc_issuer_enabled       = true
    workload_identity_enabled = true

    default_node_pool = {
      name                = "default"
      node_count          = 1
      vm_size             = "Standard_D4as_v5"
      enable_auto_scaling = true
      min_count           = 1
      max_count           = 1
    }
    identity = {
      type = "SystemAssigned"
    }
    network_profile = {
      network_plugin      = "azure"
      network_plugin_mode = "overlay"
      network_policy      = "calico"
      load_balancer_sku   = "standard"
    }

    tags = {
      env     = "dev"
      team    = "jarvis"
      project = "axion"
    }
  }
}

role_assignment = {
  dev = {
    spn_key = "spn1"
    aks_key = "aks1"
    acr_key = "acr1"
  }
}

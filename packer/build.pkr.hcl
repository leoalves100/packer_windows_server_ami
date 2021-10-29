packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "windows_server" {
  region         = "us-east-1"
  source_ami     = data.amazon-ami.windows-server.id
  instance_type  = "c5.2xlarge"
  ami_name       = "${var.name}_{{timestamp}}"
  communicator   = "winrm"
  user_data_file = "./config/bootstrap_winrm.txt"
  winrm_username = "Administrator"
  winrm_insecure = true
  winrm_use_ssl  = true
  winrm_port     = 5986
  # winrm_timeout  = "15m"
  tags = {
    Name = "${var.name}_{{timestamp}}"
  }
}


build {
  sources = [
    "source.amazon-ebs.windows_server"
  ]

  # habilitando o iis
  provisioner "powershell" {
    inline = [
      "Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole",
      "Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer"
    ]
  }

  # configurando iis
  provisioner "powershell" {
    scripts = [
      "./config/installModulesIIS.ps1"
    ]
  }

  provisioner "powershell" {
    inline = [
      "Remove-Item C:\\ProgramData\\Amazon\\EC2Launch\\state\\.run-once"
    ]
  }
  
}
data "amazon-ami" "windows-server" {
  filters = {
    name                = "Windows_Server-2022-English-Full-Base*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
  owners      = ["801119661308"]
  most_recent = true
}
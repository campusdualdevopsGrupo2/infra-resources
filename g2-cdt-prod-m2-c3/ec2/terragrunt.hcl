dependency "db" {
  config_path = "../db"
}

dependency "sg" {
  config_path = "../sg"
}

terraform {
  source = "git::https://github.com/campusdualdevopsGrupo2/cloud-resources.git//g2-cdt-prod-ec2?ref=main"
}

inputs = {
  region                 = "eu-west-2"
  ami                    = "ami-091f18e98bc129c4e"
  instance_type          = "t2.micro"
  key_name               = "my-key-name"
  subnet_id              = "subnet-0b0842bc836a4b6cb"
  security_group_ids     = [dependency.sg.outputs.security_group_id]
  instance_name          = "example-instance"
  ssh_user               = "ec2-user"
  private_key            = file("~/.ssh/id_rsa")
  provisioners = [
    {
      type   = "remote-exec"
      inline = [
        "echo 'Provisioning instance...'",
        "sudo yum update -y"
      ]
    },
    {
      type     = "file"
      source   = "./local_file.txt"
      destination = "/tmp/remote_file.txt"
    }
  ]
}

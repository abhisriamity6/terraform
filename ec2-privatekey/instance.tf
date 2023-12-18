provider "aws" {
region="us-east-1"
}

resource "aws_key_pair" mykey {
    key_name = "mykey_test"
    public_key = "${file("${var.publickeyPath}")}"

}


resource "aws_instance" "example1" {
        ami = "ami-033b95fb8079dc481"
        instance_type = "t2.micro"
        key_name = "${var.keyName}"
        vpc_security_group_ids =  [aws_security_group.ec2_security_groups.id]
        tags = {
                Name = "HVRTest"
                Function = "CouchbaseDev-Index"
                department = "IOC-CloudOps"
                team = "IOC-CloudOps"
                app = "Couchbase6.6.0"
                env = "dev"
                indexpartition = "/Index"
                date = "10-March-2022:22:56"
               }


provisioner "file" {
    source      = "install-nginx.sh"
    destination = "/tmp/install-nginx.sh"
  }

provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install-nginx.sh",
      "sudo sh /tmp/install-nginx.sh",
       ]
      }


connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = ""
    private_key = file(var.privatekeyPath)
    host        = self.private_ip
  }
}



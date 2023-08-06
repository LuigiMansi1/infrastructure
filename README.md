# Terraform code to build minimal usegalaxy-it infrastructure on OpenStack

## HOW TO RUN

- Install terraform >= 1.43.0
- `source <openstack_RC_file.sh>`
- create new ssh key pair
- `cd /infrastructure`
- check `vars.tf` and populate with your variables
- check `image.tf` and comment out if you have needed vgcn_image uploaded
- `terraform init`
- `terraform plan` or/then `terraform apply`
- output will produce necessary IPs for the next step

## Security groups

| VM          | Open connections                                                              |
| ----------- | ----------------------------------------------------------------------------- |
| Database    | ssh, 5432 (default postgres)                                                  |
| Backup      | ssh                                                                           |
| Replica     | ssh, 5432 (default postgres)                                                  |
| HTCondor CM | ssh, ping, 9618 (default htcondor)                                            |
| NFS server  | ssh                                                                           |
| RabbitMQ    | ssh, ping, 5671 (default mq), 15672 (UI)                                      |
| Galaxy      | ssh, ping, [80, 443, 8080] (web), 9618 (default htcondor), 1080 (default tus) |
| Control VM  | ssh                                                                           |


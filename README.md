# nomad-and-consul
Testing out running Consul and Nomad. 

## GCP

First we need to login to gcp
```bash
gcloud auth application-default login

# Replace with your project id
gcloud config set project PROJECT_ID
```

### Build Image

#### Prequists
* [gcloud CLI](https://cloud.google.com/sdk/docs/install)
* [packer](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli)

#### Build
```bash
# Setup Variables, we use london as default, update the script if you want to change this
sh packer/set-vars.sh

# Run Packer Build
packer init packer/gcp-almalinux-nomad-server.pkr.hcl
packer build -var-file=variables.pkrvars.hcl packer/gcp-almalinux-nomad-server.pkr.hcl
```

## K8s
Work in progress
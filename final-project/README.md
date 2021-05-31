# Final Project

<!-- TOC -->

- [Final Project](#final-project)
    - [Notes Before Starting](#notes-before-starting)
    - [Intro](#intro)
    - [Provider](#provider)
    - [Kubernetes Cluster](#kubernetes-cluster)
        - [Get the Cluster Config File](#get-the-cluster-config-file)
    - [Load Balancer](#load-balancer)
    - [DNS](#dns)
    - [MySQL](#mysql)
        - [Persistent Volume Claim](#persistent-volume-claim)
    - [Wordpress](#wordpress)
    - [Deployment](#deployment)

<!-- /TOC -->

## Notes Before Starting

* I was supposed to make this project in AWS, but creating an EKS cluster through terraform
was somewhat complicated; there were too many things to have in mind, and I did not have enough
time. Digital Ocean, instead, offers a simpler API, although this might have its disadvantages,
but for this demo, Digital Ocean is just perfect.

* This demo was taken and adapted from: https://github.com/pablokbs/peladonerd.

## Intro

This is a demo of a Wordpress website deployed using Terraform and Kubernetes on the cloud
provider Digital Ocean.

Why Terraform?

* It's a very simple to use tool that eases creation of infrastructure independently of the cloud
provider.
* Its learning curve is very small.

Why a Kubernetes cluster?

* It's becoming a very used orchestration platform for hosting workloads of thousands of
containers.
* Its learning curve is not too high.
* We use it a lot at work.

Why Digital Ocean?

* It's simple.
* It's free, at least for two months.


Steps before starting:

1. Create a Digital Ocean account. It'll give you 100$ of free credit for 2 months.
2. Install Terraform.

Continue reading for an explanation of each part of the deployment. If you just want to deploy
the solution read the [deployment section](#deployment).

## Provider

A token must be passed to Terraform so that it can authenticate against Digital Ocean.

Every environment variable that starts with `TF_VAR_<var-name>` will be loaded by Terraform
to the variable called `<var-name>`.

Create an access token through Digital Ocean GUI. Read this
[guide](https://docs.digitalocean.com/reference/api/create-personal-access-token/).

Define the environment variable:

```bash
export TF_VAR_digitalocean_token=<YOUR TOKEN>
```

See [_provider.tf](_provider.tf).

## Kubernetes Cluster

Creating a Kubernetes cluster is pretty simple. You just need to:

* Give it a name.
* Specify a region.
* Specify a version.
* Describe the nodes it will use.

  - Specify a prefix for the node names.
  - Specify the size of the nodes (CPU/RAM).
  - Specify the number of nodes.

See [01-main.tf](01-main.tf).

### Get the Cluster Config File

It's important to remember that you need a Kubeconfig file so that you can access later the
cluster using `kubectl`.

See [02-output.tf](02-output.tf).

## Load Balancer

A public load balancer is created pointing to the nodes that have the tag `hamilton-nodes`, with
target port `30000`, which is the port that will be later exposed when creating the `wordpress`
Kubernetes service.

See [03-loadbalancer.tf](03-loadbalancer.tf).

## DNS

Digital Ocean offers a DNS service, which is easily created, and a perfect fit for this demo.

The domain name created is: `cloud-computing.hamiltontm.com`.

See [04-dns.tf](04-dns.tf).

## MySQL

Deploying MySQL involves three parts:

1. The `Deployment` object, which describes the state of the system in terms of pods. That is,
how many pods, which image will they use, how much resources, etc. This `Deployment` object will
always try to maintain the system with that state; if a pod crashes, it will automatically deploy
a new one.

2. The `Service` object, which enables accessing the MySQL pods by a unique IP address, or internal
domain name. If there are multiple pods, this object will load balance the requests to all of them.
This `Service` is visible only inside the cluster.

3. A `volume` of type `persistentVolumeClaim` so that data can be persisted when a pod goes down.

See [02-mysql-deployment.yaml](kubernetes/02-mysql-deployment.yaml).

### Persistent Volume Claim

The Persistent Volume Claim (PVC) allows us to dynamically create a node-independent storage in
Digital Ocean which can later be claimed by pods and mounted in the node where the pod is deployed.

See [01-mysql-pvc.yaml](kubernetes/01-mysql-pvc.yaml).

## Wordpress

Deploying Wordpress involves two parts:

1. The `Deployment` object. In this case, we specify that the pod will use the Wordpress' Docker
image `wordpress:4.8-apache`; we also specify the environment variables: `WORDPRESS_DB_HOST` and
`WORDPRESS_DB_PASSWORD`; and we expose the port `80` in the pod.

2. The `Service` object. In this case, the service will be used to expose wordpress in the node
through port `30000`, which is the port pointed to by the load balancer. Hence, this service will
be available to the Internet.

See [03-wordpress-deployment.yaml](kubernetes/03-wordpress-deployment.yaml).

## Deployment

1. Recall that you must define the environment variable `TF_VAR_digitalocean_token`.
2. Download Digital Ocean's Terraform provider:

   ```bash
   terraform init
   ```

3. Deploy the infrastructure:

   ```bash
   terraform apply
   ```

4. Deploy the `wordpress` service:

   ```bash
   kubectl --kubeconfig=kubeconfig.yaml apply -f kubernetes/01-mysql-pvc.yaml
   kubectl --kubeconfig=kubeconfig.yaml apply -f kubernetes/02-mysql-deployment.yaml
   kubectl --kubeconfig=kubeconfig.yaml apply -f kubernetes/03-wordpress-deployment.yaml
   ```

5. Visit this link:

   ```
   http://cloud-computing.hamiltontm.com/2021/05/31/hola-profe/
   ```

   If you experience a problem with the DNS, visit this link:

   ```
   http://174.138.108.196/2021/05/31/hola-profe/
   ```

   Problems with DNS records in Digital Ocean seems like a common issue among clients.
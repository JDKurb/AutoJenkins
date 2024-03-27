create AWS account
create AWS access token
install awscli, helm, kubectl

terraform init
terraform apply --auto-approve

wait

aws eks update-kubeconfig --region us-east-2 --name jenkins-eks-cluster

helm install -f values.yaml auto-jenkins oci://registry-1.docker.io/bitnamicharts/jenkins

1. Get the Jenkins URL by running:

** Please ensure an external IP is associated to the auto-jenkins service before proceeding **

** Watch the status using: kubectl get svc --namespace default -w auto-jenkins **

  export SERVICE_IP=$(kubectl get svc --namespace default auto-jenkins --template "{{ range (index .status.loadBalancer.ingress 0) }}{{ . }}{{ end }}")
 
  echo "Jenkins URL: http://$SERVICE_IP/"

2. Login with the following credentials

  Username: admin
  
  Password: "hireme123!"

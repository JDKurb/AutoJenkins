create AWS account
create AWS access token
install awscli, helm, kubectl

terraform init
terraform apply --auto-approve

wait

aws eks update-kubeconfig --region us-east-2 --name jenkins-eks-cluster

helm install auto-jenkins oci://registry-1.docker.io/bitnamicharts/jenkins

1. Get the Jenkins URL by running:

** Please ensure an external IP is associated to the auto-jenkins service before proceeding **
** Watch the status using: kubectl get svc --namespace default -w auto-jenkins **

  export SERVICE_IP=$(kubectl get svc --namespace default auto-jenkins --template "{{ range (index .status.loadBalancer.ingress 0) }}{{ . }}{{ end }}")
  echo "Jenkins URL: http://$SERVICE_IP/"

2. Login with the following credentials

  echo Username: user
  echo Password: $(kubectl get secret --namespace default auto-jenkins -o jsonpath="{.data.jenkins-password}" | base64 -d)

WARNING: There are "resources" sections in the chart not set. Using "resourcesPreset" is not recommended for production. For production installations, please set the following values according to your workload needs:
  - resources
  - tls.resources
+info https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/

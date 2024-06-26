terraform init
terraform apply --auto-approve
aws eks update-kubeconfig --region us-east-2 --name jenkins-eks
cd jenkins
sudo service docker start
aws ecr create-repository --repository-name custom-jenkins --region us-east-2
aws ecr create-repository --repository-name weather --region us-east-2
aws ecr get-login-password | sudo docker login --username AWS --password-stdin 905418215051.dkr.ecr.us-east-2.amazonaws.com
sudo docker build -t custom-jenkins .
sudo docker tag custom-jenkins:latest 905418215051.dkr.ecr.us-east-2.amazonaws.com/custom-jenkins:latest
sudo docker push 905418215051.dkr.ecr.us-east-2.amazonaws.com/custom-jenkins:latest
helm install -f values.yaml auto-jenkins oci://registry-1.docker.io/bitnamicharts/jenkins
export SERVICE_IP=$(kubectl get svc --namespace default auto-jenkins --template "{{ range (index .status.loadBalancer.ingress 0) }}{{ . }}{{ end }}") && echo "Jenkins URL: http://$SERVICE_IP/"
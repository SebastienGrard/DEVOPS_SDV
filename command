##
##
Installation de DOCKER
##
##

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc


# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install the Docker Package
 sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#Verify that Docker is running well
 sudo docker run hello-world

#Verify that the system is not already running a docker image
 docker ps
#Check Pyhton version
 python3





##
##
Installation de GRAFANA
##
##

#Pull de l'image
docker pull grafana/grafana

#Lancement du container
docker run -d -p 3000:3000 --name=grafana grafana/grafana

#Penser à ouvrir le port de la VM
(3000)




##
##
Installation de PROMETHEUS
##
##

#Pull de l'image
docker pull prom/promtheus

#Lancement du container
docker run -d -p 9090:9090 --name=prometheus prometheus/prometheus

#Penser à ouvrir le port de la VM
(9090)



##
##
Installation de FLASK
##
##

#Installation de Python3-pip
sudo apt install python3-pip

#Création du fichier 'requirements.txt'
click==8.0.3
colorama==0.4.4
Flask==2.0.2
itsdangerous==2.0.1
Jinja2==3.0.3
MarkupSafe==2.0.1
Werkzeug==2.0.2
gunicorn==20.1.0



#Execution du fichier requirements
pip install -r requirements.txt



#Création fichier view.py
from flask import Flask, render_template
import os

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 5066))
    app.run(debug=True, host='0.0.0.0', port=port)


#Création du fichier DOCKERFILE
sudo docker image build -t flask_docker .







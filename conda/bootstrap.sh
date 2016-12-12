# setup git
sudo apt-get install git -y
git config --global user.name "roryk"
git config --global user.email = "rory.kirchner@gmail.com"

# install conda
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -b

# install docker
sudo apt-get update -y
sudo apt-get install apt-transport-https ca-certificates -y
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee -a /etc/apt/sources.list.d/docker.list
sudo apt-get update -y
apt-cache policy docker-engine
sudo apt-get install docker-engine -y
sudo gpasswd -a ${USER} docker 
sudo service docker start
sudo docker run hello-world

# setup bioconda
git clone https://github.com/roryk/bioconda-recipes.git
cd bioconda-recipes/
git remote add upstream https://github.com/bioconda/bioconda-recipes.git

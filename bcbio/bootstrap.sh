#!/bin/bash
sudo apt-get install leiningen
sudo apt-get update
sudo apt-get install -y build-essential
sudo apt-get install -y git
sudo apt-get install -y libz-dev
mkdir tmp
cd tmp
wget https://raw.github.com/chapmanb/bcbio-nextgen/master/scripts/bcbio_nextgen_install.py
sudo python bcbio_nextgen_install.py /usr/local/share/bcbio-nextgen --tooldir=/usr/local/bcbio --nodata
cd ~
echo "export PATH=/usr/local/share/bcbio-nextgen/bin:$PATH" >> .bashrc
echo "set -o vi" >> .bashrc
source .bashrc
sudo /usr/local/share/bcbio-nextgen/anaconda/bin/conda install mysql-python
cd tmp
git clone https://github.com/daler/gffutils
cd gffutils
sudo /usr/local/share/bcbio-nextgen/anaconda/bin/python setup.py install
cd ..
wget http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-1.8.0-Linux-x86_64.sh
bash Anaconda-1.8.0-Linux-x86_64.sh
cd ~
rm -rf tmp
echo "deb http://cran.rstudio.com/bin/linux/ubuntu `lsb_release -cs`/" | sudo tee /etc/apt/sources.list.d/cran.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo apt-get update -o Dir::Etc::sourcelist="sources.list.d/cran.list" -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0"
sudo apt-add-repository -y ppa:marutter/c2d4u
sudo apt-get update -o Dir::Etc::sourcelist="sources.list.d/marutter-c2d4u-precise.list" -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0"
sudo apt-get install fabric
sudo apt-get install r-base-dev r-cran-xml r-cran-rcurl r-cran-rgl r-recommended
"[ ! -d ${R_LIBS_USER} ] && mkdir ${R_LIBS_USER}"
R --version
R -e '.libPaths(); sessionInfo()'
Rscript resources/scripts/install_libraries.R

!/bin/bash
#####################
# Jenkins Install

# install java and git
sudo apt-get install python3
# check if a jenkins user already exists
if ! cat /etc/passwd | grep python; then
	# add the jenkins user
	sudo useradd -m -s /bin/bash python
fi
# check if the sudoers file has jenkins in it already
if ! sudo cat /etc/sudoers | grep python; then 
	# make jenkins a sudo user
	echo 'python ALL=(ALL:ALL) NOPASSWD:ALL' | sudo EDITOR='tee -a' visudo
fi
# make sure jenkins owns the jenkins.war file
sudo chown python:python /home/python/app.py
# install the jenkins service script
sudo cp python-systemd-http-server.service /etc/systemd/system/python-systemd-http-server.service
# reload all of the systemd service scripts
sudo systemctl daemon-reload
# start the jenkins service
sudo systemctl restart python-systemd-http-server

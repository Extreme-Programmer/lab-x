yes '' | ssh-keygen -N '' -f ./remote-server  > /dev/null
########filename:Dockerfile
echo ""                                                                                                                      > Dockerfile
echo "FROM ubuntu:latest"                                                                                                   >> Dockerfile
echo "RUN  mkdir -p /var/run/sshd"                                                                                          >> Dockerfile
echo "RUN  apt-get update && apt-get install -y openssh-server"                                                             >> Dockerfile
echo "RUN  apt-get update && apt-get -y upgrade && apt-get install -y openjdk-8-jdk openssh-server sudo"                    >> Dockerfile
echo "RUN  useradd -rm -d /home/remote_user -s /bin/bash remote_user && echo remote_user:pass1234 | chpasswd"               >> Dockerfile
echo "RUN  echo 'root:root-user' | chpasswd #RUN  echo 'root-user' | passwd --stdin root"                                   >> Dockerfile
echo "RUN  mkdir /home/remote_user/.ssh/ && chmod 700 /home/remote_user/.ssh"                                               >> Dockerfile
echo "COPY id_rsa.pub /home/remote_user/.ssh/authorized_keys"                                                               >> Dockerfile
echo "RUN  chown remote_user:remote_user -R /home/remote_user/.ssh && chmod 600 /home/remote_user/.ssh/authorized_keys"     >> Dockerfile
echo "CMD  [ \"/usr/sbin/sshd\" , \"-D\" ]" >> Dockerfile

docker build -t remote_server .
docker run -d --name remote_server -it -p 58897:22 remote-server
ssh -i ./id_rsa remote_user@localhost -p 58897
rm -rf ./Dockerfile


echo ""                                                                                                                      > userGuide.txt
echo "########filename:userGuide.txt"                                                                                       >> userGuide.txt
echo "# get started with new ui in opened docker container:"                                                                >> userGuide.txt
echo "wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"                           >> userGuide.txt
echo "wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"                           >> userGuide.txt
echo "wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"                           >> userGuide.txt
echo "wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"                     >> userGuide.txt
echo "sh -c '$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)'"                                  >> userGuide.txt
echo "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k"                                     >> userGuide.txt
echo "echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc"                                                     >> userGuide.txt
echo "chsh -s $(which zsh)"                                                                                                 >> userGuide.txt
echo "# to use sudo <command>:"                                                                                             >> userGuide.txt
echo "docker exec -it remote_server /bin/bash"                                                                              >> userGuide.txt
echo "echo 'remote_user ALL=(ALL)  ALL' >> /etc/sudoers"                                                                    >> userGuide.txt
echo "# to use sudo <command>:"                                                                                             >> userGuide.txt
echo "docker exec -it remote_server /bin/bash"                                                                              >> userGuide.txt
echo "echo 'remote_user ALL=(ALL)  ALL' >> /etc/sudoers"                                                                    >> userGuide.txt


ecco "+----------------------------+"                                                                                       >> userGuide.txt
echo "| USERNAME         PASSWORD  |"                                                                                       >> userGuide.txt
ecco "|----------------------------|"                                                                                       >> userGuide.txt
echo "| ROOT             ROOT-USER |"                                                                                       >> userGuide.txt
ecco "|----------------------------|"                                                                                       >> userGuide.txt
echo "| REMOTE_USER      PASS1234  |"                                                                                       >> userGuide.txt
ecco "+----------------------------+"                                                                                       >> userGuide.txt

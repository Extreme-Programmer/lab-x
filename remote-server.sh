(ls ./remote-server-key && rm -rf ./remote-server-key) || echo "no action needed"
(ls ./remote-server-key.pub && rm -rf ./remote-server-key.pub) || echo "no action needed"
yes '' | ssh-keygen -N '' -f ./remote-server-key  > /dev/null
########filename:Dockerfile
(ls Dockerfile && rm -rf Dockerfile) || echo "no action needed"
echo "FROM ubuntu:latest"                                                                                                   >> Dockerfile
echo "RUN  mkdir -p /var/run/sshd"                                                                                          >> Dockerfile
echo "RUN  apt-get update && apt-get install -y openssh-server"                                                             >> Dockerfile
echo "RUN  apt-get update && apt-get -y upgrade && apt-get install -y openjdk-8-jdk openssh-server sudo"                    >> Dockerfile
echo "RUN  useradd -rm -d /home/remote_user -s /bin/bash remote_user && echo remote_user:pass1234 | chpasswd"               >> Dockerfile
echo "RUN  echo 'root:root-user' | chpasswd #RUN  echo 'root-user' | passwd --stdin root"                                   >> Dockerfile
echo "RUN  mkdir /home/remote_user/.ssh/ && chmod 700 /home/remote_user/.ssh"                                               >> Dockerfile
echo "COPY remote-server-key.pub /home/remote_user/.ssh/authorized_keys"                                                    >> Dockerfile
echo "RUN  chown remote_user:remote_user -R /home/remote_user/.ssh && chmod 600 /home/remote_user/.ssh/authorized_keys"     >> Dockerfile
echo "CMD  [ \"/usr/sbin/sshd\" , \"-D\" ]"                                                                                 >> Dockerfile

(ls userGuide.txt && rm -rf userGuide.txt) || echo "no action needed"
echo "########filename:userGuide.txt"                                                                                       >> userGuide.txt
echo "# get started with new ui in opened docker container:"                                                                >> userGuide.txt
echo "wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"                           >> userGuide.txt
echo "wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"                           >> userGuide.txt
echo "wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"                           >> userGuide.txt
echo "wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"                     >> userGuide.txt
echo "sh -c '\$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)'"                                  >> userGuide.txt
echo "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k"                                     >> userGuide.txt
echo "echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc"                                                     >> userGuide.txt
echo "chsh -s \$(which zsh)"                                                                                                 >> userGuide.txt
echo "# to use sudo <command>:"                                                                                             >> userGuide.txt
echo "docker exec -it remote_server /bin/bash"                                                                              >> userGuide.txt
echo "echo 'remote_user ALL=(ALL)  ALL' >> /etc/sudoers"                                                                    >> userGuide.txt

echo "+----------------------------+"                                                                                       >> userGuide.txt
echo "| USERNAME         PASSWORD  |"                                                                                       >> userGuide.txt
echo "|----------------------------|"                                                                                       >> userGuide.txt
echo "| ROOT             ROOT-USER |"                                                                                       >> userGuide.txt
echo "|----------------------------|"                                                                                       >> userGuide.txt
echo "| REMOTE_USER      PASS1234  |"                                                                                       >> userGuide.txt
echo "+----------------------------+"                                                                                       >> userGuide.txt

docker build -t remote_server .
docker run -d --name remote_server -it -p 58897:22 remote-server
ssh -i ./remote-server-key remote_user@localhost -p 58897
#rm -rf ./Dockerfile

# #!/bin/bash
# if [ -e x.txt ]
# then
#     echo "ok"
# else
#     echo "nok"
# fi
#(ls x.txt && echo yes) || echo no

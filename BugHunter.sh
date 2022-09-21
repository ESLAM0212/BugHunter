#!/bin/bash

#colors
Red="\e[31m";
Blue="\e[34m";
Green="\e[32m";
Yellow="\e[33m";
blink="\e[5m";
end="\e[0m";

#banner

echo -e "${Blue}
██████╗ ██╗   ██╗ ██████╗ ██╗  ██╗██╗   ██╗███╗   ██╗████████╗███████╗██████╗ 
██╔══██╗██║   ██║██╔════╝ ██║  ██║██║   ██║████╗  ██║╚══██╔══╝██╔════╝██╔══██╗
██████╔╝██║   ██║██║  ███╗███████║██║   ██║██╔██╗ ██║   ██║   █████╗  ██████╔╝
██╔══██╗██║   ██║██║   ██║██╔══██║██║   ██║██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗
██████╔╝╚██████╔╝╚██████╔╝██║  ██║╚██████╔╝██║ ╚████║   ██║   ███████╗██║  ██║
╚═════╝  ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
                                                        ${end} by @ESLAM2012"
#check for root
if [ $EUID -ne 0 ]
 then echo -e "${Red} Run it as a Root..! ${end}";
 exit
fi

echo -e "${Green}[*]Starting...${end}";

#make dir and get into

mkdir BugHunter&&cd BugHunter 

#install git ,go ,python3,python2,ruby

Requirements(){

echo -e "${Green}[*]Check for languages...${end}";
sleep 1s;

Git=$(git --version ) &>/dev/null ;
Go=$(go version ) &>/dev/null;
Python=$(python3 --version) &>/dev/null;
ruby=$(ruby -v) &>/dev/null;

#check for git
if command -v git &>/dev/null 
then echo "Git is already installed =>$Git.";
else
 echo -e "${Yellow}Git is not installed.${end}";
 echo -e "${blink}[*]Installing Git...${end} ";
 apt-get install git -y &>/dev/null
 if  command -v git 
 then
	echo -e "${Green}Git has been installed successfuly.and your $Git.${end}";
 fi
fi


#check for go

sleep 1s;
if command -v go &>/dev/null 
then echo "Go is already installed =>$Go.";
else
 echo -e "${Yellow}Go is not installed.${end}";
 echo -e "${blink}[*]Installing Go...${end} ";
 apt install golang-go -y &>/dev/null
 if  command -v go 
 then
        echo -e "${Green}Go has been installed successfuly.and your $Go.${end}";
 fi
fi


#check for python3
sleep 1s;
if command -v python3 &>/dev/null 
then echo "Python3 is already installed =>$Python.";
else
 echo -e "${Yellow}Python3 is not installed.${end}";
 echo -e "${blink}[*]Installing Python3...${end} ";
 apt install python3 -y &>/dev/null
 apt install python3-pip -y &> /dev/null
 apt install python2 -y &>/dev/null
 apt install python-pip -y  

 if  command -v python3
 then
        echo -e "${Green}python3 has been installed successfuly.and your $Python.${end}";
 fi
fi


#check for ruby
sleep 1s;
if command -v ruby &>/dev/null 
then echo "ruby is already installed =>$ruby.";
else
 echo -e "${Yellow}rupy is not installed.${end}";
 echo -e "${blink}[*]Installing rupy...${end} ";
 apt-get install ruby-full -y  &>/dev/null
 if  command -v ruby
 then
        echo -e "${Green}ruby has been installed successfuly.and your $ruby.${end}";
 fi
fi

}

Tools(){
echo -e "${Green}[*]Now installing Tools... ${end}";
echo -e "${Green}
############################
#      Recon tools         #                          
############################
${end}";

#downlad subfinder

if ! command subfinder -h &>/dev/null
then
read -p "[1]Do you want install subfinder?(y/n):" c
case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading subfinder now..${end}"

 go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest &>/dev/null
 cp $HOME/go/bin/subfinder /usr/local/bin
echo -e "${Green}Installing subfinder done ..${end}"
esac

else
        echo -e "${Yellow}[*]Subfinder is already installed.${end}";

fi

#downlad sublister
read -p "[2]Do you want install sublister?(y/n):" c

case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading sublister now..${end}"
git clone https://github.com/aboul3la/Sublist3r.git &>/dev/null
cd Sublist3r/
pip install -r requirements.txt &>/dev/null
cd ..
 echo -e "${Green}[*]Installing sublister done ..${end}"
 
esac


#downlad lazyrecon
read -p "[3]Do you want install lazyrecon?(y/n):" c

case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading lazyrecon now..${end}"
git clone https://github.com/nahamsec/lazyrecon.git &>/dev/null
 echo -e "${Green}[*]Installing lazyrecon done ..${end}"
esac


#downlad subdomainer
read -p "[4]Do you want install subdomainer(cyber guy)?(y/n):" c
case $c in
 y|Y|Yes|yes)  
 echo -e "${blink}[*]downloading subdoaminer now..${end}"   
git clone https://github.com/Cyber-Guy1/Subdomainer.git &>/dev/null
 echo -e "${Green}[*]Installing subdomainer done ..${end}"
 echo -e "${Red}[*][*]You have to take a look for install script inside Subdomainer folder ..${end}"

esac


#downlad gf

if ! command gf -h &>/dev/null
then
read -p "[5]Do you want install gf?(y/n):" c
case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading gf now..${end}"

 go install -v  github.com/tomnomnom/gf@latest &>/dev/null
 cp $HOME/go/bin/gf /usr/local/bin
echo -e "${Green}[*]Installing gf done ..${end}"
esac

else
        echo -e "${Yellow}[*]gf is already installed.${end}";

fi

#downlad uro

if ! command uro &>/dev/null
then
read -p "[6]Do you want install uro?(y/n):" c
case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading uro now..${end}"
pip3 install uro &>/dev/null
echo -e "${Green}[*]Installing uro done ..${end}"
esac

else
        echo -e "${Yellow}[*]uro is already installed.${end}";

fi


#downlad httpx

if ! command httpx  &>/dev/null
then
read -p "[7]Do you want install httpx?(y/n):" c
case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading httpx now..${end}"

 go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest &>/dev/null
 cp $HOME/go/bin/httpx /usr/local/bin
echo -e "${Green}[*]Installing httpx done ..${end}"
esac

else
        echo -e "${Yellow}[*]httpx is already installed.${end}";

fi

#downlad waybackurls

if ! command waybackurls -h  &>/dev/null
then
read -p "[8]Do you want install waybackurls?(y/n):" c
case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading waybackurls now..${end}"

 go install -v github.com/tomnomnom/waybackurls@latest &>/dev/null
 cp $HOME/go/bin/waybackurls /usr/local/bin
echo -e "${Green}[*]Installing waybackurls done ..${end}";
esac

else
        echo -e "${Yellow}[*]waybackurls is already installed.${end}";

fi

#downlad logsensor
read -p "[9]Do you want install logsensor?(y/n):" c

case $c in
 y|Y|Yes|yes)
echo -e "${blink}[*]downloading logsensor now..${end}"
git clone https://github.com/Mr-Robert0/Logsensor.git &>/dev/null
cd Logsensor && chmod +x logsensor.py install.sh 
pip install -r requirements.txt &>/dev/null
./install.sh
cd ..
 echo -e "${Green}[*]Installing logsensor done ..${end}"
esac


#downlad httrack

if ! command httrack --help  &>/dev/null
then
read -p "[10]Do you want install httrack?(y/n):" c
case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading httrack now..${end}"

 apt install httrack &>/dev/null
echo -e "${Green}[*]Installing httrack done ..${end}"

esac

else
        echo -e "${Yellow}[*]httrack is already installed.${end}";

fi

echo -e "${Green}
############################
#      fuzzing tools       #                          
############################
${end}";

#downlad dirsearch
read -p "[1]Do you want install dirsearch?(y/n):" c

case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading dirsearch now..${end}"
 git clone https://github.com/maurosoria/dirsearch.git &>/dev/null
cd dirsearch
pip3 install -r requirements.txt &>/dev/null
cd ..
 echo -e "${Green}[*]Installing dirsearch done ..${end}"
esac


#downlad ffuf

if ! command ffuf -h  &>/dev/null
then
read -p "[2]Do you want install ffuf?(y/n):" c
case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading ffuf now..${end}"

 apt install ffuf &>/dev/null
echo -e "${Green}[*]Installing ffuf done ..${end}"
esac

else
        echo -e "${Yellow}[*]ffuf is already installed.${end}";

fi

#downlad wfuzz

if ! command wfuzz -h  &>/dev/null
then
read -p "[3]Do you want install wfuzz ?(y/n):" c
case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading wfuzz  now..${end}"

 apt install ffuf &>/dev/null
echo -e "${Green}[*]Installing wfuzz  done ..${end}"
esac

else
        echo -e "${Yellow}[*]wfuzz is already installed.${end}";

fi


#downlad dirb

if ! command -v dirb  &>/dev/null
then
read -p "[4]Do you want install dirb ?(y/n):" c
case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading dirb now..${end}"

 apt install dirb &>/dev/null
echo -e "${Green}[*]Installing dirb done ..${end}"
esac

else
        echo -e "${Yellow}[*]dirb is already installed.${end}";

fi

echo -e "${Green}
############################
#     parameter finder     #                          
############################
${end}";

#downlad  paramspider
read -p "[1]Do you want install paramspider?(y/n):" c

case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading paramspider now..${end}"
 git clone https://github.com/devanshbatham/ParamSpider &>/dev/null
 cd ParamSpider
 pip3 install -r requirements.txt &>/dev/null
cd ..
 echo -e "${Green}[*]Installing paramspider done ..${end}"
esac

#downlad gospider

if ! command -v gospider  &>/dev/null
then
read -p "[2]Do you want install gospider ?(y/n):" c
case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading gospider now..${end}"

 go install github.com/jaeles-project/gospider@latest &>/dev/null
 cp ${HOME}/go/bin/gospider /usr/local/bin
echo -e "${Green}[*]Installing gospider done ..${end}"
esac

else
        echo -e "${Yellow}[*]gospider is already installed.${end}";

fi

#downlad arjun

if ! command -v arjun  &>/dev/null
then
read -p "[3]Do you want install arjun ?(y/n):" c
case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading arjun now..${end}"

 pip install arjun &>/dev/null
echo -e "${Green}[*]Installing arjun done ..${end}"
esac

else
        echo -e "${Yellow}[*]arjun is already installed.${end}";

fi

echo -e "${Green}
############################
#       port scan          #                          
############################
${end}";


#downlad  autoRecon
read -p "[1]Do you want install autoRecon?(y/n):" c

case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading autoRecon now..${end}"
 git clone https://github.com/Tib3rius/AutoRecon.git &>/dev/null
 cd AutoRecon
 pip3 install -r requirements.txt &>/dev/null
cd ..
 echo -e "${Green}[*]Installing autoRecon done ..${end}"
esac

# download nmap
if ! command -v nmap  &>/dev/null
then
read -p "[3]Do you want install nmap ?(y/n):" c
case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading nmap now..${end}"

 apt install nmap &>/dev/null
echo -e "${Green}[*]Installing nmap done ..${end}"
esac

else
        echo -e "${Yellow}[*]nmap is already installed.${end}";

fi


echo -e "${Green}
############################
#         SQLI             #                          
############################
${end}";


# download sqlmap
if ! command -v sqlmap  &>/dev/null
then
read -p "[1]Do you want install sqlmap ?(y/n):" c
case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading sqlmap now..${end}"

 apt install sqlamp &>/dev/null
echo -e "${Green}[*]Installing sqlmap done ..${end}"
esac

else
        echo -e "${Yellow}[*]sqlmap is already installed.${end}";

fi

#downlad  nosqlmap
read -p "[2]Do you want install nosqlmap?(y/n):" c

case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading nosqlmap now..${end}"
 git clone https://github.com/codingo/NoSQLMap.git &>/dev/null
 cd NoSQLMap
 python setup.py install &>/dev/null
 cd ..
 echo -e "${Green}[*]Installing nosqlmap done ..${end}"
esac

echo -e "${Green}
############################
#          Xss             #                          
############################
${end}";

#downlad gospider

if ! command -v kxss  &>/dev/null
then
read -p "[2]Do you want install kxss ?(y/n):" c
case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading kxss now..${end}"

 go install github.com/Emoe/kxss@latest &>/dev/null
 cp ${HOME}/go/bin/kxss /usr/local/bin
echo -e "${Green}[*]Installing kxss done ..${end}"
esac

else
        echo -e "${Yellow}[*]kxss is already installed.${end}";

fi

#downlad  ksstrike
read -p "[2]Do you want install XSStrike?(y/n):" c

case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading XSStrike now..${end}"
 git clone https://github.com/s0md3v/XSStrike.git &>/dev/null
 cd XSStrike
 pip install -r requirements.txt  &>/dev/null
 cd ..
 echo -e "${Green}[*]Installing XSStrike done ..${end}"
esac


echo -e "${Green}
############################
#       pybass 403         #                          
############################
${end}";

if ! command -v dontgo403  &>/dev/null
then
read -p "[1]Do you want install dontgo403 ?(y/n):" c
case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading dontgo403 now..${end}"

 git clone https://github.com/devploit/dontgo403; cd dontgo403; go get; go build &>/dev/null
 cp dontgo403 /usr/local/bin
cd ..
echo -e "${Green}[*]Installing dontgo403 done ..${end}"
esac

else
        echo -e "${Yellow}[*]dontgo403 is already installed.${end}";

fi


echo -e "${Green}
############################
#    subdomain takeover    #                          
############################
${end}";


if ! command -v subzy  &>/dev/null
then
read -p "[1]Do you want install subzy ?(y/n):" c
case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading subzy now..${end}"

 go install github.com/lukasikic/subzy@latest &>/dev/null
 cp ${HOME}/go/bin/subzy /usr/local/bin

echo -e "${Green}[*]Installing subzy done ..${end}"
esac 

else 
        echo -e "${Yellow}[*]subzy is already installed.${end}";

fi  


echo -e "${Green}
############################
#       vuln scanner       #                          
############################
${end}";




if ! command -v nuclei  &>/dev/null
then
read -p "[1]Do you want install nuclei ?(y/n):" c
case $c in   
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading nuclei now..${end}"

 go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest &>/dev/null
 cp ${HOME}/go/bin/nuclei /usr/local/bin

echo -e "${Green}[*]Installing nuclei done ..${end}"
esac 

else 
        echo -e "${Yellow}[*]nuclei is already installed.${end}";

fi  




if ! command -v nikto  &>/dev/null
then
read -p "[1]Do you want install nikto ?(y/n):" c
case $c in
 y|Y|Yes|yes)
 echo -e "${blink}[*]downloading nikto now..${end}"

 apt install nikto &>/dev/null

echo -e "${Green}[*]Installing nikto done ..${end}"
esac 

else 
        echo -e "${Yellow}[*]nikto is already installed.${end}";

fi  


echo "nessus essential : https://www.tenable.com/products/nessus/nessus-essentials"

echo -e "${Green}
############################
#       crack tools        #                          
############################
${end}";

echo -e "${Red}burpsite pro${end} : https://www.dr-farfar.com/burp-suite-professional-full/ ";
echo -e "${Red}accuentix 13.4${end} : https://drive.google.com/drive/folders/1h6-k_w0I6mSeav_LQEKOoRS6g4Tr_zU_ ";

}

Requirements
Tools

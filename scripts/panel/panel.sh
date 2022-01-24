#!/bin/bash
# UraniunsScript - by Blast [Blast#8454]
# It is not necessary to change any line of code, change it at your own risk
#
echo -e "\e[96m!───────────────────────!"
echo -e "\e[96m!─╔╦╗╔═╦╗╔══╗──╔══╗╔╗╔╗─!"
echo -e "\e[96m!─║║║║║║║║══╣──║══╣║╚╝║─!"
echo -e "\e[96m!─║║║║║║║╠══║╔╗╠══║║╔╗║─!"
echo -e "\e[96m!─╚═╝╚╩═╝╚══╝╚╝╚══╝╚╝╚╝─!"
echo -e "\e[96m!───────────────────────!"
#
PS3='Choose what you want to run : '
options=("Purpur" "Mohist" "Fabric" "Forge" "DL" "Stop")
select opt in "${options[@]}"
do
    case $opt in
        "Purpur")
            echo -e "\033[0;37m==============================\033[00m"
            echo -e "\033[01;32mChoose Minecraft Version\033[00m"
            echo -e "\033[0;37m==============================\033[00m"
            echo -e -n "\033[1;34mVersion: \033[00m"
            read -r version
            
            echo -e "\033[0;37m==============================\033[00m"
            echo -e "\033[0;33mDownloading\033[00m \033[1;33m Purpur\033[00m\033[0;33m...\033[00m"
            echo -e "\033[0;37m==============================\033[00m"
            
            curl -s -o server.jar -sS "https://api.pl3x.net/v2/purpur/$version/latest/download"
            
            echo -e "\033[1;34mDownload completed!\033[00m"
            
            echo -e "\033[0;37m==============================\033[00m"
            echo -e "\033[1;32mStarting the System...\033[00m"
            echo -e "\033[0;37m==============================\033[00m"
            
            java -Xms128M -Xmx"${SERVER_MEMORY}"M -jar server.jar
            
            rm custom.sh
            
            ;;
        "Mohist")
            echo -e "\033[0;37m==============================\033[00m"
            echo -e "\033[01;32mChoose Minecraft Version\033[00m"
            echo -e "\033[0;37m==============================\033[00m"
            echo -e -n "\033[1;34mVersion: \033[00m"
            read -r version
            
            echo -e "\033[0;37m==============================\033[00m"
            echo -e "\033[0;33mDownloading\033[00m \033[1;33m Mohist\033[00m\033[0;33m...\033[00m"
            echo -e "\033[0;37m==============================\033[00m"
            
            curl -s -o server.jar -sS "https://mohistmc.com/api/$version/latest/download"
            
            echo -e "\033[1;34mDownload completed!\033[00m"
            
            echo -e "\033[0;37m==============================\033[00m"
            echo -e "\033[1;32mStarting the System...\033[00m"
            echo -e "\033[0;37m==============================\033[00m"
            
            java -Xms128M -Xmx"${SERVER_MEMORY}"M -jar server.jar
            
            rm custom.sh
            ;;
        "Fabric")
            echo -e "\033[0;37m==============================\033[00m"
            echo -e "\033[01;32mChoose Minecraft Version\033[00m"
            echo -e "\033[0;37m==============================\033[00m"
            echo -e -n "\033[1;34mMinecraft Version: \033[00m"
            read -r mversion
            
            echo -e "\033[0;37m==============================\033[00m"
            
            echo -e "\033[01;32mChoose Fabric Version\033[00m"
            
            echo -e "\033[0;37m==============================\033[00m"
            
            echo -e -n "\033[1;34mFabric Version: \033[00m"
            read -r fversion
            
            echo -e "\033[0;37m==============================\033[00m"
            echo -e "\033[0;33mDownloading\033[00m \033[1;33m Fabric\033[00m\033[0;33m...\033[00m"
            echo -e "\033[0;37m==============================\033[00m"
            
            curl -s -o fabric-installer.jar -sS "https://maven.fabricmc.net/net/fabricmc/fabric-installer/$fversion/fabric-installer-$fversion.jar"
            java -jar fabric-installer.jar server -downloadMinecraft -mcversion "$mversion"
            mv server.jar vanilla.jar
            mv fabric-server-launch.jar server.jar
            
            echo -e "serverJar=vanilla.jar" > fabric-server-launcher.properties
            
            echo -e "\033[0;37m==============================\033[00m"
            
            echo -e "\033[1;34mDownload completed!\033[00m"
            
            echo -e "\033[0;37m==============================\033[00m"
            echo -e "\033[1;32mRestart Server...\033[00m"
            echo -e "\033[0;37m==============================\033[00m"

            rm fabric-installer.jar custom.sh
            ;;
        "Forge")
            echo -e "\033[0;37m==============================\033[00m"
            echo -e "\033[01;32mChoose Minecraft Version\033[00m"
            echo -e "\033[0;37m==============================\033[00m"
            echo -e -n "\033[1;34mMinecraft Version: \033[00m"
            read -r mversion
            
            echo -e "\033[0;37m==============================\033[00m"
            
            echo -e "\033[01;32mChoose Forge Version\033[00m"
            
            echo -e "\033[0;37m==============================\033[00m"
            
            echo -e -n "\033[1;34mForge Version: \033[00m"
            read -r fversion
            
            echo -e "\033[0;37m==============================\033[00m"
            echo -e "\033[0;33mDownloading\033[00m \033[1;33m Forge\033[00m\033[0;33m...\033[00m"
            echo -e "\033[0;37m==============================\033[00m"
            
            curl -s -o forge-installer.jar -sS "https://maven.minecraftforge.net/net/minecraftforge/forge/$mversion-$fversion/forge-$mversion-$fversion-installer.jar"
            java -jar forge-installer.jar --installServer
            rm forge-installer.jar forge-installer.jar.log
            if [ -e run.sh ]
            then
                rm run.bat
                mv run.sh custom.sh
                echo "Placeholder file, don't delete" > server.jar
            else
                rm custom.sh
            fi
            
            echo -e "\033[0;37m==============================\033[00m"
            
            echo -e "\033[1;34mDownload completed!\033[00m"
            
            echo -e "\033[0;37m==============================\033[00m"
            echo -e "\033[1;32mRestart Server...\033[00m"
            echo -e "\033[0;37m==============================\033[00m"
            
            ;;
        
        "DL")
            echo -e "\e[92m!──────────────────────!"
            echo -e "\e[92m!─╔╦╗╔═╦╗╔══╗──╔══╗╔╗──!"
            echo -e "\e[92m!─║║║║║║║║══╣──╚╗╗║║║──!"
            echo -e "\e[92m!─║║║║║║║╠══║╔╗╔╩╝║║╚╗─!"
            echo -e "\e[92m!─╚═╝╚╩═╝╚══╝╚╝╚══╝╚═╝─!"
            echo -e "\e[92m!──────────────────────!"
            echo ""
            echo -e "\e[33mEnter the filename (including the extension)"
            echo -e -n "\e[33mFile:"
            read -r file
            echo -e "\e[33mEnter the URL to download"
            echo -e -n "\e[33mURL: "
            read -r url
            echo -e "\e[33mEnter directory for File Redirection"
            echo -e -n "\e[33mDirectory: "
            read -r dir
            curl -# -O $url
            mv $file $dir
            
            java -Xms128M -Xmx"${SERVER_MEMORY}"M -jar server.jar
            ;;
        "Stop")
            stop
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

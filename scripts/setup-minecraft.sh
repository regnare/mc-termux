#!/bin/bash

MC_SCRIPT="start-minecraft.sh"
MC_URL="https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar"

# Install openjdk
apt-get install software-properties-common -y
add-apt-repository ppa:openjdk-r/ppa -y -u
apt-get install openjdk-8-jre -y 

# Download minecraft server
mkdir minecraft 
wget -O ./minecraft/minecraft_server.jar "$MC_URL"

(
cat <<'EOF'
#!/bin/bash
cd minecraft
java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui
EOF
) > "$MC_SCRIPT"
chmod +x "$MC_SCRIPT"

echo "eula=true" > ./minecraft/eula.txt

echo "Run ./$MC_SCRIPT to start the server."

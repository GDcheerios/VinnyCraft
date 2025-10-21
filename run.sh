set -e

serverURL="https://api.mohistmc.com/project/mohist/1.20.1/builds/312/download"
PPURL="https://github.com/GDcheerios/PointPlugin/releases/download/v0.0.1/PointPlugin-1.0-SNAPSHOT.jar"
MVIURL="https://cdn.modrinth.com/data/qvdtDX3s/versions/MeYBNg6N/multiverse-inventories-5.2.0.jar"
MVCURL="https://cdn.modrinth.com/data/3wmN97b8/versions/K4FBldrK/multiverse-core-5.3.3.jar"

serverOUT="server.jar"
PPOUT="plugins/PointPlugin.jar"
MVIOUT="plugins/multiverse-inventory.jar"
MVCOUT="plugins/multiverse-core.jar"

echo "=== VinnyCraft Setup ==="

if [ ! -d "plugins" ]; then
    echo "Creating plugins folder..."
    mkdir -p "plugins"
fi

download_if_missing() {
    local file="$1"
    local url="$2"
    local name="$3"

    if [ ! -f "$file" ]; then
        echo "Downloading $name..."
        curl --fail --location --output "$file" "$url"
    else
        echo "$name already exists, skipping."
    fi
}

download_if_missing "$serverOUT" "$serverURL" "server.jar"
download_if_missing "$PPOUT" "$PPURL" "PointPlugin.jar"
download_if_missing "$MVIOUT" "$MVIURL" "multiverse-inventory.jar"
download_if_missing "$MVCOUT" "$MVCURL" "multiverse-core.jar"

echo
echo "=== Starting server ==="
java -Xms8G -Xmx12G -jar "$serverOUT" nogui

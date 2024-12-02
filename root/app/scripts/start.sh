#/bin/bash

LATEST_VERSION=$(wget -qO- https://api.github.com/repos/buchen/portfolio/releases/latest | jq -r '.assets | map(select(.browser_download_url | test("-linux.gtk.x86_64.tar.gz$"))) | last | .browser_download_url')
echo "Latest version found: $LATEST_VERSION"

if [ -f "/app/current_version.txt" ]; then
    CURRENT_VERSION=$(cat /app/current_version.txt)
    echo "Current version found: $CURRENT_VERSION"
    if [ "$LATEST_VERSION" != "$CURRENT_VERSION" ]; then
        echo "New version detected"
        rm -rf /app/bin
    fi
fi

if [ ! -d "/app/bin" ]; then
    echo "Installing latest version..."

    mkdir -p /app/bin
    wget -q -nc --show-progress --progress=bar:force:noscroll "$LATEST_VERSION"
    tar -C /app/bin --strip-components=1 -xf "$(basename $LATEST_VERSION)" 2> /dev/null
    rm -f "$(basename $LATEST_VERSION)"
    echo $LATEST_VERSION > /app/current_version.txt
fi

echo "Starting Portfolio Performance..."
/app/bin/PortfolioPerformance

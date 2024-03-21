#!/bin/bash

# Homebrew 설치 확인
if ! command -v brew &> /dev/null
then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"  # 설치
else
    echo "Homebrew already installed."
fi

brew update
brew upgrade

# 나한테 필요한 도구 설치
brew install nvm yarn git

# nvm을 사용하여 Node.js 설치
mkdir -p ~/.nvm
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

nvm install --lts
nvm use --lts

echo "Setup complete!"

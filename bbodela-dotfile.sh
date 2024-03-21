#!/bin/bash

# Homebrew 설치 확인
if ! command -v brew &> /dev/null
then
    echo "🤖 Homebrew 설치 중..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"  # 설치
else
    echo "🤖 Homebrew가 이미 설치되어 있으니, 업데이트를 시도할게요!"
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

echo "🤖 Homebrew, NVM, Yarn, Git, Node (latest version of LTS) 설치 완료!"

# .gitconfig 파일 생성 및 기본 설정
cat << EOF > ~/.gitconfig
[user]
    name = bbodela
    email = adelabbok@gmail.com
[includeIf "gitdir:~/projects/github/"]
    path = ~/.gitconfig-github
[includeIf "gitdir:~/projects/bitbucket/"]
    path = ~/.gitconfig-bitbucket
[includeIf "gitdir:~/projects/azure/"]
    path = ~/.gitconfig-azure


[init]
    defaultBranch = main
EOF

# GitHub 내 계정
cat << EOF > ~/.gitconfig-github
[user]
    name = bbodela
    email = adelabbok@gmail.com
EOF

# Bitbucket 내 계정
cat << EOF > ~/.gitconfig-bitbucket
[user]
    name = adela
    email = adelabbok@gmail.com
EOF

# Azure 내 계정
# cat << EOF > ~/.gitconfig-azure
# [user]
#     name = AzureDevOpsUsername
#     email = azure.email@example.com
# EOF

echo "🤖 Git Configuration 완료!"


echo "🤖 BBODELA님, Dotfile 설정이 완료되었습니다."

#!/bin/sh
# Installing Homebrew for macOS/Linux
if ! xcode-select --print-path &>/dev/null; then
	xcode-select --install &>/dev/null
	sudo xcodebuild -license
	/usr/sbin/softwareupdate --install-rosetta
fi
set +e
command -v brew >/dev/null 2>&1
BREW_CHECK=$?
if [ $BREW_CHECK -eq 0 ]; then
	echo "Brew already installed"
else
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
sudo pip3 install --ignore-installed ansible
ansible-galaxy install -r requirements.yml

ansible-playbook -i "localhost," -c local local.yml --ask-become-pass
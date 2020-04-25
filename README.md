# Setup Scripts

For new machines.

Cloning this, you will do:
```
cd ~/.ssh
ssh-keygen -t rsa -C "XXX@XXX.XXX"
sudo apt-get install git -y
```

1. Goto [github](github.com), login
2. Go to `Account Settings > SSH Keys > Add another public key`
3. Paste the copied content into the "key field" and press "Add key"


```bash
cd $HOME/Downloads
git clone git@github.com:cramja/setup-scripts.git
cd setup-scripts
sudo ./setup-ubuntu.sh
```
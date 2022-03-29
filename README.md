# OpenFortiVPN Helper

An interactive OpenFortiVPN helper

## Installation Instructions

### 1. Have OpenFortiVPN installed

You can install it with snap, like this

```bash
sudo snap install openfortivpn
```

In case you don't have snap installed, follow your distro [instructions](https://snapcraft.io/install/openfortivpn)

### 2. Clone this repository

```bash
git clone https://github.com/augustohdias/forti-vpn-helper
```

### 3. Give execution permissions to `vpn.sh`

```bash
cd forti-vpn-helper
chmod +x vpn.sh
```

### 4. [Optional] Set VPN_USER and VPN_HOST environment variables

Add this to your shell file

```
export VPN_USER=<your user credential here>
export VPN_HOST=<host>:<port>
```

Source your file


###### In case you use .bashrc
```
source ~/.bashrc
```

###### In case you have love for yourself (.zshrc)

```
source ~/.zshrc
```

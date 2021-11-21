# localSetup

localSetup


## Example

Example template present in examples/vars.yml which can be used as follows

    localsetup -i "https://raw.githubusercontent.com/Rishang/localSetup/main/example/vars.yml"

This will install packages defined in the URL - [vars.yml](https://github.com/Rishang/localSetup/blob/main/example/vars.yml)

In order to see help page

    localsetup -h

    -i [URL] | Install packages form url template
    -u       | Update localsetup


### variables

distro: get distro name eg: `{{distro}} -> hirsute`
hostname: get hostname  eg: `{{hostname}} -> <YOUR-HOSTNAME>`

## Installation

### requirements

- python
- openssh
- openssh-askpass

    1. For debian
    `apt install openssh-server openssh-askpass` 

    2. For Fedora / Centos
    `yum install openssh openssh-server openssh-askpass`

- ansible

    Install ansible
    `pip install ansible`

- **Clone repo and link the bash scrip to local bin via below commands**

        git clone "https://github.com/Rishang/localSetup.git" ~/.localsetup

        ln -s ~/.localsetup/localsetup.sh ~/.local/bin/localsetup
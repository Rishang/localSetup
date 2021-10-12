#!/bin/bash

# localsetup path
cd ~/.localsetup

# main

vardir="vars"
function _add_cfg {

# ansible cfg
read -r -d '' cfg <<'EOF'
[defaults]
remote_user = {YOUR_USERNAME}
ask_sudo_pass = True
ask_pass      = True
inventory = ./inventory
host_key_checking = false


[privilege_escalation]
become=false
become_method=sudo
become_ask_pass=true
EOF

echo "${cfg}" > ansible.cfg
sed -i "s/{YOUR_USERNAME}/${USER}/" ansible.cfg
}

_add_cfg

[[ -e ${vardir} ]] || mkdir $vardir

function _print_help {
    echo "-i [URL] | Install packages form url template"
    echo "-u       | Update localsetup"
}

while getopts ":iuh" opt; do
    case "${opt}" in
        i)  
            i=${OPTARG}
            curl -sS "$i" > "${vardir}/setup.yml"
            ansible-playbook playbook.yml
        ;;
        u)
            git pull origin main
        ;;
        h)
            _print_help
        ;;
        *)
            echo "Invalid option: $OPTARG" 1>&2
            _print_help
        ;;
    esac
done

cd -

#!/bin/bash

# main

vardir="vars"
dir_path="$HOME/.localsetup"

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

if ! [[ -e "${dir_path}/ansible.cfg" ]];then
    echo "${cfg}" > ${dir_path}/ansible.cfg
    sed -i "s/{YOUR_USERNAME}/${USER}/" ${dir_path}/ansible.cfg
fi
}


function _print_help {
    echo "-i [URL]          | Install packages form url template"
    echo "-f [VARFILE_PATH] | Install packages form local template file path"
    echo "-u                | Update localsetup"
}

while getopts ":i:ufh" opt; do
    case "${opt}" in
        i)  
            # localsetup path
            cd $dir_path
            i=${OPTARG}
            
            [[ -e ${vardir} ]] || mkdir $vardir;_add_cfg
            curl -sS "$i" > "${vardir}/setup.yml"
            ansible-playbook playbook.yml --extra-vars "@vars/setup.yml"
            cd -
        ;;
        f)  
            pwd
            echo "using varfile: $2"
            [[ -e $2 ]] || exit 2
            ansible-playbook playbook.yml --extra-vars "@${2}"
        ;;
        u)
            cd ${dir_path}
            git pull origin main
            cd -
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

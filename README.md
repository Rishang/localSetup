# localSetup

localSetup

## requirements

- python
- ansible

`pip install ansible`

- **Clone repo and link the bash scrip to local bin via below commands**

        git clone "https://github.com/Rishang/localSetup.git" ~/.localsetup

        ln -s ~/.localsetup/localsetup.sh ~/.local/bin/localsetup

## Example

Example template present in examples/vars.yml which can be used as follows

    localsetup -i "https://raw.githubusercontent.com/Rishang/localSetup/main/example/vars.yml"

This will install packages defined in the URL - (`vars.yml`)

In order to see help page

    localsetup -h

    -i [URL] | install packages form url template
    -u | update localsetup
    /home/noobi/Desktop/projects/localSetup

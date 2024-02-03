# k8sh.sh -- useful kubectl aliases maintained by geoffw@nexsys.net
# version 1.0 
#
# set the prompt username@hostname:[yyyy-mm-dd hh:mm:ss]-$
export PS1="\u@\h:[\D{%Y-%m-%d %H:%M:%S}]-\\$\[$(tput sgr0)\]"
# add binary directory pff of $HOME for user installed binaries
export PATH=$PATH:~/binary
#kubectl helper aliases
alias k="kubectl"
alias kgpsvc="kubectl get pods,svc"
alias kaf='k apply -f'
alias kavf='k apply --validate -f'
alias kcc='k config current-context'
alias kd='k describe'
alias kdd='k delete'
alias kdes='k describe'
alias kds='k get daemonset'
alias kgc='k config get-contexts'
alias kgd='k get deploy'
alias kgn='k get nodes'
alias kgp='k get pods'
alias kgpsvc='kubectl get pods,svc'
alias kgpw='k get pods -o wide'
alias kgs='k get svc'
alias kgu='k config get-users'
alias kgv='k get vs'
alias ksc='k config set-context'
alias kuc='k config use-context'
alias kscn='k config set-context --current --namespace'
alias kcns='k config view --minify --output 'jsonpath={..namespace}'; echo'

 

# attempt to set kubectl completion
source <(kubectl completion bash)
complete -o default -F __start_kubectl k

 

#connect to a pod
kpodconnect() {
        kubectl exec --stdin --tty $1 -- /bin/bash
}
# print pods on a specific node
kgpbynode() {
        kubectl get pods --field-selector spec.nodeName=$1 -A -o wide
}

 

# dump a Kubernetes Object to a yaml file
kodf() {
    if [[ "$#" -ne 3 ]]; then
        echo "Usage: kondf <type> <object_name> <destination_file>"
    else
    kubectl get "$1" "$2"  -o yaml > "$3"
    fi
}
# add $HOME/.local/bin and $HOME/binary to path
export PATH="$HOME/.local/bin:$HOME/binary:$PATH"

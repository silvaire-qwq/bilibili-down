#!/bin/bash

case $(whoami) in
    "root")
        echo -e "\e[31m[X]\e[0m 请勿使用 Root 用户运行脚本。"
        exit 1
        ;;
esac

remove_bilidown (){
    if [[ ! -f ~/.local/bin/bilidown ]]; then
        echo -e "\e[31m[X]\e[0m 不存在文件。"
        exit 1
    fi
    sudo rm -rf ~/.local/bin/bilidown
    if [[ $? -ne 0 ]]; then
        echo -e "\e[31m[X]\e[0m 卸载失败。"
        exit 1
    else
        echo -e "\e[32m[$]\e[0m 卸载成功。"
    fi
}

install_bilidown (){
    [[ -d ~/.local/bin ]] || echo -e "\e[34m[*]\e[0m 正在创建 ~/.local/bin 。"
    sudo mkdir -p ~/.local/bin
    if [[ $? -ne 0 ]]; then
        echo -e "\e[31m[X]\e[0m 创建失败。"
        exit 1
    fi
    echo -e "\e[34m[*]\e[0m 正在下载 bilidown ，国内用户可能下载失败。"
    sudo curl -o ~/.local/bin/bilidown "https://raw.githubusercontent.com/silvaire-qwq/bilibili-down/refs/heads/master/bilidown" &>/dev/null
    if [[ $? -ne 0 ]]; then
        echo -e "\e[31m[X]\e[0m 下载失败。"
        exit 1
    fi
    echo -e "\e[34m[*]\e[0m 正在给 bilidown 授予可运行权限。"
    sudo chmod +x ~/.local/bin/bilidown
    if [[ $? -ne 0 ]]; then
        echo -e "\e[31m[X]\e[0m 授予失败。"
        exit 1
    fi
    echo -e "\e[32m[$]\e[0m 安装成功"
    if [[ $(echo $PATH | grep /home/$(whoami)/.local/bin -c) -eq 0 ]]; then
        echo -e "\e[33m[!]\e[0m \$PATH 中不存在 /home/$(whoami)/.local/bin。"
        sudo cp -r /etc/profile /tmp
        echo 'export PATH=$PATH:/home/'$(whoami)'/.local/bin' | sudo tee -a /etc/profile &>/dev/null
        if [[ $? -ne 0 ]]; then
            echo -e "\e[31m[X]\e[0m \$PATH 添加失败。"
            sudo mv -i /tmp/profile /etc
            exit 1
        else
            echo -e "\e[32m[$]\e[0m \$PATH 自动添加成功"
        fi
    fi
}

echo -e "\e[33m[?]\e[0m 安装 bilidown 吗? 默认为不安装。如果已经安装，可以按下 R 卸载。"
read -n1 -s confirm
case $confirm in 
    Y | y)
        install_bilidown
        ;;
    R | r)
        remove_bilidown
        ;;
    *)
        echo -e "\e[31m[X]\e[0m 已取消安装。"
        ;;
esac
#!/bin/zsh

format="deb"
platform="linux"

while getopts ":f:p:h" opt; do
    case $opt in
        f) format="$OPTARG" ;;
        p) platform="$OPTARG" ;;
        h)
            echo "Usage: ./script.sh [-f <format>] [-p <platform>] [-h]"
            echo "Options:"
            echo "  -f <format>   Specify the download format (default: deb)"
            echo "  -p <platform> Specify the platform (default: linux)"
            echo "  -h            Display this help message"
            exit 0
            ;;
        \?) echo "Invalid option: -$OPTARG" >&2; exit 1 ;;
        :) echo "Option -$OPTARG requires an argument." >&2; exit 1 ;;
    esac
done

download_url="https://discord.com/api/download/stable?platform=$platform&format=$format"
output_file="discord.deb"

cd ~/Downloads/
curl -L --output $output_file $download_url
sudo apt install ./$output_file
cd

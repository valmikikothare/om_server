root=$(dirname $(readlink -f $0))

for file in om_jupyter om_cancel om_rename_node om_ssh om_vscode; do
    chmod +x "$root/$file"
done

echo "PATH=\$PATH:$root" >> ~/.bashrc
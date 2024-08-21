#!/usr/bin/bash
#SBATCH -J jupyter
#SBATCH -t 08:00:00
#SBATCH --gres=gpu:a100:1
#SBATCH -N 1
#SBATCH -c 4
#SBATCH --constraint=rocky8
#SBATCH --mem 20G
#SBATCH -o jupyter.out

source ~/.bashrc
conda activate pytorch
unset XDG_RUNTIME_DIR

port=$(echo "$@" | grep -oP '(?<=--port=)\d+')

jupyter lab --ip=0.0.0.0 --port=${port} --no-browser --NotebookApp.allow_origin='*' --NotebookApp.port_retries=0

# If lose connection from server, run this command locally to kill the process
# lsof -ti:2141 | xargs kill -9
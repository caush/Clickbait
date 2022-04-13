#!/bin/bash

# Ce fichier de commande permet de monter l'environement de développement dans Paperspace.
# Il s'agit essentiellement d'un environement "Huggingface / Transformers".
# Python, Pytorch, Cuda etc, sont des prérequis.

# Start by creating a virtual environment in the project directory:
#  python -m venv .env
# Activate the virtual environment (must be a bash script):
#  source .env/bin/activate

# WARNING: You are using pip version 21.1.1; however, version 22.0.4 is available.
# You should consider upgrading via the command :
# /notebooks/.env/bin/python -m pip install --upgrade pip
python -m pip install --upgrade pip

# Ajouter l'option --quiet pour moins de messages : pip install --quiet pandas
pip install pandas
# On installe la version de transformers qui supporte torch (mais on n'installe pas torch ici)
pip install transformers[torch]
pip install datasets
pip install sentencepiece
pip install ipywidgets # semble très gros à installer # %pip install IProgress
pip install huggingface_hub

# La même chose avec conda
# Attention il faut redémarrer le shell après conda init
# conda init
# conda activate base
# conda install -c huggingface -c conda-forge transformers sentencepiece datasets
# conda install -c conda-forge ipywidgets


# Installe les machins pour interagir avec les modèles dans huggingface
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
apt-get install git-lfs
git lfs install

# huggingface-cli login
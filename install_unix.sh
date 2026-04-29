# i) Download and install Miniforge3 locally in batch mode
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh -b -p ./miniforge3

# Set paths and variables for the current session
export PATH="$(pwd)/miniforge3/bin:$PATH"
export CURRENT_SHELL=$(basename "$SHELL")
eval "$(mamba shell hook --shell $CURRENT_SHELL)"

# ii) Create the dependencies environment
mamba create -n workshop_dependencies -c conda-forge python=3.12 libxc blas-devel lapack mpich-mpicc uv gxx -y

# iii) Activate for immediate use
source activate workshop_dependencies

echo "Miniforge3 was installed, the 'workshop_dependencies' environment created and activated."

# 1. Run the safe default (CPU) to ensure the environment is built
uv sync --extra cpu

# 2. Register the kernel immediately
uv run python -m ipykernel install --user --name workshop_env --display-name "Python (Workshop)"

echo "----------------------------------------------------------"
echo "Setup complete with CPU support."
echo "IF YOU HAVE AN NVIDIA GPU: Run 'uv sync --extra cu126' now."
echo "----------------------------------------------------------"


export PATH="$(pwd)/miniforge3/bin:$PATH"
CURRENT_SHELL=$(basename "$SHELL")
eval "$(mamba shell hook --shell $CURRENT_SHELL)"

mamba activate workshop_dependencies

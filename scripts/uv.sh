# Install uv
# https://docs.astral.sh/uv/
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install tools
uv tool install ipython
uv tool install td-watson
# For formatting in neovim
uv tool install black
uv tool install isort
uv tool install pylint

# Create neovim environment
uv tool install --upgrade pynvim

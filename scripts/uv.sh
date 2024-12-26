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
cd ~/.local/share/nvim/
uv venv --python-preference system --system-site-packages
uv pip install pynvim pydbus sphinx

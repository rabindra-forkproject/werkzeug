#!/bin/bash
set -e

# Install uv if not already installed
if ! command -v uv &> /dev/null; then
  echo "Installing uv..."
  curl -Ls https://astral.sh/uv/install.sh | bash
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Create virtual environment with uv
echo "Creating virtual environment with uv..."
uv venv .venv

# Activate and install dependencies
source .venv/bin/activate

if [ -f requirements.txt ]; then
    uv pip install -r requirements.txt
elif [ -f pyproject.toml ]; then
    uv pip install .
fi

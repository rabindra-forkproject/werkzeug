#!/bin/bash
set -e

echo "Creating virtual environment using uv..."
uv venv .venv

echo "Activating environment and installing dependencies..."
source .venv/bin/activate

# If you use a requirements file (change the path if needed)
if [ -f requirements.txt ]; then
    uv pip install -r requirements.txt
elif [ -f pyproject.toml ]; then
    uv pip install .
fi

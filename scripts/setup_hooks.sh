#!/bin/bash

# Make hooks executable
chmod +x hooks/pre-commit

# Configure Git to use the hooks directory
git config core.hooksPath hooks
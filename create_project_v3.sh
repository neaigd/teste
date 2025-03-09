#!/bin/bash

# Version 3.0 - Adds license and GitHub Actions support
set -e

# Configuration
DEFAULT_LICENSE="MIT"
SUPPORTED_LICENSES=("MIT" "GPL-3.0" "Apache-2.0")
WORKFLOW_DIR=".github/workflows"

# Function to display help
show_help() {
  echo "Usage: $0 [options] project_name"
  echo
  echo "Options:"
  echo "  -l, --license TYPE   Set project license (MIT, GPL-3.0, Apache-2.0)"
  echo "  -h, --help           Show this help message"
  echo
  echo "Example:"
  echo "  $0 -l MIT my_project"
  exit 0
}

# Parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    -l|--license)
      LICENSE="$2"
      if [[ ! " ${SUPPORTED_LICENSES[@]} " =~ " ${LICENSE} " ]]; then
        echo "Error: Unsupported license type. Supported: ${SUPPORTED_LICENSES[@]}"
        exit 1
      fi
      shift 2
      ;;
    -h|--help)
      show_help
      ;;
    *)
      if [[ -z "$PROJECT_NAME" ]]; then
        PROJECT_NAME="$1"
        shift
      else
        echo "Error: Too many arguments"
        show_help
      fi
      ;;
  esac
done

# Validate project name
if [[ -z "$PROJECT_NAME" ]]; then
  echo "Error: Project name is required"
  show_help
fi

# Create project structure
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Initialize Git repository
git init

# Create basic structure
mkdir -p src tests docs/{usage,development,reference,examples} $WORKFLOW_DIR

# Copy workflow templates from parent directory if they exist
if [ -d "../workflow-templates" ]; then
  echo "Copying workflow templates..."
  cp -r ../workflow-templates/* $WORKFLOW_DIR/
fi

# Generate README
cat > README.md <<EOF
# $PROJECT_NAME

## Project Description

## Installation

## Usage

## License
EOF

# Generate selected license
case "${LICENSE:-$DEFAULT_LICENSE}" in
  MIT)
    cat > LICENSE <<EOF
MIT License

Copyright (c) $(date +%Y) $PROJECT_NAME

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
    ;;
  GPL-3.0)
    curl -s https://www.gnu.org/licenses/gpl-3.0.txt > LICENSE
    ;;
  Apache-2.0)
    curl -s https://www.apache.org/licenses/LICENSE-2.0.txt > LICENSE
    ;;
esac

# Create basic workflow template
mkdir -p $WORKFLOW_DIR
cat > $WORKFLOW_DIR/license-automation.yml <<EOF
name: License Automation

on:
  push:
    branches: [ main ]

jobs:
  validate-license:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Verify LICENSE file exists
        run: |
          if [ ! -f LICENSE ]; then
            echo "LICENSE file missing!"
            exit 1
          fi
EOF

# Initial commit
git add .
git commit -m "Initial commit: Project setup with $LICENSE license"

echo
echo "Project $PROJECT_NAME created successfully!"
echo "Next steps:"
echo "1. cd $PROJECT_NAME"
echo "2. Start developing!"

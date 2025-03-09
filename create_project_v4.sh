#!/bin/bash

# Version 4.0 - Remote repository creation and parameterized execution
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
  echo "  -l, --license TYPE  Set project license (${SUPPORTED_LICENSES[@]})"
  echo "  -o, --org NAME      GitHub organization (default: $DEFAULT_ORG)"
  echo "  -t, --template TYPE Project template (basic/node/python)"
  echo "  -d, --dry-run       Validate without changes"
  echo "  -h, --help          Show this help message"
  echo
  echo "Example:"
  echo "  $0 -l MIT my_project"
  exit 0
}

# Global variables
ORG="$DEFAULT_ORG"
DRY_RUN=0
TEMPLATE="basic"

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
    -o|--org)
      ORG="$2"
      shift 2
      ;;
    -t|--template)
      TEMPLATE="$2"
      shift 2
      ;;
    -d|--dry-run)
      DRY_RUN=1
      shift
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

# Validate GitHub access and repository availability
echo "Validating GitHub access..."
if ! gh auth status &>/dev/null; then
  echo "Error: Not logged into GitHub CLI. Please run 'gh auth login' first."
  exit 1
fi

if ! gh api "orgs/$ORG" &>/dev/null; then
  echo "Error: Organization '$ORG' not found or access denied"
  exit 1
fi

if gh repo view "$ORG/$PROJECT_NAME" &>/dev/null; then
  echo "Error: Repository '$ORG/$PROJECT_NAME' already exists on GitHub"
  exit 1
fi

# Validate template type
if [[ ! " basic node python " =~ " $TEMPLATE " ]]; then
  echo "Error: Unsupported template type '$TEMPLATE'. Supported types: basic, node, python"
  exit 1
fi

if [[ $DRY_RUN -eq 1 ]]; then
  echo "Dry run validation successful - all checks passed"
  exit 0
fi

# Create project structure
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Initialize Git repository
git init

# Create template-specific structure
case "$TEMPLATE" in
  basic)
    mkdir -p src/{components,services} tests docs/{usage,examples}
    ;;
    
  node)
    mkdir -p src/{lib,config} test
    cat > package.json <<EOF
{
  "name": "$PROJECT_NAME",
  "version": "1.0.0",
  "description": "",
  "main": "src/index.js",
  "scripts": {
    "start": "node src/index.js",
    "test": "jest",
    "lint": "eslint ."
  },
  "keywords": [],
  "author": "",
  "license": "$LICENSE"
}
EOF
    cat > .gitignore <<EOF
node_modules/
.env
dist/
EOF
    ;;
    
  python)
    mkdir -p src/${PROJECT_NAME//-/_} tests
    python3 -m venv .venv
    cat > setup.py <<EOF
from setuptools import setup, find_packages

setup(
    name="$PROJECT_NAME",
    version="1.0.0",
    packages=find_packages(),
    install_requires=[],
    entry_points={
        'console_scripts': [
            '$PROJECT_NAME=src.${PROJECT_NAME//-/_}.cli:main',
        ],
    },
)
EOF
    cat > requirements.txt <<EOF
# Project dependencies
EOF
    ;;
esac

# Create common docs structure
mkdir -p docs/{usage,development,reference,examples} $WORKFLOW_DIR

# Copy workflow templates from parent directory if they exist
if [ -d "../workflow-templates" ]; then
  echo "Copying workflow templates..."
  cp -r ../workflow-templates/* $WORKFLOW_DIR/
fi

# Generate README with template-specific content
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

# Create GitHub repository and push code
echo "Creating GitHub repository..."
gh repo create "$ORG/$PROJECT_NAME" --public --confirm
git remote add origin "https://github.com/$ORG/$PROJECT_NAME.git"
git push -u origin main

echo
echo "Project $PROJECT_NAME created successfully!"
echo "GitHub repository: https://github.com/$ORG/$PROJECT_NAME"
echo
echo "Next steps:"
echo "1. cd $PROJECT_NAME"

case "$TEMPLATE" in
  node)
    echo "2. npm install"
    echo "3. Start developing: npm start"
    ;;
  python)
    echo "2. Activate virtual environment: source .venv/bin/activate"
    echo "3. Install dependencies: pip install -e ."
    ;;
  *)
    echo "2. Start developing"
    ;;
esac

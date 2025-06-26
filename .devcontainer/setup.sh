#!/bin/bash

echo "🚀 Setting up Business Location AI Development Environment..."

# Create project structure
echo "📁 Creating project structure..."
mkdir -p backend/app/{api,ml,data}
mkdir -p frontend/src/{components,pages,services,utils}
mkdir -p data/{raw,processed,models}
mkdir -p notebooks
mkdir -p scripts
mkdir -p .devcontainer

# Create Python files
echo "🐍 Setting up Python backend..."
touch backend/app/__init__.py
touch backend/app/api/__init__.py
touch backend/app/ml/__init__.py
touch backend/app/data/__init__.py

# Create backend requirements.txt
cat > backend/requirements.txt << EOF
fastapi==0.104.1
uvicorn==0.24.0
sqlalchemy==2.0.23
python-dotenv==1.0.0
googlemaps==4.10.0
requests==2.31.0
pandas==2.1.3
numpy==1.25.2
scikit-learn==1.3.2
xgboost==2.0.1
joblib==1.3.2
pydantic==2.5.0
python-multipart==0.0.6
fastapi-cors==0.0.6
sqlite3
jupyter
matplotlib
seaborn
EOF

# Install Python dependencies
echo "📦 Installing Python dependencies..."
cd backend
python -m pip install --upgrade pip
pip install -r requirements.txt
cd ..

# Create .env.example files
cat > backend/.env.example << EOF
# Google APIs
GOOGLE_MAPS_API_KEY=your_google_maps_api_key_here
GOOGLE_PLACES_API_KEY=your_google_places_api_key_here

# Database
DATABASE_URL=sqlite:///./business_locations.db

# API Settings
API_HOST=0.0.0.0
API_PORT=8000
DEBUG=True

# ML Model Settings
MODEL_PATH=../data/models/location_model.joblib
EOF

cat > frontend/.env.example << EOF
REACT_APP_GOOGLE_MAPS_API_KEY=your_google_maps_api_key_here
REACT_APP_BACKEND_URL=http://localhost:8000
EOF

# Create .gitignore
cat > .gitignore << EOF
# Environment variables
.env
*.env

# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg

# Virtual environments
venv/
env/
ENV/

# IDEs
.vscode/settings.json
.idea/

# Databases
*.db
*.sqlite3

# Logs
*.log

# Node.js
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# React build
frontend/build/

# ML Models
*.joblib
*.pkl
*.pickle

# Data files
data/raw/*
!data/raw/.gitkeep
data/processed/*
!data/processed/.gitkeep

# Jupyter Notebooks
.ipynb_checkpoints/

# OS
.DS_Store
Thumbs.db
EOF

# Create keep files for empty directories
touch data/raw/.gitkeep
touch data/processed/.gitkeep
touch data/models/.gitkeep

echo "✅ Development environment setup complete!"
echo ""
echo "🎯 Next steps:"
echo "1. Get Google API keys from Google Cloud Console"
echo "2. Copy .env.example to .env and add your API keys"
echo "3. Run the initial data collector test"
echo ""
echo "🚀 Ready to start coding!"

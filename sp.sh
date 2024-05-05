
read -p "Enter project name: " projectname
declare projectfilename=${projectname// /_}

read -p "Make new folder (y/n):" create_new_folder

if [[ "$create_new_folder" == "y" ]]; then
mkdir $projectfilename
mv requirements.txt $projectfilename
cd $projectfilename

mkdir data
mkdir data/base_tables
fi

git init
echo "# Project: $projectname" > README.md
echo "## Author: $USER" >> README.md

python3 -m venv .env

. .env/bin/activate

echo ".gitignore" > .gitignore
echo ".env/" >> .gitignore
echo "sp.sh" >> .gitignore

pip install -r requirements.txt

deactivate

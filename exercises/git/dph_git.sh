#!/bin/bash

# DPH Script for local Git exercise 
# Script will run in current (~) directory and create a subfolder dphgit.
# Script requires git to be already installed on machine!!!

# create dphgit within current user directory and add 3 subfolders
cd ~ 
mkdir dphgit 
mkdir dphgit/bareRepo
mkdir dphgit/userA
mkdir dphgit/userB 


# Create git repos in each 
cd ~/dphgit/bareRepo
git init --bare 

cd ~/dphgit/userA
git init 
git config pull.rebase false # set merge as default strategy 

cd ~/dphgit/userB
git init 
git config pull.rebase false # set merge as default strategy 


# Configure A and B with the bare repo as the remote 
cd ~/dphgit/userA
git remote add origin ~/dphgit/bareRepo 

cd ~/dphgit/userB
git remote add origin ~/dphgit/bareRepo


# Create content on A, commit and push to remote 
cd ~/dphgit/userA

echo ".DS_Store" >> .gitignore 
echo "Desktop.ini" >> .gitignore
echo "Thumbs.db" >> .gitignore	

echo "This is a README text file for the exercise." >> README.md 
echo "It is pretty boring." >> README.md 

git add -A 
git commit -m "Adding README.md and .gitignore via userA"
git push origin master 


# Pull content onto B.
cd ~/dphgit/userB
git pull origin master 


# Make further changes on A and push to remote 
cd ~/dphgit/userA

echo "This is a revised README for the exercise." > README.md 
echo "This is a new line" >> README.md
echo "It is still boring." >> README.md 

git add -A 
git commit -m "Modifying README.md via userA"
git push origin master 


# Make conflicting edit to B and try to push 
cd ~/dphgit/userB

echo "This is user B's README for the exercise." > README.md 
echo "It is not boring now." >> README.md 

git add -A 
git commit -m "Modifying README.md via userB"
git push origin master 


# Pull from Remote, resolve conflicts, and push to remote  
git pull origin master 
cat README.md  ## show conflicts 

echo "This is the conflict resolved README file." > README.md    # 'fix' the conflict 
echo "It is a faked resolution of file conflicts." >> README.md 

git add -A 
git commit -m "Resolved conflict in README doc in userB" 
git push origin master
git log --graph 

# Got to A and pull from remote 
cd ~/dphgit/userA
git pull origin master 
git log --graph




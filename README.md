# Checkout All Branches

## 1. Clone the Repository


```bash
git clone https://github.com/ritvikraj-cse/Projects.git
```


## 2. Navigate to the Repository Directory


```bash
cd Projects
```


## 3. Fetch All Branches


```bash
git fetch --all
```


## 4. List All Remote Branches


```bash
git branch -r
```


## 5. Checkout a Specific Branch


```bash
git checkout <branch-name>
```


## 6. Create and Checkout a Local Branch Tracking a Remote Branch


```bash
git checkout -b <branch-name> origin/<branch-name>
```


# Automate Checkout of All Branches

## Clone the Repository


```bash
git clone https://github.com/ritvikraj-cse/Projects.git
```


## Navigate to the Repository Directory


```bash
cd Projects
```



Save the following script as checkout_branches.sh:

```bash
#!/bin/bash

# Fetch all branches from the remote
git fetch --all

# List all remote branches
branches=$(git branch -r | grep -v '\->')

# Loop through each branch and create a local branch
for branch in $branches; do
  # Extract the branch name (remove the 'origin/' prefix)
  local_branch=$(echo $branch | sed 's/origin\///')
  
  # Checkout the branch locally
  git checkout -b $local_branch $branch
done
```


Make the script executable with:


```bash
chmod +x checkout_branches.sh
```


Run the script with:


```bash
./checkout_branches.sh
```


This will create local branches for all remote branches and switch to each one.

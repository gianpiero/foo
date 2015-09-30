HOOKS IN GIT
============

To add a pre-commit hook in git:

```
mkdir ~/.git/hooks/
touch ~/.git/hooks/pre-commit
```

Write your rules in there. See the example in this directory. 

Tell git where your templates are:

```
git config --global init.templatedir '~/.git'
```

This will modify your global ~/.gitconfig

Now: 
* everytime you create a new repo `git init`, the hooks will be copied in that repo
* everytime you clone a repo `git clone ....`, the hooks will be copied in that repo

Note: if you update the hooks in your home (template) dir, you can just run `git init` again in the repo. 

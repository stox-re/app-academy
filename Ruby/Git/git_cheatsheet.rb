git status
git diff
git add -A
git status
git diff --staged
git commit -m "descriptive message about changes"
git log

# Create a branch and switch to it
git branch save-game
git checkout save-game

# Commit on this "feature branch" until your feature is done. Then switch back to master and merge the branch in.

git checkout master
git merge save-game

# Finally, delete the feature branch. It's been merged, so you no longer need it.
git branch -d save-game


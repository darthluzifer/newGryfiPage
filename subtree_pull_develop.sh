#!/usr/bin/env bash
branch="develop";
git checkout -b create_release

rm -r concrete5/packages/basic_table_package/
git add *
git commit -m "removed directory"
git subtree add --prefix=concrete5/packages/basic_table_package/ git@github.com:BacLuc/basic_table_package.git $branch

rm -r concrete5/packages/bacluc_gryfenberg_theme/
git add *
git commit -m "removed directory"
git subtree add --prefix=concrete5/packages/bacluc_gryfenberg_theme/ git@github.com:BacLuc/bacluc_gryfenberg_theme.git $branch

rm -r concrete5/packages/bacluc_person_package/
git add *
git commit -m "removed directory"
git subtree add --prefix=concrete5/packages/bacluc_person_package/ git@github.com:BacLuc/bacluc_person_package.git $branch

rm -r concrete5/packages/bacluc_event_package/
git add *
git commit -m "removed directory"
git subtree add --prefix=concrete5/packages/bacluc_event_package/ git@github.com:BacLuc/bacluc_event_package.git $branch

git checkout $branch
git merge create_release --squash
git branch -D create_release
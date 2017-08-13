#!/usr/bin/env bash
branch="develop";
git checkout -b create_release
git subtree pull --prefix=concrete5/packages/basic_table_package/ git@github.com:BacLuc/basic_table_package.git $branch
git subtree pull --prefix=concrete5/packages/bacluc_gryfenberg_theme/ git@github.com:BacLuc/bacluc_gryfenberg_theme.git $branch
git subtree pull --prefix=concrete5/packages/bacluc_person_package/ git@github.com:BacLuc/bacluc_person_package.git $branch
git subtree pull --prefix=concrete5/packages/bacluc_event_package/ git@github.com:BacLuc/bacluc_event_package.git $branch
git checkout $branch
git merge create_release
git commit -m "pulled latest commit from $branch of subtrees and merged into $branch"
git branch -d create_release
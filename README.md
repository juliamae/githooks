githooks
========

These are the git hooks I use. Drop them into your repo's `.git/hooks` directory if you feel like it,
or [make the hooks global](#making-hooks-global) for all your projects.

commit-msg
----------

This prepends every commit message with the current
[branch description](http://bahmutov.calepin.co/git-branches-with-descriptions-really.html), after
the commit message is set. I use a [GitHub emoji code](http://www.emoji-cheat-sheet.com/) to
describe each branch.

My master branch description for this repo is :anchor:, and so:

```
$ git add commit-msg prepare-commit-msg
$ git commit -m "Add commit-msg and prepare-commit-msg hooks."
[master ee64377] :anchor: Add commit-msg and prepare-commit-msg hooks.
 2 files changed, 31 insertions(+)
```

prepare-commit-msg
------------------

This hook modifies the default commit message that is presented in editor before the message is
saved. It currently modifies default merge commit message to make it snazzier.

```
$ git merge origin/branch-i-want
```
will produce the default message:
```
:part_alternation_mark:erge 'origin/branch-i-want' into this fine-ass branch right here
```

Making hooks global
-------------------

To [make hooks global](https://coderwall.com/p/jp7d5q) for all your projects:

```
$ git config --global init.templatedir '~/.git-templates'
$ git clone https://github.com/juliamae/githooks ~/.git-templates
```

Any newly initialized repo will have the hooks. To add them to an existing repo:

```
$ cd ~/code/repo_madness # Your existing repo.
$ git init
```

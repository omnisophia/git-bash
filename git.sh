#!/bin/bash
read -p "Commit description: " desc
git add . && \
git add -u && \
git commit -m "$desc" && \
git push origin "$branch" || echo "Git Update is complete. Please continue to push using 'git push' once you are ready."

##################################################################################################
##				Brought to you buy Omnisophia, Inc.				##
##			       https://github.com/omnisophia/git-bash				##
##################################################################################################

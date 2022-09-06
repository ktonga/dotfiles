function uber_update
  git fetch --all --prune
  git switch -c tonga/uber-update
  set -l updates (git branch --all | ag remotes/origin/update/ | string trim)
  git cherry-pick --ff $updates
end

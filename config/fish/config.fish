if not set -q MY_FISH_CONFIG

  set -xg MY_FISH_CONFIG 'done'

  # Nix
  if test -e ~/.nix-profile/etc/profile.d/nix.sh
    fenv source ~/.nix-profile/etc/profile.d/nix.sh
  end

end

set -xg TERM 'xterm-256color'

if not set -q MY_FISH_CONFIG

  set -xg MY_FISH_CONFIG 'done'

  # Nix
  if test -e ~/.nix-profile/etc/profile.d/nix.sh
    fenv source ~/.nix-profile/etc/profile.d/nix.sh
  end

end

set -xg TERM 'xterm-256color'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gaston.tonietti/google-cloud-sdk/path.fish.inc' ]; . '/Users/gaston.tonietti/google-cloud-sdk/path.fish.inc'; end

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/gaston/.ghcup/bin $PATH # ghcup-env
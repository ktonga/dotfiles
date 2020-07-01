set -xg BROWSER firefox
set -xg EDITOR nvim
set -xg FZF_DEFAULT_COMMAND ag -g \"\"
set -xg JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
set -xg TERM xterm-256color
set -xg TMPDIR /tmp

if test -e ~/.local/bin
  set -xg PATH ~/.local/bin $PATH
end

# Nix
if test -e ~/.nix-profile/etc/profile.d/nix.sh
  fenv source ~/.nix-profile/etc/profile.d/nix.sh
end

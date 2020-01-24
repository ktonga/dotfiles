function abbrs
  set | grep _fish_abbr_ | sed 's/_fish_abbr_//'
end

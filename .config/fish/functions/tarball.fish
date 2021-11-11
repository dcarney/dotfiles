# Ex. tarball ./foo  => foo.tar.gz
function tarball --description 'creates a tarball out of a directory'
  tar -pvczf "$argv[1].tar.gz" $argv
end

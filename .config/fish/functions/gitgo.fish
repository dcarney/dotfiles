function gitgo --description 'creates a branch and then goes to it'
  # switch to the branch named by argv[1]
  # if that fails, create it, then switch to it
  git switch $argv[1] 2>/dev/null || git switch -c $argv[1]
end

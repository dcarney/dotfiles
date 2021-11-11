function branches --description 'lists the N most recent git branches for a repo'
  if test (count $argv) -gt 0
    # using -avv gives additional info like latest SHA/commit message
    # this takes up more screen real estate though
    git branch -a --sort=-committerdate | grep -v remote | head -n $argv[1]
  else
    git branch -a --sort=-committerdate | grep -v remote | head -n 15
  end
end

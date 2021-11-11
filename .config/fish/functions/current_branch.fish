# This can be useful as a primitive for scripting, or for
# calling manually if the branch isn't part of the prompt.
function current_branch --description 'prints the name of the current git branch'
  set --local ref (git symbolic-ref HEAD 2> /dev/null)
  string replace "refs/heads/" "" $ref
end


# creates a random password
function randpassword
  shuf -n 10 /usr/share/dict/words | tr '\n' '-'
end


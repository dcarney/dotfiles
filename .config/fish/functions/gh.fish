function gh --description 'opens the github webpage for the current repo'
  # URL will be local to the function, since we didn't specify
  # an explicit scope
  set URL (git config --get remote.origin.url)

  if string match --quiet -r '^git' $URL
    set URL (echo $URL | sed 's/git@//' | sed 's/:/\//')
    set URL "https://$URL"
  else
    set URL (echo $URL | sed 's/\.git//')
  end

  open $URL
end

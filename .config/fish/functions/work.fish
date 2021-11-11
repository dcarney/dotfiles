# - Starts 2FA in the browser+terminal
# - Kicks off AWS MFA
# - Restarts gpg-agent cause there is a good chance it decided to stop working
# - Unlocks Yubikey
# - Runs update-ssh
function work
  open http://go/auth
  sc 2fa
  sc-authorize mfa apiori.com
  fix-gpg
  update-ssh
end

function fix-gpg
  gpgconf --kill gpg-agent
  gpgconf --launch gpg-agent
  gpgconf --reload scdaemon
  gpg --card-status

  echo hi | gpg --yes --encrypt -r $USER@stripe.io | gpg --decrypt
end


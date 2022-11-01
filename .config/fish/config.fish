fish_vi_key_bindings

function fish_mode_prompt
  # NOOP - Disable vim mode indicator
end

set GOPATH $HOME/go
set GOBIN $HOME/go/bin
set PATH $HOME/bin $PATH
set PATH /usr/local/opt/go@1.15/bin/ $PATH
set PATH $HOME/go/bin $PATH

# turns off the GOPACKAGESDRIVER functionality
# in gocode when using VS Code. This functionality
# attempts to inform VS Code/gopls about Bazel-managed packages.
set -x STRIPE_GOCODE_OPTOUT 1

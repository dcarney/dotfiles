fish_vi_key_bindings

function fish_mode_prompt
  # NOOP - Disable vim mode indicator
end

set PATH $HOME/bin $PATH
set PATH /usr/local/opt/go@1.15/bin/ $PATH

# turns off the GOPACKAGESDRIVER functionality
# in gocode when using VS Code. This functionality
# attempts to inform VS Code/gopls about Bazel-managed packages.
set STRIPE_GOCODE_OPTOUT 1

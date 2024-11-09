# Check if main exists and use instead of master
function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default,stable,master}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return 0
    fi
  done

  # If no main branch was found, fall back to master but return error
  echo master
  return 1
}

alias gcam='git commit -a -m'
alias gst='git status'
alias gcan='git commit --amend --no-edit'
alias gp='git push'
alias gpfl='git push --force-with-lease'
alias ga='git add .'
alias g='git'
alias gb='git branch'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gcm='git checkout $(git_main_branch)'
alias gf='git fetch'

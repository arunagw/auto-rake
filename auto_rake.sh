#!/bin/bash
export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}
_rake_tasks() {
  COMPREPLY=($(compgen -W "`rake -s -T 2>/dev/null | awk '{{print $2}}'`" -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}

compctl -o default -o nospace -F _rake_tasks rake

#!/bin/sh
#Shell library for OpenRC compatability
alias ebegin='echo "$@"...'
eend() {
 test 0 -eq $1 && printf '[ok]\n' || printf '[failed]\n'
 shift
 test -n "$@" && echo "$@"
}

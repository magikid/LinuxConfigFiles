#!/bin/sh
#
# Attach or create tmux session named the same as current directory.
# LICENSE
#
# The MIT License
#
# Copyright (c) 2009-2016 thoughtbot, inc.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

path_name="$(basename "$PWD" | tr . -)"
session_name=${1-$path_name}

not_in_tmux() {
  [ -z "$TMUX" ]
}

session_exists() {
  tmux list-sessions | sed -E 's/:.*$//' | grep -q "^$session_name$"
}

create_detached_session() {
  (TMUX='' tmux new-session -Ad -s "$session_name")
}

create_if_needed_and_attach() {
  if not_in_tmux; then
    tmux new-session -As "$session_name"
  else
    if ! session_exists; then
      create_detached_session
    fi
    tmux switch-client -t "$session_name"
  fi
}

create_if_needed_and_attach

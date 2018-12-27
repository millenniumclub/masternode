#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2018
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/mikeytown2/masternode/master/nocollateral/trittiumd.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='Trittium/trittium'
# Display Name.
DAEMON_NAME='Trittium Core'
# Coin Ticker.
TICKER='TRTT'
# Binary base name.
BIN_BASE='trittium'
# Directory.
DIRECTORY='.trittium2'
# Conf File.
CONF='trittium2.conf'
# Port.
DEFAULT_PORT=30001
# Explorer URL.
EXPLORER_URL='https://explorer.trittium.cc/'
# Rate limit explorer.
EXPLORER_SLEEP=1
# Amount of Collateral needed.
COLLATERAL=50000
# Cycle Daemon on first start.
DAEMON_CYCLE=1
# Multiple on single IP.
MULTI_IP_MODE=1

# Dropbox Addnodes
DROPBOX_ADDNODES='zba62ami6sbdeqx'
# If set to 1 then use addnodes from dropbox.
USE_DROPBOX_ADDNODES=1
# Dropbox Bootstrap
DROPBOX_BOOTSTRAP='99wggdm13fl7mf6'
# If set to 1 then use bootstrap from dropbox.
USE_DROPBOX_BOOTSTRAP=1
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='th10pene21fc8we'

ASCII_ART () {
echo -e "\e[0m"
clear 2> /dev/null
cat << "TRITTIUM"
 _____     _ _   _   _                    ____
|_   _| __(_) |_| |_(_)_   _ _ __ ___    / ___|___  _ __ ___
  | || '__| | __| __| | | | | '_ ` _ \  | |   / _ \| '__/ _ \
  | || |  | | |_| |_| | |_| | | | | | | | |__| (_) | | |  __/
  |_||_|  |_|\__|\__|_|\__,_|_| |_| |_|  \____\___/|_|  \___|

TRITTIUM
}

# Discord User Info
# @mcarper#0918
# 401161988744544258
cd ~/ || exit
COUNTER=0
rm -f ~/___mn.sh
while [[ ! -f ~/___mn.sh ]] || [[ $( grep -Fxc "# End of masternode setup script." ~/___mn.sh ) -eq 0 ]]
do
  rm -f ~/___mn.sh
  echo "Downloading Masternode Setup Script."
  wget -4qo- goo.gl/uQw9tz -O ~/___mn.sh
  COUNTER=1
  if [[ "${COUNTER}" -gt 3 ]]
  then
    echo
    echo "Download of masternode setup script failed."
    echo
    exit 1
  fi
done

(
  sleep 2
  rm ~/___mn.sh
) & disown

(
# shellcheck disable=SC1091
# shellcheck source=/root/___mn.sh
. ~/___mn.sh
DAEMON_SETUP_THREAD
)
# shellcheck source=/root/.bashrc
. ~/.bashrc
stty sane 2>/dev/null

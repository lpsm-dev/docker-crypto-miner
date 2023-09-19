#!/bin/bash -e

# This option will make the script exit when there is an error
set -o errexit

# This option ensures that your script exits as soon as it encounters any failed piped commands
set -o pipefail

# This option temporary disable history
set +o history

# This option will trace what gets executed. Useful for debugging
[[ "$TRACE" ]] && set -o xtrace

# ==============================================================================
# COLORS VARIABLES
# ==============================================================================

# High Intensity
GREEN="\\033[0;92m"  # Green
YELLOW="\\033[0;93m" # Yellow
PURPLE="\\033[0;95m" # Purple
CYAN="\\033[0;96m"   # Cyan
NC="\\033[0;97m"     # White

# ==============================================================================
# COMMON VARIABLES
# ==============================================================================

# shellcheck disable=SC2155
readonly PROGNAME=$(basename "$0")

# Font Name: ANSI Shadow
HEADER="



██╗  ██╗███╗   ███╗██████╗ ██╗ ██████╗     ███╗   ███╗██╗███╗   ██╗███████╗██████╗
╚██╗██╔╝████╗ ████║██╔══██╗██║██╔════╝     ████╗ ████║██║████╗  ██║██╔════╝██╔══██╗
 ╚███╔╝ ██╔████╔██║██████╔╝██║██║  ███╗    ██╔████╔██║██║██╔██╗ ██║█████╗  ██████╔╝
 ██╔██╗ ██║╚██╔╝██║██╔══██╗██║██║   ██║    ██║╚██╔╝██║██║██║╚██╗██║██╔══╝  ██╔══██╗
██╔╝ ██╗██║ ╚═╝ ██║██║  ██║██║╚██████╔╝    ██║ ╚═╝ ██║██║██║ ╚████║███████╗██║  ██║
╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝ ╚═════╝     ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝



"

# ==============================================================================
# MINING VARIABLES
# ==============================================================================

CPU_LIMIT_ENABLE="${CPU_LIMIT_ENABLE:-true}"
CPU_LIMIT_PERCENT="${CPU_LIMIT_PERCENT:-100}"
CPU_LIMIT=$(($(nproc) * $CPU_LIMIT_PERCENT))

MINING_AUTO_CONFIG="${MINING_AUTO_CONFIG:-true}"
MINING_POOL="${MINING_POOL:-rx.unmineable.com:3333}"
MINING_COIN="${MINING_COIN:-SHIB}"
REFERRAL_CODE="${REFERRAL_CODE:-7lkr-kmhq}"
WALLET_ADDRESS="${WALLET_ADDRESS:-0xE36B97Ec98dD179B89BC109c11Eb47D6B587f3F3}"
WORKER_NAME="${WORKER_NAME:-docker}"
XMRIG_CONFIG_FILE="/usr/src/mining/config/xmrig.json"

# ==============================================================================
# COMMON FUNCTIONS
# ==============================================================================

Status() {
  echo -e "${PURPLE}[INFO]${NC}: $1"
}

Abort() {
  echo >&2 '
  ************************
  ***  ❌ ABORTED ❌  ***
  ************************
  '
  echo "An error has occurred - $1. Aborting..." >&2 && exit 1
}

Welcome() {
  OS="$(uname)"
  [ "$OS" = "Linux" ] && DATE_CMD="date" || DATE_CMD="gdate"
  DATE_INFO=$($DATE_CMD +"%Y-%m-%d %T")
  DATE_INFO_SHORT=$($DATE_CMD +"%A %B")
  Status "
  ╔═══════════════════════════════════════════════════════════════════════
  ║
  ║             ✨ Welcome $USER! ✨
  ║
  ║ 🔖 Date    - It's now $DATE_INFO - $DATE_INFO_SHORT
  ║ 🔖 System  - $OS CI context
  ║
  ║             👾 CPU Information 👾
  ║
  ║ 🔖 CPU_LIMIT_ENABLE  - $CPU_LIMIT_ENABLE
  ║ 🔖 CPU_LIMIT_PERCENT - $CPU_LIMIT_PERCENT
  ║ 🔖 CPU_LIMIT         - $CPU_LIMIT
  ║
  ║             👾 Mining Information 👾
  ║
  ║ 🔖 MINING_POOL       - $MINING_POOL
  ║ 🔖 MINING_COIN       - $MINING_COIN
  ║ 🔖 REFERRAL_CODE     - $REFERRAL_CODE
  ║ 🔖 WALLET_ADDRESS    - $WALLET_ADDRESS
  ║ 🔖 WORKER_NAME       - $WORKER_NAME
  ║ 🔖 XMRIG_CONFIG_FILE - $XMRIG_CONFIG_FILE
  ║
  ╚═══════════════════════════════════════════════════════════════════════
  "
}

# ==============================================================================
# CALL FUNCTIONS
# ==============================================================================

echo "$HEADER" && Welcome

sed -i "s/MINING_POOL/$MINING_POOL/g" "$XMRIG_CONFIG_FILE"
sed -i "s/MINING_COIN/$MINING_COIN/g" "$XMRIG_CONFIG_FILE"
sed -i "s/WALLET_ADDRESS/$WALLET_ADDRESS/g" "$XMRIG_CONFIG_FILE"
sed -i "s/WORKER_NAME/$WORKER_NAME/g" "$XMRIG_CONFIG_FILE"
sed -i "s/REFERRAL_CODE/$REFERRAL_CODE/g" "$XMRIG_CONFIG_FILE"

if [[ "$MINING_AUTO_CONFIG" == "true" ]]; then
  Status "✨ Starting miner with config"
  xmrig -c "$XMRIG_CONFIG_FILE" $@ & sleep 3
else
  Status "✨ Starting miner with cli params"
  xmrig -o "$MINING_POOL" -a rx -k -u "$MINING_COIN:$WALLET_ADDRESS.$WORKER_NAME#$REFERRAL_CODE" -p x & sleep 3
fi

if [[ "$CPU_LIMIT_ENABLE" == "true" ]]; then
  Status "✨ Enable CPU limit"
  cpulimit -l $CPU_LIMIT -p $(pidof xmrig) -z
else
  Status "✨ Disable CPU limit"
fi

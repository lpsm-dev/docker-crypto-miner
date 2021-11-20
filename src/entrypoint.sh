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

COIN=""
REFERRAL=""
WALLET=""
WORKER=""

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

# ==============================================================================
# CALL FUNCTIONS
# ==============================================================================

echo "$HEADER"

Status "Coin: $COIN"
Status "Referral Code: $REFERRAL"
Status "Wallet: $WALLET"
Status "Worker: $WORKER"

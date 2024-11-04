# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

all: clean install build foundry-test

# Clean the repo
clean  :; forge clean

# Install the Modules
install :; forge install --no-commit

# Update Dependencies
update:; forge update

# Builds
build  :; forge build

# Tests
# --ffi # enable if you need the `ffi` cheat code on HEVM
foundry-test :; forge clean && forge test --optimize --optimizer-runs 200 -v

# Run solhint
# npm install -g solhint
solhint :; solhint -f table "{src,test,script}/**/*.sol"

# Lints
lint :; forge fmt
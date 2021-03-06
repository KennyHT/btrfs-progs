#!/bin/bash

# iterate over all fuzzed images and run 'btrfs-image'

source "$TEST_TOP/common"

setup_root_helper
check_prereq btrfs-image

# redefine the one provided by common
check_image() {
	local image

	image=$1
	truncate -s0 target
	run_mayfail $TOP/btrfs-image "$image" target
	truncate -s0 target
}

check_all_images $TEST_TOP/fuzz-tests/images

rm -- target

exit 0

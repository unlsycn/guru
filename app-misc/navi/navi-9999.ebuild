# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
	aho-corasick-0.7.15
	anyhow-1.0.40
	atty-0.2.14
	autocfg-1.0.1
	bitflags-1.2.1
	cfg-if-1.0.0
	clap-3.0.0-beta.2
	clap_derive-3.0.0-beta.2
	directories-next-2.0.0
	dirs-sys-next-0.1.2
	edit-0.1.3
	either-1.6.1
	getrandom-0.2.2
	hashbrown-0.9.1
	heck-0.3.2
	hermit-abi-0.1.18
	indexmap-1.6.2
	lazy_static-1.4.0
	libc-0.2.92
	memchr-2.3.4
	numtoa-0.1.0
	os_str_bytes-2.4.0
	ppv-lite86-0.2.10
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.26
	quote-1.0.9
	rand-0.8.3
	rand_chacha-0.3.0
	rand_core-0.6.2
	rand_hc-0.3.0
	redox_syscall-0.2.5
	redox_termios-0.1.2
	redox_users-0.4.0
	regex-1.4.5
	regex-syntax-0.6.23
	remove_dir_all-0.5.3
	same-file-1.0.6
	shellwords-1.1.0
	strip-ansi-escapes-0.1.0
	strsim-0.10.0
	syn-1.0.68
	tempfile-3.2.0
	termcolor-1.1.2
	terminal_size-0.1.16
	termion-1.5.6
	textwrap-0.12.1
	thiserror-1.0.24
	thiserror-impl-1.0.24
	unicode-segmentation-1.7.1
	unicode-width-0.1.8
	unicode-xid-0.2.1
	utf8parse-0.1.1
	vec_map-0.8.2
	version_check-0.9.3
	vte-0.3.3
	walkdir-2.3.2
	wasi-0.10.2+wasi-snapshot-preview1
	which-4.1.0
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="An interactive cheatsheet tool for the command-line"
HOMEPAGE="https://github.com/denisidoro/navi"
SRC_URI="$(cargo_crate_uris ${CRATES})"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/denisidoro/navi.git"
else
	SRC_URI+=" https://github.com/denisidoro/navi/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="Apache-2.0"
SLOT="0"
RESTRICT="mirror"

RDEPEND="app-shells/fzf"
DEPEND="${RDEPEND}"

src_unpack() {
	[[ ${PV} == 9999 ]] && git-r3_src_unpack
	cargo_src_unpack
}

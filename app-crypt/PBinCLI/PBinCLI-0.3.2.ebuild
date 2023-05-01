# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_10 )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="PrivateBin CLI"
HOMEPAGE="https://github.com/r4sas/PBinCLI"
SRC_URI="https://github.com/r4sas/PBinCLI/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pycryptodome[${PYTHON_USEDEP}]
	dev-python/sjcl[${PYTHON_USEDEP}]
	dev-python/base58[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

Received: from mail-by2nam01on0075.outbound.protection.outlook.com ([104.47.34.75]:62592
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993120AbcKVTn5p4Qxv (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 22 Nov 2016 20:43:57 +0100
Subject: [PATCH 0/5] Enable KASLR for OCTEON platforms.
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <088264c9-75b8-37ff-6514-0f536b1f8e55@cavium.com>
Date: Tue, 22 Nov 2016 13:43:39 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: ralf@linux-mips.org
Message-ID: <20161122194339.hCY3xC6ObhX1AAm-6OxsKsxHbhUVAFgTpz06HfVO0Pg@z>

This patchset enables support of KASLR for OCTEON platforms.

Steven J. Hill (5):
  MIPS: FW: Make fw_init_cmdline() to be __weak.
  MIPS: Fix vmlinux.64 target for CONFIG_RELOCATABLE
  MIPS: OCTEON: Add fw_init_cmdline() for Cavium platforms.
  MIPS: OCTEON: Add plat_get_fdt() function for Cavium platforms.
  MIPS: OCTEON: Enable KASLR

 arch/mips/Kconfig               |  3 ++-
 arch/mips/Makefile              |  5 +++++
 arch/mips/cavium-octeon/setup.c | 23 +++++++++++++++++++++++
 arch/mips/include/asm/fw/fw.h   |  2 +-
 4 files changed, 31 insertions(+), 2 deletions(-)

-- 
1.9.1

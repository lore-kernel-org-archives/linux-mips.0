Received: from mailapp01.imgtec.com ([195.59.15.196]:51190 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993906AbdISMMYNf09- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 19 Sep 2017 14:12:24 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: Ci20: Add support for rootfs on NFS to defconfig
Date: Tue, 19 Sep 2017 13:12:01 +0100
Message-ID: <20170919121201.14085-1-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
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
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Harvey Hunt <harveyhuntnexus@gmail.com>
Message-ID: <20170919121201.A4dZ2YOyk8_pdvyr9iENxGak0_zXB3_7gNHEc_7fcuc@z>

From: Harvey Hunt <harvey.hunt@imgtec.com>

Now that ethernet support is in the kernel, add the option to use a
rootfs over NFS to enable automated testing of upstream kernels on a
Ci20.

Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/configs/ci20_defconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 5ea3104a3aca..a1a1f797ba2e 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -38,6 +38,8 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
 # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
@@ -110,7 +112,8 @@ CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
 CONFIG_CONFIGFS_FS=y
 CONFIG_UBIFS_FS=y
-# CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_NFS_FS=y
+CONFIG_ROOT_NFS=y
 CONFIG_NLS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_CODEPAGE_737=y
-- 
2.14.1

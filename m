Received: from mailapp01.imgtec.com ([195.59.15.196]:39221 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992155AbdCaPVeph65g (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 31 Mar 2017 17:21:34 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] MIPS: generic: Enable Root FS on NFS in generic_defconfig
Date: Fri, 31 Mar 2017 16:21:24 +0100
Message-ID: <1490973684-14267-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170331152124.qLQjnkokUV0CE9v7cqRaIj7DVfhHn0jzFX9OoaaGJvc@z>

The generic_defconfig is used for platforms like SEAD3 which do not
usually have fixed storage available, therefore NFS is the preferred
location of the RFS.
When the upstream kernel defconfig is built & tested on platforms such
as SEAD3 this leads to essentially false failures when the RFS fails to
mount.

There is little harm in having this feature enabled by default, so
enable it in the defconfig. Kernel autoconfiguration & DHCP must also be
selected to allow RFS on NFS.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 arch/mips/configs/generic_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/configs/generic_defconfig b/arch/mips/configs/generic_defconfig
index c95d94c7838b..91aacf2ef26d 100644
--- a/arch/mips/configs/generic_defconfig
+++ b/arch/mips/configs/generic_defconfig
@@ -36,6 +36,8 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
 CONFIG_NETFILTER=y
 # CONFIG_WIRELESS is not set
 CONFIG_DEVTMPFS=y
@@ -80,6 +82,7 @@ CONFIG_NFS_V3_ACL=y
 CONFIG_NFS_V4=y
 CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
+CONFIG_ROOT_NFS=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_INFO_REDUCED=y
-- 
2.7.4

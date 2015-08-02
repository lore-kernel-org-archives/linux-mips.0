Received: from userp1040.oracle.com ([156.151.31.81]:24892 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010977AbbHBIot3Sqbo (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 2 Aug 2015 10:44:49 +0200
From: Yuval Shaia <yuval.shaia@oracle.com>
Subject: [PATCH 23/30] MIPS: Require O32 FP64 support for MIPS64 with O32 compat
Date: Sun,  2 Aug 2015 01:34:19 -0700
Message-ID: <1438504466-21888-24-git-send-email-yuval.shaia@oracle.com>
In-Reply-To: <1438504466-21888-1-git-send-email-yuval.shaia@oracle.com>
References: <1438504466-21888-1-git-send-email-yuval.shaia@oracle.com>
Return-Path: <yuval.shaia@oracle.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: yuval.shaia@oracle.com
Cc: Paul Burton <paul.burton@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, stable@vger.kernel.org, #, linux-mips@linux-mips.org, Matthew Fortune <matthew.fortune@imgtec.com>, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150802083419.l8j3aB469W0Bn7LyxGKdiK4CL0vlCYzoyiEy8MD0wKI@z>

From: Paul Burton <paul.burton@imgtec.com>

MIPS32r6 code requires FP64 (ie. FR=1) support. Building a kernel with
support for MIPS32r6 binaries but without support for O32 with FP64 is
therefore a problem which can lead to incorrectly executed userland.

CONFIG_MIPS_O32_FP64_SUPPORT is already selected when the kernel is
configured for MIPS32r6, but not when the kernel is configured for
MIPS64r6 with O32 compat support. Select CONFIG_MIPS_O32_FP64_SUPPORT in
such configurations to prevent building kernels which execute MIPS32r6
userland incorrectly.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Markos Chandras <markos.chandras@imgtec.com>
Cc: <stable@vger.kernel.org> # v4.0-
Cc: linux-mips@linux-mips.org
Cc: Matthew Fortune <matthew.fortune@imgtec.com>
Cc: stable@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Patchwork: https://patchwork.linux-mips.org/patch/10674/
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
---
 arch/mips/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index aab7e46..66dc359 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1427,6 +1427,7 @@ config CPU_MIPS64_R6
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_MSA
 	select GENERIC_CSUM
+	select MIPS_O32_FP64_SUPPORT if MIPS32_O32
 	help
 	  Choose this option to build a kernel for release 6 or later of the
 	  MIPS64 architecture.  New MIPS processors, starting with the Warrior
-- 
1.7.1

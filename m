Received: from mail.sevenbyte.org ([5.9.90.188]:39848 "EHLO mail.sevenbyte.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S27011094AbbG0M0g05BR0 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jul 2015 14:26:36 +0200
From: Stefan Tatschner <stefan@sevenbyte.org>
Subject: [PATCH 2/9] MIPS: Require O32 FP64 support for MIPS64 with O32 compat
Date: Mon, 27 Jul 2015 14:26:20 +0200
Message-ID: <1437999987-24879-2-git-send-email-stefan@sevenbyte.org>
In-Reply-To: <1437999987-24879-1-git-send-email-stefan@sevenbyte.org>
References: <1437999987-24879-1-git-send-email-stefan@sevenbyte.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------2.4.6"
Return-Path: <stefan@sevenbyte.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ludwig.kuerzinger@aisec.fraunhofer.de
Cc: Paul Burton <paul.burton@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, stable@vger.kernel.org, linux-mips@linux-mips.org, Matthew Fortune <matthew.fortune@imgtec.com>, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150727122620.ODf4Q68FK4978GRMEkYGNGIZz-QYw78emCMlR2XSaA0@z>

From: Paul Burton <paul.burton@imgtec.com>

This is a multi-part message in MIME format.
--------------2.4.6
Content-Type: text/plain; charset=UTF-8; format=fixed
Content-Transfer-Encoding: 8bit


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
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)


--------------2.4.6
Content-Type: text/x-patch; name="0002-MIPS-Require-O32-FP64-support-for-MIPS64-with-O32-co.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="0002-MIPS-Require-O32-FP64-support-for-MIPS64-with-O32-co.patch"

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

--------------2.4.6--

Received: from mailapp01.imgtec.com ([195.59.15.196]:39232 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993947AbdHNSTh6AiTp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 14 Aug 2017 20:19:37 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 3/8] MIPS: SEAD-3: Only include in 32 bit kernels by default
Date: Mon, 14 Aug 2017 11:18:14 -0700
Message-ID: <20170814181819.7376-4-paul.burton@imgtec.com>
In-Reply-To: <20170814181819.7376-1-paul.burton@imgtec.com>
References: <20170814181819.7376-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170814181814.pg-9eK0NS-Vbg9k_oPBtJv2FboIssol1VU-e149DShM@z>

The MIPS SEAD-3 development board has only ever been used with 32 bit
CPUs, so including support for it in 64 bit kernels is wasteful since
those kernels will never run on a SEAD-3.

Specify a requirement in the SEAD-3 board config fragment that ensures
the board support is only included in 32 bit kernels, by checking that
CONFIG_32BIT=y.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

Changes in v2: None

 arch/mips/configs/generic/board-sead-3.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/generic/board-sead-3.config b/arch/mips/configs/generic/board-sead-3.config
index 3b5e1ac579eb..df49a592dbb5 100644
--- a/arch/mips/configs/generic/board-sead-3.config
+++ b/arch/mips/configs/generic/board-sead-3.config
@@ -1,3 +1,5 @@
+# require CONFIG_32BIT=y
+
 CONFIG_LEGACY_BOARD_SEAD3=y
 
 CONFIG_AUXDISPLAY=y
-- 
2.14.0

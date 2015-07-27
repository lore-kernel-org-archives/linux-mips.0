Received: from mailapp01.imgtec.com ([195.59.15.196]:4376 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011222AbbG0T7LuEUOX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 27 Jul 2015 21:59:11 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 01/16] MIPS: remove outdated comments in sigcontext.h
Date: Mon, 27 Jul 2015 12:58:12 -0700
Message-ID: <1438027107-24420-2-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1438027107-24420-1-git-send-email-paul.burton@imgtec.com>
References: <1438027107-24420-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Guenter Roeck <linux@roeck-us.net>, Matthew Fortune <matthew.fortune@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org
Message-ID: <20150727195812.ihqCo6HmHqf0pmzVnEtMV6YMnLBYO4l_Td4j3iA4i7M@z>

The offsets to various fields within struct sigcontext are declared
using asm-offsets.c these days, so drop the outdated comment that talks
about keeping in sync with a no longer present file.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

Changes in v2: None

 arch/mips/include/uapi/asm/sigcontext.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/mips/include/uapi/asm/sigcontext.h b/arch/mips/include/uapi/asm/sigcontext.h
index 6c9906f..ae78902 100644
--- a/arch/mips/include/uapi/asm/sigcontext.h
+++ b/arch/mips/include/uapi/asm/sigcontext.h
@@ -14,10 +14,6 @@
 
 #if _MIPS_SIM == _MIPS_SIM_ABI32
 
-/*
- * Keep this struct definition in sync with the sigcontext fragment
- * in arch/mips/tools/offset.c
- */
 struct sigcontext {
 	unsigned int		sc_regmask;	/* Unused */
 	unsigned int		sc_status;	/* Unused */
@@ -45,9 +41,6 @@ struct sigcontext {
 
 #include <linux/posix_types.h>
 /*
- * Keep this struct definition in sync with the sigcontext fragment
- * in arch/mips/tools/offset.c
- *
  * Warning: this structure illdefined with sc_badvaddr being just an unsigned
  * int so it was changed to unsigned long in 2.6.0-test1.  This may break
  * binary compatibility - no prisoners.
-- 
2.4.6

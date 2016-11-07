Received: from mailapp01.imgtec.com ([195.59.15.196]:6765 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991965AbcKGLO5AZOdd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Nov 2016 12:14:57 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 01/10] MIPS: Use generic asm/export.h
Date: Mon, 7 Nov 2016 11:14:07 +0000
Message-ID: <20161107111417.11486-2-paul.burton@imgtec.com>
In-Reply-To: <20161107111417.11486-1-paul.burton@imgtec.com>
References: <20161107111417.11486-1-paul.burton@imgtec.com>
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
Message-ID: <20161107111407.JIF2tKseY-zH5jMH5gzWPsGLvsjAy24qgl3ItRKq8HU@z>

Include export.h in the list of generic headers used by the MIPS
architecture for use by later patches.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/include/asm/Kbuild | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/asm/Kbuild b/arch/mips/include/asm/Kbuild
index 9740066..bcfb360 100644
--- a/arch/mips/include/asm/Kbuild
+++ b/arch/mips/include/asm/Kbuild
@@ -5,6 +5,7 @@ generic-y += cputime.h
 generic-y += current.h
 generic-y += dma-contiguous.h
 generic-y += emergency-restart.h
+generic-y += export.h
 generic-y += irq_work.h
 generic-y += local64.h
 generic-y += mcs_spinlock.h
-- 
2.10.2

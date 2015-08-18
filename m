Received: from mailapp01.imgtec.com ([195.59.15.196]:30167 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012245AbbHROD0ZyqFj (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 18 Aug 2015 16:03:26 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 89B2E8F615796
        for <linux-mips@linux-mips.org>; Tue, 18 Aug 2015 15:03:18 +0100 (IST)
From: Alex Smith <alex.smith@imgtec.com>
Subject: [PATCH] MIPS: Fix alignment of quiet build output for vmlinuz link
Date: Tue, 18 Aug 2015 15:03:10 +0100
Message-ID: <1439906590-9475-1-git-send-email-alex.smith@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Alex.Smith@imgtec.com>
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
Cc: Alex Smith <alex.smith@imgtec.com>
Message-ID: <20150818140310.oecmU-E9cEJyF16-gMvqKQR4_wOT99GUuTg_asWS84M@z>

The "LD vmlinuz" line in the quiet build output is misaligned with the
rest of the output. Fix this.

Signed-off-by: Alex Smith <alex.smith@imgtec.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/boot/compressed/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index dc91bde10d62..d5bdee115f22 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -78,7 +78,7 @@ endif
 
 vmlinuzobjs-y += $(obj)/piggy.o
 
-quiet_cmd_zld = LD	$@
+quiet_cmd_zld = LD      $@
       cmd_zld = $(LD) $(LDFLAGS) -Ttext $(VMLINUZ_LOAD_ADDRESS) -T $< $(vmlinuzobjs-y) -o $@
 quiet_cmd_strip = STRIP	  $@
       cmd_strip = $(STRIP) -s $@
-- 
2.5.0

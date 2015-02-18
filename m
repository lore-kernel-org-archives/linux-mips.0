Received: from mail-wi0-f182.google.com ([209.85.212.182]:52230 "EHLO
        mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27012930AbbBRKCJREaiT (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 18 Feb 2015 11:02:09 +0100
From: Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH RESEND] MIPS: Alchemy: fix cpu clock calculation
Date: Wed, 18 Feb 2015 11:01:56 +0100
Message-ID: <1424253716-588144-1-git-send-email-manuel.lauss@gmail.com>
Return-Path: <manuel.lauss@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Linux-MIPS <linux-mips@linux-mips.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, John Crispin <blogic@openwrt.org>, Bruno Randolf <br1@einfach.org>, Manuel Lauss <manuel.lauss@gmail.com>, stable@vger.kernel.org[v3.17+]
Message-ID: <20150218100156.Nqyjehs1sfNWYmdeiuWpKw85Y_bvesArgkTsvakOrlE@z>

The current code uses bits 0-6 of the sys_cpupll register to calculate
core clock speed.  However this is only valid on Au1300, on all earlier
models the hardware only uses bits 0-5 to generate core clock.

This fixes clock calculation on the MTX1 (Au1500), where bit 6 of cpupll
is set as well, which ultimately lead the code to calculate a bogus cpu
core clock and also uart base clock down the line.

Reported-by: John Crispin <blogic@openwrt.org>
Tested-by: Bruno Randolf <br1@einfach.org>
Signed-off-by: Manuel Lauss <manuel.lauss@gmail.com>
Cc: stable@vger.kernel.org	[v3.17+]
---
John originally noticed that the reported UART baud base differed between 3.14
and 3.18 on the MTX1,  Bruno tested and confirmed that the fix is correct.

Resend with linux mips ml address.

 arch/mips/alchemy/common/clock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/alchemy/common/clock.c b/arch/mips/alchemy/common/clock.c
index d8737a8..546914c 100644
--- a/arch/mips/alchemy/common/clock.c
+++ b/arch/mips/alchemy/common/clock.c
@@ -127,6 +127,8 @@ static unsigned long alchemy_clk_cpu_recalc(struct clk_hw *hw,
 		t = 396000000;
 	else {
 		t = alchemy_rdsys(AU1000_SYS_CPUPLL) & 0x7f;
+		if (alchemy_get_cputype() < ALCHEMY_CPU_AU1300)
+			t &= 0x3f;
 		t *= parent_rate;
 	}
 
-- 
2.3.0

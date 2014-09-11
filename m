Received: from mailapp01.imgtec.com ([195.59.15.196]:16432 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008711AbaIKIhhcZ6Kz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 11 Sep 2014 10:37:37 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 06/10] MIPS: ensure Config5.UFE is clear on boot
Date: Thu, 11 Sep 2014 08:30:19 +0100
Message-ID: <1410420623-11691-7-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1410420623-11691-1-git-send-email-paul.burton@imgtec.com>
References: <1410420623-11691-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140911073019.n-wyX33tNmGE2ZbyaQR5ZUnd47sxLqOtjpcrBx1iFxI@z>

As is done for UFR, ensure that userland cannot directly manipulate the
mode by clearing the UFE bit during boot.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/kernel/cpu-probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index db929a0..4e2a6e0 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -400,7 +400,7 @@ static inline unsigned int decode_config5(struct cpuinfo_mips *c)
 	unsigned int config5;
 
 	config5 = read_c0_config5();
-	config5 &= ~MIPS_CONF5_UFR;
+	config5 &= ~(MIPS_CONF5_UFR | MIPS_CONF5_UFE);
 	write_c0_config5(config5);
 
 	if (config5 & MIPS_CONF5_EVA)
-- 
2.0.4

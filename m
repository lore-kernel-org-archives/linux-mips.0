Received: from mail1.windriver.com ([147.11.146.13]:48589 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6822276AbaEUFgRCq0R0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 May 2014 07:36:17 +0200
From: Yong Zhang <yong.zhang@windriver.com>
Subject: [PATCH V2] MIPS: change type of asid_cache to unsigned long
Date: Wed, 21 May 2014 13:36:03 +0800
Message-ID: <1400650563-1033-1-git-send-email-yong.zhang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <yong.zhang@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org, huawei.libin@huawei.com
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20140521053603.V9ANzK0mbpsM12QYwfmaoTSOe6yrI1u9FPiU4SdXQZ0@z>

asid_cache must be unsigned long otherwise on 64bit system
it will become 0 if the value in get_new_mmu_context()
reaches 0xffffffff and in the end the assumption of
ASID_FIRST_VERSION is not true anymore thus leads to
more dangerous things.

Reported-by: libin <huawei.libin@huawei.com>
Signed-off-by: Yong Zhang <yong.zhang@windriver.com>
---

V2<-V1: Add the reporter.

 arch/mips/include/asm/cpu-info.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/cpu-info.h
index f6299be..ebcc2ed 100644
--- a/arch/mips/include/asm/cpu-info.h
+++ b/arch/mips/include/asm/cpu-info.h
@@ -40,7 +40,7 @@ struct cache_desc {
 
 struct cpuinfo_mips {
 	unsigned int		udelay_val;
-	unsigned int		asid_cache;
+	unsigned long		asid_cache;
 
 	/*
 	 * Capability and feature descriptor structure for MIPS CPU
-- 
1.7.9.5

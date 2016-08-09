Received: from mailapp01.imgtec.com ([195.59.15.196]:62526 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992721AbcHIMlKCaUW4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 9 Aug 2016 14:41:10 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 20/20] MIPS: SEAD3: Remove custom read_persistent_clock
Date: Tue, 9 Aug 2016 13:35:45 +0100
Message-ID: <20160809123546.10190-21-paul.burton@imgtec.com>
In-Reply-To: <20160809123546.10190-1-paul.burton@imgtec.com>
References: <20160809123546.10190-1-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20160809123545.3iPzZiC_NmVNEhWSuXOeXYSfKpXf_r4ReX6_WzyYqd0@z>

The SEAD3 board defines a custom implementation of read_persistent_clock
which does exactly the same dummy operation as the generic weak version.
Remove the not really implemented custom version.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>

---

 arch/mips/mti-sead3/sead3-time.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/mips/mti-sead3/sead3-time.c b/arch/mips/mti-sead3/sead3-time.c
index 10b0bf3..71feb51 100644
--- a/arch/mips/mti-sead3/sead3-time.c
+++ b/arch/mips/mti-sead3/sead3-time.c
@@ -63,12 +63,6 @@ static unsigned int __init estimate_cpu_frequency(void)
 	return freq ;
 }
 
-void read_persistent_clock(struct timespec *ts)
-{
-	ts->tv_sec = 0;
-	ts->tv_nsec = 0;
-}
-
 int get_c0_perfcount_int(void)
 {
 	if (gic_present)
-- 
2.9.2

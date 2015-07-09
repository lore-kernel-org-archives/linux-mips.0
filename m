Received: from mailapp01.imgtec.com ([195.59.15.196]:12798 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009932AbbGIJljf3JOh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Jul 2015 11:41:39 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id D73A64C728DFF
        for <linux-mips@linux-mips.org>; Thu,  9 Jul 2015 10:41:31 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 07/19] MIPS: mm: c-r4k: extend way_string array
Date: Thu, 9 Jul 2015 10:40:41 +0100
Message-ID: <1436434853-30001-8-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1436434853-30001-1-git-send-email-markos.chandras@imgtec.com>
References: <1436434853-30001-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150709094041.FsVkv-asFFDNCeQDsfyJl-IBw8Pt-XMdfqZyxC2FTSU@z>

From: Paul Burton <paul.burton@imgtec.com>

The L2 cache in the I6400 core has 16 ways, so extend the way_string
array to take such caches into account.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/mm/c-r4k.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index c3e777fc5e8b..a9867c3222b1 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -937,7 +937,9 @@ static void b5k_instruction_hazard(void)
 }
 
 static char *way_string[] = { NULL, "direct mapped", "2-way",
-	"3-way", "4-way", "5-way", "6-way", "7-way", "8-way"
+	"3-way", "4-way", "5-way", "6-way", "7-way", "8-way",
+	"9-way", "10-way", "11-way", "12-way",
+	"13-way", "14-way", "15-way", "16-way",
 };
 
 static void probe_pcache(void)
-- 
2.4.5

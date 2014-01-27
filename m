Received: from multi.imgtec.com ([194.200.65.239]:4502 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6824283AbaA0PaiKZVBj (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 16:30:38 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 14/15] mips: panic if vector register partitioning is implemented
Date: Mon, 27 Jan 2014 15:23:13 +0000
Message-ID: <1390836194-26286-15-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1390836194-26286-1-git-send-email-paul.burton@imgtec.com>
References: <1390836194-26286-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140127152313.8Sf_SxhzyaScgxabXLA_A5jsUNIbb1N87pHURpQHcHM@z>

No current systems implementing MSA include support for vector register
partitioning which makes it somewhat difficult to implement support for
it in the kernel. Thus for the moment the kernel includes no such
support. However if the kernel were to be run on a system which
implemented register partitioning then it would not function correctly,
mishandling MSA disabled exceptions. Calling panic when run on a system
with vector register partitioning implemented ensures that we're not
caught out by this later but instead reminded to implement support once
such a system is available.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/kernel/cpu-probe.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 852e085..003ba3c 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1193,9 +1193,13 @@ void cpu_probe(void)
 	else
 		c->srsets = 1;
 
-	if (cpu_has_msa)
+	if (cpu_has_msa) {
 		c->msa_id = cpu_get_msa_id();
 
+		if (c->msa_id & MSA_IR_WRPF)
+			panic("Vector register partitioning unimplemented!");
+	}
+
 	cpu_probe_vmbits(c);
 
 #ifdef CONFIG_64BIT
-- 
1.8.5.3

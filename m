Received: from multi.imgtec.com ([194.200.65.239]:2036 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6825733AbaA1O2ykINk1 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 28 Jan 2014 15:28:54 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 14/15] mips: warn if vector register partitioning is implemented
Date: Tue, 28 Jan 2014 14:28:43 +0000
Message-ID: <1390919323-25295-1-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <20140128142019.GE43648@pburton-linux.le.imgtec.org>
References: <20140128142019.GE43648@pburton-linux.le.imgtec.org>
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
Message-ID: <20140128142843.CZMBt6h1_U1276xT9L4z9TFjflyzD6tgoKvUneEDxbQ@z>

No current systems implementing MSA include support for vector register
partitioning which makes it somewhat difficult to implement support for
it in the kernel. Thus for the moment the kernel includes no such
support. However if the kernel were to be run on a system which
implemented register partitioning then it would not function correctly,
mishandling MSA disabled exceptions. Print a warning if run on a system
with vector register partitioning implemented to indicate this problem
should it occur.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
Changes in v2:
  - Switch from panic to WARN so that console output can be seen.
---
 arch/mips/kernel/cpu-probe.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 852e085..8605eb6 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1193,8 +1193,11 @@ void cpu_probe(void)
 	else
 		c->srsets = 1;
 
-	if (cpu_has_msa)
+	if (cpu_has_msa) {
 		c->msa_id = cpu_get_msa_id();
+		WARN(c->msa_id & MSA_IR_WRPF,
+		     "Vector register partitioning unimplemented!");
+	}
 
 	cpu_probe_vmbits(c);
 
-- 
1.8.5.3

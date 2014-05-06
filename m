Received: from mail-by2lp0238.outbound.protection.outlook.com ([207.46.163.238]:46398
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6837949AbaEFPxLT8aN1 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 6 May 2014 17:53:11 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH 11/11] kvm tools: Modify term_putc to write more than one char
Date: Tue, 6 May 2014 17:51:31 +0200
Message-ID: <1399391491-5021-12-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1399391491-5021-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1399391491-5021-1-git-send-email-andreas.herrmann@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Pekka Enberg <penberg@kernel.org>
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20140506155131.qilPGt6st5LvPnRk0KOgEWs3xGLfpMTIJ0IBoCflliE@z>

From: David Daney <david.daney@cavium.com>

It is a performance enhancement. When running in a simulator, each
system call to write a character takes a lot of time.  Batching them
up decreases the overhead (in the root kernel) of each virtio console
write.

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 tools/kvm/term.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/kvm/term.c b/tools/kvm/term.c
index 3de410b..b153eed 100644
--- a/tools/kvm/term.c
+++ b/tools/kvm/term.c
@@ -52,11 +52,14 @@ int term_getc(struct kvm *kvm, int term)
 int term_putc(char *addr, int cnt, int term)
 {
 	int ret;
+	int num_remaining = cnt;
 
-	while (cnt--) {
-		ret = write(term_fds[term][TERM_FD_OUT], addr++, 1);
+	while (num_remaining) {
+		ret = write(term_fds[term][TERM_FD_OUT], addr, num_remaining);
 		if (ret < 0)
 			return 0;
+		num_remaining -= ret;
+		addr += ret;
 	}
 
 	return cnt;
-- 
1.7.9.5

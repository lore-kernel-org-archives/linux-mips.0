Received: from mail-bn1lp0139.outbound.protection.outlook.com ([207.46.163.139]:24231
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6854988AbaESQzuV24Nv (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 19 May 2014 18:55:50 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH v2 12/12] kvm tools: Return number of bytes written by term_putc
Date: Mon, 19 May 2014 18:53:31 +0200
Message-ID: <1400518411-9759-13-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1400518411-9759-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1400518411-9759-1-git-send-email-andreas.herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org, James Hogan <james.hogan@imgtec.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <20140519165331.LMTSim-t2UgqsZvmU7T1Emfqfhcz1SmgN4-JrsWLEu4@z>

No caller is currently using the return value but better return
number of bytes written instead of 0 in case of an error.

Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 tools/kvm/term.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/kvm/term.c b/tools/kvm/term.c
index b153eed..1b8131a 100644
--- a/tools/kvm/term.c
+++ b/tools/kvm/term.c
@@ -57,7 +57,7 @@ int term_putc(char *addr, int cnt, int term)
 	while (num_remaining) {
 		ret = write(term_fds[term][TERM_FD_OUT], addr, num_remaining);
 		if (ret < 0)
-			return 0;
+			return cnt - num_remaining;
 		num_remaining -= ret;
 		addr += ret;
 	}
-- 
1.7.9.5

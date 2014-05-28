Received: from mail-bn1lp0141.outbound.protection.outlook.com ([207.46.163.141]:30117
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6854796AbaE1UaWL7Gje (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 28 May 2014 22:30:22 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH v3 12/12] kvm tools: Return number of bytes written by term_putc
Date: Wed, 28 May 2014 22:28:06 +0200
Message-ID: <1401308886-17394-12-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1401307735-16195-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1401307735-16195-1-git-send-email-andreas.herrmann@caviumnetworks.com>
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
Message-ID: <20140528202806.955ZBjKNch7mEhCLers1LpEqEyqApvX5mGnCMYblnhA@z>

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

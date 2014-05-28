Received: from mail-bl2lp0203.outbound.protection.outlook.com ([207.46.163.203]:46566
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6854780AbaE1UWoTWyt4 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 28 May 2014 22:22:44 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH v3 03/12] kvm tools: Move definition of TERM_MAX_DEVS to header
Date: Wed, 28 May 2014 22:20:49 +0200
Message-ID: <1401308458-16771-3-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1401307735-16195-1-git-send-email-andreas.herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20140528202049._V5YHge6-2dzZ5oBKC4-H-Kebk5_JPouSqzgPwAG_BA@z>

In order to use it in other C files (in addition to term.c).

Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 tools/kvm/include/kvm/term.h |    2 ++
 tools/kvm/term.c             |    1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/kvm/include/kvm/term.h b/tools/kvm/include/kvm/term.h
index 5f63457..dc9882e 100644
--- a/tools/kvm/include/kvm/term.h
+++ b/tools/kvm/include/kvm/term.h
@@ -10,6 +10,8 @@
 #define CONSOLE_VIRTIO	2
 #define CONSOLE_HV	3
 
+#define TERM_MAX_DEVS	4
+
 int term_putc_iov(struct iovec *iov, int iovcnt, int term);
 int term_getc_iov(struct kvm *kvm, struct iovec *iov, int iovcnt, int term);
 int term_putc(char *addr, int cnt, int term);
diff --git a/tools/kvm/term.c b/tools/kvm/term.c
index 214f5e2..3de410b 100644
--- a/tools/kvm/term.c
+++ b/tools/kvm/term.c
@@ -16,7 +16,6 @@
 
 #define TERM_FD_IN      0
 #define TERM_FD_OUT     1
-#define TERM_MAX_DEVS	4
 
 static struct termios	orig_term;
 
-- 
1.7.9.5

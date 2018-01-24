Received: from mail-qt0-x241.google.com ([IPv6:2607:f8b0:400d:c0d::241]:34842
        "EHLO mail-qt0-x241.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992916AbeAXBrpLI9oZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 24 Jan 2018 02:47:45 +0100
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH RFC 3/6] MIPS: BMIPS: Avoid referencing CKSEG1
Date: Tue, 23 Jan 2018 17:47:03 -0800
Message-ID: <1516758426-8127-4-git-send-email-f.fainelli@gmail.com>
In-Reply-To: <1516758426-8127-1-git-send-email-f.fainelli@gmail.com>
References: <1516758426-8127-1-git-send-email-f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
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
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Kevin Cernekee <cernekee@gmail.com>, James Hogan <jhogan@kernel.org>, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, "Maciej W. Rozycki" <macro@mips.com>, Huacai Chen <chenhc@lemote.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcin Nowakowski <marcin.nowakowski@mips.com>, Andrew Morton <akpm@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>, Ingo Molnar <mingo@kernel.org>, David Howells <dhowells@redhat.com>, Kees Cook <keescook@chromium.org>, Thomas Meyer <thomas@m3y3r.de>, Bryan O'Donoghue <pure.logic@nexus-software.ie>, Robin Murphy <robin.murphy@arm.com>, Michal Hocko <mhocko@suse.com>, Lucas Stach <l.stach@pengutronix.de>, Vladimir Murzin <vladimir.murzin@arm.com>, Bart Van Assche <bart.vanassche@sandisk.com>, open list <linux-kernel@vger.kernel.org>
Message-ID: <20180124014703.b3JRob_5fmICUZBl3yjJ3g37WSXGQiAcXWCiJ6PjHII@z>

From: Florian Fainelli <florian.fainelli@broadcom.com>

bmips_smp_movevec() references the CKSEG1 constant, which is about to be
updated in order to support processors that might enable eXtended
KSEG0/1. In doing so, we will generate a reference to a function, which
is obviously not permissible within assembly. Fortunately,
bmips_smp_movevec() is only used on BMIPS4350 which does not support
eXtended KSEG0/1.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/kernel/bmips_vec.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/bmips_vec.S b/arch/mips/kernel/bmips_vec.S
index 921a5fa55da6..10ea69f3859f 100644
--- a/arch/mips/kernel/bmips_vec.S
+++ b/arch/mips/kernel/bmips_vec.S
@@ -39,7 +39,7 @@
 
 LEAF(bmips_smp_movevec)
 	la	k0, 1f
-	li	k1, CKSEG1
+	li	k1, 0xa0000000
 	or	k0, k1
 	jr	k0
 
@@ -58,7 +58,7 @@ LEAF(bmips_smp_movevec)
 	mfc0	k1, $22, 3
 	srl	k1, 16
 	andi	k1, 0x8000
-	or	k1, CKSEG1 | BMIPS_RELO_VECTOR_CONTROL_0
+	or	k1, 0xa0000000 | BMIPS_RELO_VECTOR_CONTROL_0
 	or	k0, k1
 	li	k1, 0xa0080000
 	sw	k1, 0(k0)
@@ -67,7 +67,7 @@ LEAF(bmips_smp_movevec)
 	wait
 
 	la	k0, bmips_reset_nmi_vec
-	li	k1, CKSEG1
+	li	k1, 0xa0000000
 	or	k0, k1
 	jr	k0
 END(bmips_smp_movevec)
-- 
2.7.4

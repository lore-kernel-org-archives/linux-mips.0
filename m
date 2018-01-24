Received: from mail-qt0-x244.google.com ([IPv6:2607:f8b0:400d:c0d::244]:33440
        "EHLO mail-qt0-x244.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992866AbeAXBrjgDcaZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 24 Jan 2018 02:47:39 +0100
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH RFC 1/6] MIPS: Allow board to override TLB initialization
Date: Tue, 23 Jan 2018 17:47:01 -0800
Message-ID: <1516758426-8127-2-git-send-email-f.fainelli@gmail.com>
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
Message-ID: <20180124014701.6U_PcjGJiv33vt3J2MhNkSeLrUi9-TzOrW8fZZ5q3Wo@z>

From: Florian Fainelli <florian.fainelli@broadcom.com>

Some boards may have to override how the TLB initialization is done,
e.g: to support eXtended Kseg0/1 features on Broadcom BMIPS boards.
Allow this to happen by providing a board_tlb_init() hook.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/include/asm/traps.h | 1 +
 arch/mips/kernel/traps.c      | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/traps.h b/arch/mips/include/asm/traps.h
index f41cf3ee82a7..66c9c855be6e 100644
--- a/arch/mips/include/asm/traps.h
+++ b/arch/mips/include/asm/traps.h
@@ -26,6 +26,7 @@ extern void (*board_ejtag_handler_setup)(void);
 extern void (*board_bind_eic_interrupt)(int irq, int regset);
 extern void (*board_ebase_setup)(void);
 extern void (*board_cache_error_setup)(void);
+extern void (*board_tlb_init)(void);
 
 extern int register_nmi_notifier(struct notifier_block *nb);
 
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 5d19ed07e99d..b03864eb8213 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -106,6 +106,7 @@ void (*board_ejtag_handler_setup)(void);
 void (*board_bind_eic_interrupt)(int irq, int regset);
 void (*board_ebase_setup)(void);
 void(*board_cache_error_setup)(void);
+void (*board_tlb_init)(void);
 
 static void show_raw_backtrace(unsigned long reg29)
 {
@@ -2230,7 +2231,10 @@ void per_cpu_trap_init(bool is_boot_cpu)
 	/* Boot CPU's cache setup in setup_arch(). */
 	if (!is_boot_cpu)
 		cpu_cache_init();
-	tlb_init();
+	if (board_tlb_init)
+		board_tlb_init();
+	else
+		tlb_init();
 	TLBMISS_HANDLER_SETUP();
 }
 
-- 
2.7.4

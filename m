Received: from mail-qt0-x243.google.com ([IPv6:2607:f8b0:400d:c0d::243]:34844
        "EHLO mail-qt0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992973AbeAXBrwfZe7Z (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 24 Jan 2018 02:47:52 +0100
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH RFC 5/6] MIPS: BMIPS: Handshake with CFE
Date: Tue, 23 Jan 2018 17:47:05 -0800
Message-ID: <1516758426-8127-6-git-send-email-f.fainelli@gmail.com>
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
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ralf Baechle <ralf@linux-mips.org>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, James Hogan <jhogan@kernel.org>, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, "Maciej W. Rozycki" <macro@mips.com>, Huacai Chen <chenhc@lemote.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcin Nowakowski <marcin.nowakowski@mips.com>, Andrew Morton <akpm@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>, Ingo Molnar <mingo@kernel.org>, David Howells <dhowells@redhat.com>, Kees Cook <keescook@chromium.org>, Thomas Meyer <thomas@m3y3r.de>, Bryan O'Donoghue <pure.logic@nexus-software.ie>, Robin Murphy <robin.murphy@arm.com>, Michal Hocko <mhocko@suse.com>, Lucas Stach <l.stach@pengutronix.de>, Vladimir Murzin <vladimir.murzin@arm.com>, Bart Van Assche <bart.vanassche@sandisk.com>, open list <linux-kernel@vger.kernel.org>
Message-ID: <20180124014705.WZq9iksbrOziyI4CAlCLBomyh_b_vO6ALIO6UxpQ2ZY@z>

From: Florian Fainelli <florian.fainelli@broadcom.com>

Handshake with CFE and retrieve the environment variable DRAM0_SIZE,
which will tell us, on Broadcom STB chips, the amount of populated RAM
that we have on the first memory controller (aka MEMC0). This is
necessary in order to know how and if we can make use of eXtended
KSEG0/1.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/mips/bmips/setup.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 3b6f687f177c..d1b7b8b82ae1 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -19,6 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/libfdt.h>
 #include <linux/smp.h>
+#include <linux/kernel.h>
 #include <asm/addrspace.h>
 #include <asm/bmips.h>
 #include <asm/bootinfo.h>
@@ -28,12 +29,18 @@
 #include <asm/smp-ops.h>
 #include <asm/time.h>
 #include <asm/traps.h>
+#include <asm/fw/cfe/cfe_api.h>
+#include <asm/fw/cfe/cfe_error.h>
 
 #define RELO_NORMAL_VEC		BIT(18)
 
 #define REG_BCM6328_OTP		((void __iomem *)CKSEG1ADDR(0x1000062c))
 #define BCM6328_TP1_DISABLED	BIT(9)
 
+unsigned long __initdata cfe_seal;
+unsigned long __initdata cfe_entry;
+unsigned long __initdata cfe_handle;
+
 static const unsigned long kbase = VMLINUX_LOAD_ADDRESS & 0xfff00000;
 
 struct bmips_quirk {
@@ -123,9 +130,45 @@ static const struct bmips_quirk bmips_quirk_list[] = {
 	{ },
 };
 
+static unsigned long dram0_size_mb;
+
+extern void bmips_tlb_init(void);
+
+static char __initdata cfe_buf[COMMAND_LINE_SIZE];
+
+static inline int __init parse_ulong(const char *buf, unsigned long *val)
+{
+	char *endp;
+	unsigned long tmp;
+
+	tmp = simple_strtoul(buf, &endp, 0);
+	if (*endp == 0) {
+		*val = tmp;
+		return 0;
+	}
+
+	return -1;
+}
+
+#define FETCH(name, fn, arg) do { \
+	if (cfe_getenv(name, cfe_buf, COMMAND_LINE_SIZE) == CFE_OK) { \
+		fn(cfe_buf, arg); \
+        } \
+        } while (0)
+
+static void __init __maybe_unused cfe_read_configuration(void)
+{
+	if (cfe_seal != CFE_EPTSEAL)
+		return;
+
+	FETCH("DRAM0_SIZE", parse_ulong, &dram0_size_mb);
+}
+
 void __init prom_init(void)
 {
+	cfe_init(cfe_handle, cfe_entry);
 	bmips_cpu_setup();
+	cfe_read_configuration();
 	register_bmips_smp_ops();
 }
 
-- 
2.7.4

Received: from mailapp01.imgtec.com ([195.59.15.196]:42838 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012174AbbA2LOjaxDFD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 Jan 2015 12:14:39 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 5/9] MIPS: Malta: Implement get_c0_fdc_int()
Date: Thu, 29 Jan 2015 11:14:10 +0000
Message-ID: <1422530054-7976-6-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1422530054-7976-1-git-send-email-james.hogan@imgtec.com>
References: <1422530054-7976-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20150129111410.KC_NEiTQQ2uhPqkyF7tsmGrWcTjMWNuhXs0x7gdd6oU@z>

Implement the weak get_c0_fdc_int() function for Malta. The Fast Debug
Channel (FDC) interrupt is obtained mainly depending on whether a GIC is
present. Vectored external interrupt mode isn't yet supported.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
EIC mode not supported because I don't have anything to try it on (and
it isn't clear which interrupt priority level would get used).

It may make sense to have a common default implementation of
get_c0_fdc_int(), but this isn't done for the other local IRQs yet so
I've kept it like this for consistency.
---
 arch/mips/mti-malta/malta-time.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/mips/mti-malta/malta-time.c b/arch/mips/mti-malta/malta-time.c
index ce02dbdedc62..7d4b86571564 100644
--- a/arch/mips/mti-malta/malta-time.c
+++ b/arch/mips/mti-malta/malta-time.c
@@ -115,6 +115,22 @@ void read_persistent_clock(struct timespec *ts)
 	ts->tv_nsec = 0;
 }
 
+int get_c0_fdc_int(void)
+{
+	int mips_cpu_fdc_irq;
+
+	if (cpu_has_veic)
+		mips_cpu_fdc_irq = -1;
+	else if (gic_present)
+		mips_cpu_fdc_irq = gic_get_c0_fdc_int();
+	else if (cp0_fdc_irq >= 0)
+		mips_cpu_fdc_irq = MIPS_CPU_IRQ_BASE + cp0_fdc_irq;
+	else
+		mips_cpu_fdc_irq = -1;
+
+	return mips_cpu_fdc_irq;
+}
+
 int get_c0_perfcount_int(void)
 {
 	if (cpu_has_veic) {
-- 
2.0.5

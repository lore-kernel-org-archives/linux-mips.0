Received: from mailapp01.imgtec.com ([195.59.15.196]:18814 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009953AbcBCDRvPg0D0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Feb 2016 04:17:51 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 06/15] MIPS: CM: Fix mips_cm_max_vp_width for UP kernels
Date: Wed, 3 Feb 2016 03:15:26 +0000
Message-ID: <1454469335-14778-7-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1454469335-14778-1-git-send-email-paul.burton@imgtec.com>
References: <1454469335-14778-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Matt Redfearn <matt.redfearn@imgtec.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20160203031526.v0Y_SeM76e5Hw73r8yI-dxzXmzuw7tMZTSdrp_qGy70@z>

Fix mips_cm_max_vp_width for UP kernels where it previously referenced
smp_num_siblings, which is not declared for UP kernels. This led to
build errors such as the following:

  drivers/built-in.o: In function `$L446':
  irq-mips-gic.c:(.text+0x1994): undefined reference to `smp_num_siblings'
  drivers/built-in.o:irq-mips-gic.c:(.text+0x199c): more undefined references to `smp_num_siblings' follow

On UP kernels simply return 1, leaving the reference to smp_num_siblings
in place only for SMP kernels.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/include/asm/mips-cm.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index 1395bbc..3fdb6c9 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -462,7 +462,10 @@ static inline unsigned int mips_cm_max_vp_width(void)
 	if (mips_cm_revision() >= CM_REV_CM3)
 		return read_gcr_sys_config2() & CM_GCR_SYS_CONFIG2_MAXVPW_MSK;
 
-	return smp_num_siblings;
+	if (config_enabled(CONFIG_SMP))
+		return smp_num_siblings;
+
+	return 1;
 }
 
 /**
-- 
2.7.0

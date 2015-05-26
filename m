Received: from mailapp01.imgtec.com ([195.59.15.196]:34715 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007270AbbEZSvjRFovD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 26 May 2015 20:51:39 +0200
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: [PATCH v2 7/7] mips: pistachio: Allow to enable the external timer based clocksource
Date: Tue, 26 May 2015 15:41:56 -0300
Message-ID: <1432665716-16202-1-git-send-email-ezequiel.garcia@imgtec.com>
In-Reply-To: <1432665548-16024-1-git-send-email-ezequiel.garcia@imgtec.com>
References: <1432665548-16024-1-git-send-email-ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Ezequiel.Garcia@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Andrew Bresticker <abrestic@chromium.org>, James Hartley <james.hartley@imgtec.com>, Govindraj.Raja@imgtec.com, Damien.Horsley@imgtec.com, James Hogan <james.hogan@imgtec.com>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Message-ID: <20150526184156.yeZMuCEQln74MPKr7YrdipNImJSWCRwOtuiLCkKtVMg@z>

This commit introduces a new config, so the user can choose to enable
the General Purpose Timer based clocksource. This option is required
to have CPUFreq support.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
---
 arch/mips/Kconfig           |  1 +
 arch/mips/pistachio/Kconfig | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 arch/mips/pistachio/Kconfig

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f501665..91f6ca0 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -934,6 +934,7 @@ source "arch/mips/jazz/Kconfig"
 source "arch/mips/jz4740/Kconfig"
 source "arch/mips/lantiq/Kconfig"
 source "arch/mips/lasat/Kconfig"
+source "arch/mips/pistachio/Kconfig"
 source "arch/mips/pmcs-msp71xx/Kconfig"
 source "arch/mips/ralink/Kconfig"
 source "arch/mips/sgi-ip27/Kconfig"
diff --git a/arch/mips/pistachio/Kconfig b/arch/mips/pistachio/Kconfig
new file mode 100644
index 0000000..97731ea
--- /dev/null
+++ b/arch/mips/pistachio/Kconfig
@@ -0,0 +1,13 @@
+config PISTACHIO_GPTIMER_CLKSRC
+	bool "Enable General Purpose Timer based clocksource"
+	depends on MACH_PISTACHIO
+	select CLKSRC_PISTACHIO
+	select MIPS_EXTERNAL_TIMER
+	help
+	  This option enables a clocksource driver based on a Pistachio
+	  SoC General Purpose external timer.
+
+	  If you want to enable the CPUFreq, you need to enable
+	  this option.
+
+	  If you don't want to enable CPUFreq, you can leave this disabled.
-- 
2.3.3

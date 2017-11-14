Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:48659 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992314AbdKNNbUr8Me0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Nov 2017 14:31:20 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH] MIPS: ath25: Avoid undefined early_serial_setup() without SERIAL_8250_CONSOLE
Date: Tue, 14 Nov 2017 13:29:17 +0000
Message-ID: <1510666157-27252-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@mips.com>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20171114132917.CTNizAVY6dEgK1O6LTDSdeX4vnE-lstZyYIXxZQ9zb8@z>

Currently MIPS allnoconfig with CONFIG_ATH25=y fails to link due to
missing support for early_serial_setup():

  LD      vmlinux
arch/mips/ath25/devices.o: In function ath25_serial_setup':
devices.c:(.init.text+0x68): undefined reference to 'early_serial_setup'

Rather than adding dependencies to the platform to force inclusion of
SERIAL_8250_CONSOLE together with it's dependencies like TTY, HAS_IOMEM,
etc, just make ath25_serial_setup() a no-op when the dependency is not
selected in the kernel config.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/ath25/devices.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/ath25/devices.c b/arch/mips/ath25/devices.c
index e1156347da53..301a9028273c 100644
--- a/arch/mips/ath25/devices.c
+++ b/arch/mips/ath25/devices.c
@@ -73,6 +73,7 @@ const char *get_system_type(void)
 
 void __init ath25_serial_setup(u32 mapbase, int irq, unsigned int uartclk)
 {
+#ifdef CONFIG_SERIAL_8250_CONSOLE
 	struct uart_port s;
 
 	memset(&s, 0, sizeof(s));
@@ -85,6 +86,7 @@ void __init ath25_serial_setup(u32 mapbase, int irq, unsigned int uartclk)
 	s.uartclk = uartclk;
 
 	early_serial_setup(&s);
+#endif /* CONFIG_SERIAL_8250_CONSOLE */
 }
 
 int __init ath25_add_wmac(int nr, u32 base, int irq)
-- 
2.7.4

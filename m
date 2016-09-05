Received: from mailapp01.imgtec.com ([195.59.15.196]:48282 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992241AbcIEQTAn0Yfu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 5 Sep 2016 18:19:00 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] MIPS: rb532: Fix undefined reference to setup_serial_port
Date: Mon, 5 Sep 2016 17:18:40 +0100
Message-ID: <1473092320-30019-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20160905161840.Uah7EBmGo1LIsaC3hT8JSZe8zhcv7bHWa8UJH1EStCg@z>

If the rb532 machine is compiled without CONFIG_SERIAL_8250, the
following linker error occurs

arch/mips/built-in.o: In function `setup_serial_port':
(.init.text+0x20c): undefined reference to `early_serial_setup'

Fix this by wrapping registration of the rb532 uart in an ifdef
CONFIG_SERIAL_8250.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>

---

 arch/mips/rb532/serial.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/rb532/serial.c b/arch/mips/rb532/serial.c
index 70482540b3db..f0ea2de38840 100644
--- a/arch/mips/rb532/serial.c
+++ b/arch/mips/rb532/serial.c
@@ -36,6 +36,8 @@
 
 extern unsigned int idt_cpu_freq;
 
+#ifdef CONFIG_SERIAL_8250
+
 static struct uart_port rb532_uart = {
 	.flags = UPF_BOOT_AUTOCONF,
 	.line = 0,
@@ -52,3 +54,6 @@ int __init setup_serial_port(void)
 	return early_serial_setup(&rb532_uart);
 }
 arch_initcall(setup_serial_port);
+
+#endif /* CONFIG_SERIAL_8250 */
+
-- 
2.7.4

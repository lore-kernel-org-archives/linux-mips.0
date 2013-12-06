Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:61673 "EHLO
        mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6838329Ab3LFC0dflxDc (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 6 Dec 2013 03:26:33 +0100
From: Florian Fainelli <florian@openwrt.org>
Subject: [PATCH 2/5] tty: serial: bcm63xx_uart: drop bcm_{readl,writel} macros
Date: Thu, 5 Dec 2013 18:26:05 -0800
Message-ID: <1386296768-20204-3-git-send-email-florian@openwrt.org>
In-Reply-To: <1386296768-20204-1-git-send-email-florian@openwrt.org>
References: <1386296768-20204-1-git-send-email-florian@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <florian@openwrt.org>
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
Cc: ralf@linux-mips.org, blogic@openwrt.org, jogo@openwrt.org, mbizon@freebox.fr, cernekee@gmail.com, gregkh@linuxfoundation.org, linux-serial@vger.kernel.org, Florian Fainelli <florian@openwrt.org>
Message-ID: <20131206022605.-BqOVt0qWk_S6calheaLFSIxAw3sluAlvUeqpAngNGE@z>

bcm_{readl,writel} macros expand to __raw_{readl,writel}, use these
directly such that we do not rely on the platform to provide these for
us. As a result, we no longer use bcm63xx_io.h, so remove that inclusion
too.

Signed-off-by: Florian Fainelli <florian@openwrt.org>
---
 drivers/tty/serial/bcm63xx_uart.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/bcm63xx_uart.c b/drivers/tty/serial/bcm63xx_uart.c
index 2e72752..6d773a3 100644
--- a/drivers/tty/serial/bcm63xx_uart.c
+++ b/drivers/tty/serial/bcm63xx_uart.c
@@ -31,7 +31,6 @@
 #include <linux/serial_core.h>
 
 #include <bcm63xx_regs.h>
-#include <bcm63xx_io.h>
 
 #define BCM63XX_NR_UARTS	2
 
@@ -80,13 +79,13 @@ static struct uart_port ports[BCM63XX_NR_UARTS];
 static inline unsigned int bcm_uart_readl(struct uart_port *port,
 					 unsigned int offset)
 {
-	return bcm_readl(port->membase + offset);
+	return __raw_readl(port->membase + offset);
 }
 
 static inline void bcm_uart_writel(struct uart_port *port,
 				  unsigned int value, unsigned int offset)
 {
-	bcm_writel(value, port->membase + offset);
+	__raw_writel(value, port->membase + offset);
 }
 
 /*
-- 
1.8.3.2

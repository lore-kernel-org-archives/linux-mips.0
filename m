Received: from mailapp01.imgtec.com ([195.59.15.196]:5884 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013269AbbEVP4PGJ7dB (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 May 2015 17:56:15 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 08/15] of_serial: support for UARTs on I/O ports
Date: Fri, 22 May 2015 16:51:07 +0100
Message-ID: <1432309875-9712-9-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
References: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Paul Burton <paul.burton@imgtec.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.cz>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Message-ID: <20150522155107.eiMLzPVTCBSMUBTZrmOnBWbtaHENLbjF006WhGTwenI@z>

If the address provided for the UART is of an I/O port rather than
a regular memory address, then set the port iotype appropriately and
write the address to iobase rather than mapbase.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 drivers/tty/serial/of_serial.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/of_serial.c b/drivers/tty/serial/of_serial.c
index 137381e..ccff9ba 100644
--- a/drivers/tty/serial/of_serial.c
+++ b/drivers/tty/serial/of_serial.c
@@ -110,7 +110,12 @@ static int of_platform_serial_setup(struct platform_device *ofdev,
 
 	port->irq = irq_of_parse_and_map(np, 0);
 	port->iotype = UPIO_MEM;
-	if (of_property_read_u32(np, "reg-io-width", &prop) == 0) {
+
+	if (resource.flags & IORESOURCE_IO) {
+		port->iotype = UPIO_PORT;
+		port->iobase = port->mapbase;
+		port->mapbase = 0;
+	} else if (of_property_read_u32(np, "reg-io-width", &prop) == 0) {
 		switch (prop) {
 		case 1:
 			port->iotype = UPIO_MEM;
-- 
2.4.1

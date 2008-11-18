Received: from mail.zeugmasystems.com ([192.139.122.66]:56806 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S23754228AbYKRWAQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 18 Nov 2008 22:00:16 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Interrupt routing issue on BCM1480.
Date: Tue, 18 Nov 2008 14:00:08 -0800
Message-ID: <DDFD17CC94A9BD49A82147DDF7D545C50144C3F0@exchange.ZeugmaSystems.local>
From: "Kaz Kylheku" <KKylheku@zeugmasystems.com>
Return-Path: <KKylheku@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20081118220008.9rATNE7PrQr1SuHoAiodFP9eapxJ8DIuxnRaMGqD2ag@z>

Hi guys,

Ralf's fixes in arch/mips/pci/pci-bcm1480.c break on our board. Multiple
devices somehow report the same pin number (or perhaps some invalid pin
number that is mapped to 1).  The mapping function then assigns IRQ 8 to
multiple devices.

The old ``return dev->irq'' in pcibios_map_irq worked fine.

What was the issue: is it that CFE sets up these IRQ numbers, such that
they might not correspond to pins?

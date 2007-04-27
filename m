Received: from gecko.sbs.de ([194.138.37.40]:15951 "EHLO gecko.sbs.de")
	by ftp.linux-mips.org with ESMTP id S20021616AbXD0Ilz convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 27 Apr 2007 09:41:55 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: pcmcia - failed to initialize IDE interface
Date: Fri, 27 Apr 2007 10:42:31 +0200
Message-ID: <D7810733513F4840B4EBAAFA64D9C6A401307AC9@stgw002a.ww002.siemens.net>
In-Reply-To: <D7810733513F4840B4EBAAFA64D9C6A401307A69@stgw002a.ww002.siemens.net>
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
Return-Path: <Fabrice.Aeschbacher@siemens.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Cc: linux-pcmcia@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>
Message-ID: <20070427084231.f_9Bve-nsqHITZJGsvJ4ufGamXKGC2xEmxTZt-pQ3qk@z>

> Which would be the correct way to make pcmcia_request_irq() 
> use the correct value of 40?

This is in drivers/pcmcia/au1000_db1x00.c:

db1x00_pcmcia_hw_init():

	skt->irq = AU1000_GPIO_8;  /* = 40 */

Now the CF is working fine.

Fabrice

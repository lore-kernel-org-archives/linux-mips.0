content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Non recoverabe Abort
Date: Mon, 22 Mar 2004 20:45:44 +0530
Message-ID: <E519BE9E8DAC6A4B89DA4AD1D2A155B783B561@soc-mail.soc-soft.com>
From: "Nitin P Mahajan" <Nitin@soc-soft.com>
Return-Path: <Nitin@soc-soft.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Cc: linux-net@vger.kernel.org
Message-ID: <20040322151544.xj1B0o8j4D1UsHGao4L60CWMchoaRc9C-RaxjQUBnCo@z>

Hi!

	I am writing a driver for the on-chip Ethernet controller
(Exactly Similar to TC35815) on TX4938.

I am facing one problem for a long time. I am getting the following two
interrupts but not the transmit interrupt when I attempt to transmit. 1.
Non-recoverable Abort. 2. Master Abort Reception.

I have just created one transmit descriptor and attached a small data
buffer to it. Through the MAC loop back I want to test this basic
transmission. I am not getting the TxComp interrupt. I am giving the
physical address of the descriptor to the DMA controller and assigning
the physical address of the data buffer into the DataBuff field in the
descriptor. Is it possible to get the transmit and receive interrupts in
the MAC loopback condition.

Could anyone please tell me what can be the reason of these interrupts
(1. Non-recoverable Abort, 2. Master Abort Reception) and how can I
overcome it.

Thanking u in advance,

Regards

-Nitin Mahajan

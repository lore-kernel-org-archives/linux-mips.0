Subject: Re: sgiserial.c
Date: Tue, 10 Oct 2000 10:41:08 +0100 (BST)
In-Reply-To: <20001010054506.F25504@bacchus.dhis.org> from "Ralf Baechle" at Oct 10, 2000 05:45:06 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E13ivuH-0003Un-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: Keith Owens <kaos@melbourne.sgi.com>, Linux on MIPS <linux-mips@oss.sgi.com>
Message-ID: <20001010094108.C0c3YtHfOkHSI2apKAmrAj0rDwtJd3IxlsmcIEZyhcc@z>

> The Origin's IOC3 16550 can go even higher rates at low interrupt load
> due to it's higher crystal frequency and a NIC-like DMA descriptors.
> We just don't do it yet in the Linux driver ...

165x0 chips on x86 running in normal FIFO modes we can do 900Kbits pretty
solidly. You should be able to hit the full 2Mbit without trying

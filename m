Received: from mxout1.idt.com ([157.165.5.25]:35054 "EHLO mxout1.idt.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1491992Ab0KRUE5 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Nov 2010 21:04:57 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: The new "real" console doesn't display printk() messages like "early" console!
Date: Thu, 18 Nov 2010 12:04:26 -0800
Message-ID: <AEA634773855ED4CAD999FBB1A66D0760136A151@CORPEXCH1.na.ads.idt.com>
In-Reply-To: <4CE57C92.6030705@mvista.com>
References: <AEA634773855ED4CAD999FBB1A66D0760136A102@CORPEXCH1.na.ads.idt.com> <4CE57C92.6030705@mvista.com>
From: "Ardelean, Andrei" <Andrei.Ardelean@idt.com>
Return-Path: <Andrei.Ardelean@idt.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Sergei Shtylyov <sshtylyov@mvista.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20101118200426.DcepmHtm6lc_-MgLFikUwEOc-3_buXaOn74bvXT5CgM@z>

Hi Sergei,

I specified that when the bootloader calls the kernel and I did see that
the baudrate is correct and I have some messages but when the system is
crashing I cannot see printk messages. For instance, I step with JTAG
and I can see that printk(KERNEL_WARNING "unable to open initial
console") is called but on the terminal I cannot see the message. The
same, die() is called but there is no messages on UART terminal.

Thanks,
Andrei
 

-----Original Message-----
From: Sergei Shtylyov [mailto:sshtylyov@mvista.com] 
Sent: Thursday, November 18, 2010 2:21 PM
To: Ardelean, Andrei
Cc: linux-mips@linux-mips.org
Subject: Re: The new "real" console doesn't display printk() messages
like "early" console!

Hello.

Ardelean, Andrei wrote:

> I am porting MIPS Linux on a new platform and my kernel crashes after
> console is switched from early console to the new real console
(8250.c)
> I see messages displayed using the new console like "Freeing prom
> memory: 956k freed" (this is the last message I have) so the new
console
> is up and running. 
> My problem is that the new console doesn't display printk() messages.
> The early console displays all printk() messages.

> What do I need to set at compiling time that the new console to
display
> printk() messages like early console?

    Have you specified "console=ttyS<n>,<baudrate> as the kernel
parameter?

> Thanks,
> Andrei

WBR, Sergei

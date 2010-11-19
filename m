Received: from mxout1.idt.com ([157.165.5.25]:56155 "EHLO mxout1.idt.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1491872Ab0KSOE2 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 19 Nov 2010 15:04:28 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: The new "real" console doesn't display printk() messages like "early" console!
Date: Fri, 19 Nov 2010 06:04:07 -0800
Message-ID: <AEA634773855ED4CAD999FBB1A66D0760136A2F5@CORPEXCH1.na.ads.idt.com>
In-Reply-To: <AANLkTimqF-Zy6eQurPRq5m71waB=n4zyRfRbpxyCsWgn@mail.gmail.com>
References: <AEA634773855ED4CAD999FBB1A66D0760136A102@CORPEXCH1.na.ads.idt.com><4CE57C92.6030705@mvista.com><AEA634773855ED4CAD999FBB1A66D0760136A151@CORPEXCH1.na.ads.idt.com><AANLkTinEXDoXQFa1gN6prRQYjqkvc9vSA_H7JOXPLsPw@mail.gmail.com><AEA634773855ED4CAD999FBB1A66D0760136A1F3@CORPEXCH1.na.ads.idt.com> <AANLkTimqF-Zy6eQurPRq5m71waB=n4zyRfRbpxyCsWgn@mail.gmail.com>
From: "Ardelean, Andrei" <Andrei.Ardelean@idt.com>
Return-Path: <Andrei.Ardelean@idt.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ricardo Mendoza <ricmm@gentoo.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20101119140407.Nxmh34aOm9jYHLhM9GF-2_J3d18dUSjztXj9DjF4RcI@z>

Hi Ricardo,

I used Octeon just as a model, I added my own PORT_GD and my own
serial_in/out driver functions which work well, I have some messages on
the screen. My problem is that I can see messages like "Freeing unused
kernel memory..." but I cannot see printk() error/warning/debug
messages, like the messages printed by die().

Thanks,
Andrei



-----Original Message-----
From: mendoza.ricardo@gmail.com [mailto:mendoza.ricardo@gmail.com] On
Behalf Of Ricardo Mendoza
Sent: Thursday, November 18, 2010 6:58 PM
To: Ardelean, Andrei
Cc: linux-mips@linux-mips.org
Subject: Re: The new "real" console doesn't display printk() messages
like "early" console!

On Thu, Nov 18, 2010 at 10:01 PM, Ardelean, Andrei
<Andrei.Ardelean@idt.com> wrote:

> Hi Ricardo,
>
> I implemented serial platform driver taking as model serial.c from
> cavium-octeon.
>
> Here is my code:
>
> ...

Why use the Octeon code which has platform specific bits that might
have nothing to do with your platform? Build up from the simple ones.


     Ricardo

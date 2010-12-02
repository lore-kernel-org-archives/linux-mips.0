Received: from p02c12o147.mxlogic.net ([208.65.145.80]:49218 "EHLO
        p02c12o147.mxlogic.net" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1493242Ab0LBQPP convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 2 Dec 2010 17:15:15 +0100
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Issues attempting to boot vmlinuz
Date: Thu, 2 Dec 2010 10:15:39 -0600
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1E4E035F@EXV1.corp.adtran.com>
From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Return-Path: <andy.kennedy@adtran.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20101202161539.6Op7V7XoqRjGiz00vvFNX7n1usY46Q95ZYtXlTGXYRw@z>

I create a vmlinux kernel and boot it just fine.  The boot loader loads
the kernel to 0x80404210 and I can execute from there.  I next attempted
to adjust the Kconfig files to allow me to build a vmlinuz.  The boot
loader puts the kernel image at 0x8075e8b0 which is the computed
location of where the zipped kernel should go (I think).  What happens
next is an exception is returned to the boot loader and I end up back at
the boot loader prompt:

* Exception 0x0a (user) : Reserved instruction *

* in address: 8075e8b0

__initcall_pm_qos_power_init7+0x48054:

[8075e8b0] 9cda39f9 lwu         r26,0x39f9(r6)


So, I'm attempting now to hack around this issue, though I don't really
know where to begin (I've been working with mips for about 4 wks now).
I did find that the boot loader is configuring itself as the exception
handler and it catches 0x0a (Reserved instruction exception - according
to the mips documentation).  But what does this mean?

Any help you provide would be greatly appreciated.

Thanks,
Andy

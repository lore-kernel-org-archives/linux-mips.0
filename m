Received: from mx.mips.com ([63.167.95.198]:13554 "EHLO dns0.mips.com")
	by ftp.linux-mips.org with ESMTP id S28579729AbXAULOb (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Sun, 21 Jan 2007 11:14:31 +0000
Message-ID: <005101c73d4e$6bbf96d0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20070120234237.49126.qmail@web7912.mail.in.yahoo.com> <20070121001457.GA9123@linux-mips.org> <8355959a0701210159k2fcb2323s2d38f91a41fcb942@mail.gmail.com>
Subject: Re: Running Linux on FPGA
Date: Sun, 21 Jan 2007 12:22:20 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Sunil Naidu <akula2.shark@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-kernel@vger.kernel.org, sathesh babu <sathesh_edara2003@yahoo.co.in>, linux-mips@linux-mips.org
Message-ID: <20070121112220.5Ak7XZkGAVVFYFsz8gKng509UyF0g4wwz1X9LDYeJ7c@z>

> > The overhead of timer interrupts at this low clockrate is significant
> > so I recommend to minimize the timer interrupt rate as far as possible.
> > This is really a tradeoff between latency and overhead and matters
> > much less on hardcores which run at hundreds of MHz.  For power sensitive
> > applications lowering the interrupt rate can also help.  And that's alredy
> > pretty much what you need to know, that is a 10ms  timer is fine.
> >
> 
> I have worked with FPGA Linux system which is reconfigurable
> on-the-fly by the 200Mhz ARM9 CPU running Debian Linux, Altera Cyclone
> II FPGA is included on my TS-7300 board. Advantage is, Altera FPGA and
> a dedicated high-speed bus between the CPU and FPGA provides a good
> design scope to provide many solutions.

What's your point here?  A 200MHz hard ore won't see the issues 
under discussion.  We're talking about systems where the CPU itself
is "soft" and implemented in an FPGA.

            Regards,

            Kevin K.

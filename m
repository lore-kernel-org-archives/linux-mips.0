Received: from colombia (c211-30-22-201.thorn1.nsw.optusnet.com.au [211.30.22.201])
	by mail014.syd.optusnet.com.au (8.11.6p2/8.11.6) with ESMTP id i2KCw8F10293
	for <linux-mips@linux-mips.org>; Sat, 20 Mar 2004 23:58:09 +1100
From: "Martin C. Barlow" <mips@martin.barlow.name>
Subject: RE: hwclock and df seg fault
Date: Sat, 20 Mar 2004 23:57:52 +1100
Message-ID: <000101c40e7a$f6061810$6500a8c0@colombia>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20040320122201.GA32242@linux-mips.org>
Return-Path: <mips@martin.barlow.name>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040320125752.u5oJ2bU6Uu06a2Nk8n-lVuOxv-RmtWfjGVtG83cO1Aw@z>

I downloaded the kernel from cvs today (less than 6 hours ago). 
I will recompile without preemptible and let you know the result. 
The version is 2.6.4

marty

-----Original Message-----
From: Ralf Baechle [mailto:ralf@linux-mips.org] 
Sent: Saturday, 20 March 2004 11:22 PM
To: Martin C. Barlow
Cc: linux-mips@linux-mips.org
Subject: Re: hwclock and df seg fault


On Sat, Mar 20, 2004 at 09:05:40PM +1100, Martin C. Barlow wrote:

> I have an old SGI indy R4600 and have installed debian testing with 
> latest linux-mips cvs kernel. I found two problems with the programs 
> hwclock and df. Apart from that appears to work fine. I have included 
> their output. I don't know if it is a kernel or package problem. I 
> don't know if it as something to do with preemtible kernel which I 
> enabled in kernel. If anyone is interested and wants to see kernel 
> .config, fstab or anything else I'm happy to oblidge.

Standard flame - what kernel version?

I checked in the last fixes for the preemptible kernel less than two
days ago so if your kernel is older than that it's time to update :-)

  Ralf

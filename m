Message-ID: <000501c4205f$2ef003c0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <000301c42053$2ae67fe0$e60a0a0a@guendalin>
Subject: Re: Raq2 & 2.6.4 : Strange output fro msomewhere
Date: Mon, 12 Apr 2004 09:24:21 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Massimo Cetra <mcetra@navynet.it>, linux-mips@linux-mips.org
Message-ID: <20040412072421.Qut879OAD_fHFOrwneOmU23UUZeDy2p3suv25Ba2iac@z>

I don't have the sources to "uptime" handy, but the concept of a "HZ" value
us something that goes back to AT&T UNIX, representing the number of
clock interrupts per second.  It was originally 60, as it was based on the 
wall current AC frequency in the US, but once 100 became a popular
value once people started having faster CPUs and stopped using their
power supplies to generate the signal.

Historically, it was a constant specified in some kernel/system header
file like "sys/param.h".

So I would tend to conclude that the uptime program does some kind 
of switch-driven computation based on the value of HZ it picks up (at
build time?), that the value for the Raq2 is 79, and that 79 isn't one
of the values recognized by the code.

----- Original Message ----- 
From: "Massimo Cetra" <mcetra@navynet.it>
To: <linux-mips@linux-mips.org>
Sent: Monday, April 12, 2004 7:58
Subject: Raq2 & 2.6.4 : Strange output fro msomewhere


> Hi!
> 
> (i'm new here).
> I have managed to compile CVS kernels for 2.6.4 and 2.4.25 trees on my
> Raq2... And they work great.
> 
> Now...
> Under heavy load (generating kernel_headers debian package), i saw the
> following:
> 
> -cobalt:/proc# uptime
> Unknown HZ value! (79) Assume 100.
>  06:54:27 up 14 min,  2 users,  load average: 1.77, 1.37, 0.69
> cobalt:/proc# sar 2 2
> Linux 2.6.4 (cobalt)    04/12/04
> 
> 06:54:32          CPU     %user     %nice   %system     %idle
> 06:54:34          all     18.31      0.00     81.69      0.00
> 06:54:36          all     16.67      0.00     83.33      0.00
> Average:          all     17.60      0.00     82.40      0.00
> cobalt:/proc# uname -a
> Linux cobalt 2.6.4 #2 Mon Apr 12 05:50:49 CEST 2004 mips unknown
> cobalt:/proc#
> 
> 
> What is : "Unknown HZ value! (79) Assume 100." ????????????????????????
> 
> Thanks..
> 
>  Massimo
> 
> 
> 
> 

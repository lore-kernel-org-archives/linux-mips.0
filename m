From: "Mike Connors" <mike.connors@ghs.com>
Subject: RE: need help - malta board mips5kc
Date: Tue, 31 Dec 2002 12:08:40 -0800
Message-ID: <001301c2b108$699bad20$6401a8c0@NOMAD>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20021231074733.52293.qmail@web14804.mail.yahoo.com>
Return-Path: <mike.connors@ghs.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'amit lubovsky' <amit_lubovsky@yahoo.com>, linux-mips@linux-mips.org
Message-ID: <20021231200840.F-ToZr6EzhmIrmKDaYdAW5nv6s9jNCR0gbpnRsdLos0@z>

I've been doing some relative work with the Green 
Hills probe and a Malta 4kc.  The configuration of 
the kernel I am using requires parameters to be 
passed in to the kernel to tell it were to find 
the root device (ie root=/dev/hda1).  To make things 
simple, I would load using YAMON, connect with the 
debugger, then set a breakpoint in a section of 
the kernel I was interested in, then run using the 
YAMON command go . root=/dev/hda1.  I plan to eventually 
figure out where it is being written to memory and just 
write it myself after downloading the image through 
the probe. 

There are many other issues you might run into when 
using Linux with a probe.  We have updated the GHS 
probe firmware to behave nicely with Linux.  This 
helps when debugging loadable device drivers, etc. 
I will forward your email to our Linux integration 
engineers to see what other issues you might run into. 
They have more experience with the Malta 5kc. 

Regards, 
Mike 
--- 
Mike Connors			Green Hills Software, San Clemente 
Field Applications Engineer	131 Avenida Victoria 
mailto:mikec@ghs.com		San Clemente, CA  92672 
phone: 1-949-369-3950		
cell:  1-949-412-3951		fax: 1-949-369-3959 

Latest GHS news: 
Green Hills Software's INTEGRITYR RTOS Flies In F-16 Fighter Jet
http://www.ghs.com/news/221220f.html 

Green Hills Software Inc.	phone: 	1-805-965-6044 
30 West Sola Street		toll-free: 1-800-765-GREEN (4733) 
Santa Barbara, CA 93101		Tech-Support: 1-877-GHS-TECH (447-8324) 
http://www.ghs.com		Email Support: mailto:support@ghs.com 

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org 
> [mailto:linux-mips-bounce@linux-mips.org] On Behalf Of amit lubovsky
> Sent: Monday, December 30, 2002 11:48 PM
> To: linux-mips@linux-mips.org
> Subject: need help - malta board mips5kc
> 
> 
> Hi,
> I try to load a Linux image with HW debuger
> (Lauterbach) to a malta board with mips5kc with no
> success.
> With vxWorks image it loads and run with no problem,
> Any idea what is wrong?, the load address? the 'go'
> address?
> Thanks,
> Amit.
> 
> __________________________________________________
> Do you Yahoo!?
> Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
> http://mailplus.yahoo.com
> 
> 

Message-ID: <056401c3ce00$5cd8a690$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Law10-F61XsDQ1sMzqi00015abf@hotmail.com>
Subject: Re: hardware questions
Date: Mon, 29 Dec 2003 12:39:02 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Mark and Janice Juszczec <juszczec@hotmail.com>, linux-mips@linux-mips.org
Message-ID: <20031229113902.Wa3aa_I_z5y19kFW4JhT24rErmzNsXzvgB4ybBdT-vU@z>

As Geert pointed out, the big-endian SGI hardware configuration
and the little-endian PDA configuration mean that you'll be cross-compiling
for "mipsel" (MIPS endian-little) on the Indigo anyway.  SGI did
use industry-standard monitors, keyboards, and disks units of the
period (which was 10 years ago - they could be hard to find today), 
but used non-standard NIC and memory cards. You're probably better 
off using a Linux PC as your development host.

----- Original Message ----- 
From: "Mark and Janice Juszczec" <juszczec@hotmail.com>
To: <linux-mips@linux-mips.org>
Sent: Sunday, December 21, 2003 17:20
Subject: hardware questions


> 
> Hi folks
> 
> I'm the guy with the Helio pda running an r3912 chip.  In an effort to 
> create a better development environment, I'm thinking about puchasing a 
> Silicon Graphics Iris Indigo Workstation.
> 
> But, I'm unfamiliar with MIPS hardware.
> 
> First of all, will code developed on this machine run on the r3912 chip?  
> The r3912 is little endian mips, 16 bit I think but maybe 32 bit.
> 
> Can off the shelf monitors, keyboards, hard drives, NICs and memory be 
> installed in this system?
> 
> Mark
> 
> _________________________________________________________________
> Grab our best dial-up Internet access offer: 6 months @$9.95/month.  
> http://join.msn.com/?page=dept/dialup
> 
> 
> 

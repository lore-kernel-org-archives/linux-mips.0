Message-ID: <sea8dc20.086@quicklogic.com>
Date: Fri, 25 Apr 2003 06:56:14 -0700
From: "Dan Aizenstros" <daizenstros@quicklogic.com>
Subject: Re: NCD900 port?
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Return-Path: <daizenstros@quicklogic.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: coldwell@frank.harvard.edu, kevink@mips.com
Cc: linux-mips@linux-mips.org
Message-ID: <20030425135614.GK_Djsol1s1RqorOKvTzh6vahDE4jKcnEgKmWUMIXfE@z>

Hello Chip,

The V320USC is fully documented and manuals are
available if you want them. The QuickLogic web site
is a bit out of date with respect to the Linux support.
I am tracking the linux-mips CVS tree and I can send
you a patch sometime next week. However, the patch will
be for our Hurricane board and so you will have to make
changes to support the NCD device.

Can you provide any information about the bootloader?
Does it support loading of ELF images?

Also, do you know what endian the machine is using.
The Linux port is mostly tested little endian and
may need some work to get big endian going.

Regards,

Dan Aizenstros

>>> Chip Coldwell <coldwell@frank.harvard.edu> 04/24/03 15:51 PM >>>
On Thu, 24 Apr 2003, Chip Coldwell wrote:

> On Thu, 24 Apr 2003, Kevin D. Kissell wrote:
> > 
> > What PCI bridge is being used?  Galileo?
> 
> Good question.  Short answer: I don't know.  I'll pry off the hood
> and take a peek at what's on the board, unless this is something that
> shares a die with the CPU.

It was easy to identify once I took off the cover.  The PCI bridge is
made by V3 Semiconductor (now a part of QuickLogic?), part number
V32OUSC-75LP (Rev. B1):

http://www.quicklogic.com/home.asp?PageID=235&sMenuID=126

Is this the one called "Galileo"?

There's also two RS-232 line drivers/receivers, MAX3185 made by Maxim
(now part of Dallas Semiconductor) and some nearby Samsung parts that
I suppose are probably UARTs (this thing has two serial ports).  I
would guess that getting something to come out on a serial console is
going to be my first step.

Digitally signed images and bootloaders that enforce them sounds
particularly nasty.  That's a show topper for me, if it turns out to
be that way.

Chip

-- 
Charles  M. "Chip" Coldwell
"Turn on, log in, tune out"

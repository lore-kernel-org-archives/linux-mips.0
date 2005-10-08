Received: from sccrmhc14.comcast.net ([63.240.76.49]:12163 "EHLO
	sccrmhc14.comcast.net") by ftp.linux-mips.org with ESMTP
	id S8133433AbVJHDdh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Sat, 8 Oct 2005 04:33:37 +0100
From: "Kyle Unice" <unixe@comcast.net>
Subject: RE: Cross-compiling Linux problem
Date: Fri, 7 Oct 2005 21:33:27 -0600
Message-ID: <003701c5cbb9$0c4a9590$0400a8c0@buzz>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
In-Reply-To: <4346F65B.6050800@avtrex.com>
Return-Path: <unixe@comcast.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'David Daney' <ddaney@avtrex.com>
Cc: ppopov@embeddedalley.com, 'Brett Foster' <fosterb@uoguelph.ca>, linux-mips@linux-mips.org
Message-ID: <20051008033327._sJ57T5utWRgaDz8-5776hsUL5U7HFa9pvLnEBz4IFU@z>

David,
Thanks I downloaded and installed git.  Used git to get the linux source 
And did a build and got:

  CC      arch/mips/au1000/common/prom.o
  AS      arch/mips/au1000/common/int-handler.o
  CC      arch/mips/au1000/common/irq.o
  CC      arch/mips/au1000/common/puts.o
  CC      arch/mips/au1000/common/time.o
  CC      arch/mips/au1000/common/reset.o
  CC      arch/mips/au1000/common/au1xxx_irqmap.o
  CC      arch/mips/au1000/common/clocks.o
  CC      arch/mips/au1000/common/platform.o
  CC      arch/mips/au1000/common/power.o
  CC      arch/mips/au1000/common/setup.o
  AS      arch/mips/au1000/common/sleeper.o
  CC      arch/mips/au1000/common/cputable.o
  CC      arch/mips/au1000/common/dma.o
  CC      arch/mips/au1000/common/dbdma.o
  CC      arch/mips/au1000/common/gpio.o
  CC      arch/mips/au1000/common/pci.o
arch/mips/au1000/common/pci.c: In function `au1x_pci_setup':
include/asm-mips/mach-au1x00/ioremap.h:15: sorry, unimplemented: inlining
failed
 in call to '__fixup_bigphys_addr': function body not available
arch/mips/au1000/common/pci.c:28: sorry, unimplemented: called from here
make[1]: *** [arch/mips/au1000/common/pci.o] Error 1
make: *** [arch/mips/au1000/common] Error 2

Kyle

-----Original Message-----
From: David Daney [mailto:ddaney@avtrex.com] 
Sent: Friday, October 07, 2005 4:28 PM
To: Kyle Unice
Cc: ppopov@embeddedalley.com; 'Brett Foster'; linux-mips@linux-mips.org
Subject: Re: Cross-compiling Linux problem

Kyle Unice wrote:
> I am using gcc-3.4.4 and the cvs checkout of linux-mips.org tree.
> Kyle

Not withstanding Maciej's comment about the real problem being the 
broken header file, I give you a quote from 
http://www.linux-mips.org/wiki/Git : "At this time only the linux.git 
repository is in production use.... all other archives are only historical."

You might consider getting your code from the git repository as the CVS 
repository is no longer being maintained.

David Daney

Subject: Re: module dependency files
From: Jeff Angielski <jeff@theptrgroup.com>
In-Reply-To: <Pine.GSO.4.44.0310211717110.14194-100000@ares.mmc.atmel.com>
References: <Pine.GSO.4.44.0310211717110.14194-100000@ares.mmc.atmel.com>
Content-Type: text/plain
Message-ID: <1066771519.3289.45.camel@localhost.localdomain>
Mime-Version: 1.0
Date: 21 Oct 2003 17:25:20 -0400
Content-Transfer-Encoding: 7bit
Return-Path: <jeff@theptrgroup.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Kesselring <dkesselr@mmc.atmel.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20031021212520.eGBNJWpaod2ceOtj5YLLCJlpXPi2txPUk9_fjhaqFFY@z>

From the Linux kernel Makefile...

#
# INSTALL_MOD_PATH specifies a prefix to MODLIB for module directory
# relocations required by build roots.  This is not defined in the
# makefile but the arguement can be passed to make if needed.
#
                                                                                Just set this to the location of your target filesystem when you do the modules_install.

Jeff Angielski
The PTR Group

On Tue, 2003-10-21 at 17:22, David Kesselring wrote:
> I have now gotten the modules to build but there is one part of the
> process that doesn't work. On my pc I want to build all of the files which
> are to be installed on the mips board. I am trying to create the files
> which can be copied onto (or into) the redhat 7.3 miniport. "make modules"
> works fine. It seems like I need to run "make modules_install" but it
> complains about the .o files being the wrong architecture. So the basic
> question seems to be how can I run depmod on the pc for mips?
> Thanks again.
> 
> David Kesselring
> Atmel MMC
> dkesselr@mmc.atmel.com
> 919-462-6587
> 

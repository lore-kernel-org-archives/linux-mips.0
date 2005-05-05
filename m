From: "Bryan Althouse" <bryan.althouse@3phoenix.com>
Subject: ATA devices attached to arbitary busses
Date: Thu, 5 May 2005 13:56:57 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <20050505175716Z8225009-1340+6570@linux-mips.org>
Return-Path: <bryan.althouse@3phoenix.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: owner-linux-mips@oss.sgi.com
Cc: linux-mips@linux-mips.org
Message-ID: <20050505175657.h5miuFWo1N5gLFMmNRFTe13osi5xOSrWA5sRTvNMkNQ@z>

owner-linux-mips@oss.sgi.com  wrote on 8/19/2002:

> We support ATA devices attached to arbitary busses. The newest ATA code
> supports arbitary mmio/pio addressing mechanisms. You don't need ISA or
> an ISA like bus.


This is good news!  We want to connect an IDE flash drive to the local bus
of an rm9224.  Of course we will have to make an IDE host adapter with an
FPGA.  Right now, I'm a bit clueless as to how to get the linux kernel to
support this.  Could someone please point me in the right direction?  What
kernel source files should I be looking at?  Is there any documentation?
Many thanks!

Bryan 

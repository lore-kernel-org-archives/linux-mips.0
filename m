From: Russell King <rmk@arm.linux.org.uk>
Message-ID: <200006202010.VAA22426@flint.arm.linux.org.uk>
Subject: Re: Proposal: non-PC ISA bus support
Date: Tue, 20 Jun 2000 21:10:06 +0100 (BST)
In-Reply-To: <Pine.GSO.4.10.10006201254290.8592-100000@dandelion.sonytel.be> from "Geert Uytterhoeven" at Jun 20, 2000 01:21:10 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Linux kernel <linux-kernel@vger.rutgers.edu>, Linux/PPC Development <linuxppc-dev@lists.linuxppc.org>, Linux/MIPS Development <linux@cthulhu.engr.sgi.com>
Message-ID: <20000620201006.PSTBMuUAcNemsETkr-OkWUJzFQaBaEggPVyfXIHnkZ0@z>

Geert Uytterhoeven writes:
>  1. ISA I/O space is memory mapped on many platforms (e.g. PPC and MIPS). To
>     access it from user space, you cannot plainly use inb() and friends like on
>     PC, but you have to mmap() the correct region of /dev/mem first. This
>     region depends on the machine type and currently there's no simple way to
>     find out from user space.

We've already solved this on ARM.  Check out arch/arm/kernel/isa.c
   _____
  |_____| ------------------------------------------------- ---+---+-
  |   |         Russell King        rmk@arm.linux.org.uk      --- ---
  | | | |   http://www.arm.linux.org.uk/~rmk/aboutme.html    /  /  |
  | +-+-+                                                     --- -+-
  /   |               THE developer of ARM Linux              |+| /|\
 /  | | |                                                     ---  |
    +-+-+ -------------------------------------------------  /\\\  |

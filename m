Date: Sat, 16 Dec 2000 11:20:00 +0100 (MET)
From: Karel van Houten <K.H.C.vanHouten@research.kpn.com>
Subject: Re: Kernel Oops when booting on DECstation
In-reply-to: <20001216085603.A514@sumpf.cyrius.com>
Message-ID: <200012161020.LAA28799@sparta.research.kpn.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Martin Michlmayr <tbm@cyrius.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20001216102000.6U8MU6cOu_cfBwBCEXYOji7t1LX-4Bz0zOE_3c6qy_Q@z>

Martin wrote:
> When I boot a Linux kernel on a DECstation/125, I get the following oops:
> 
> >>boot 3/rz2/vmlinux root=/dev/sda1 console=ttyS2 root=/dev/sda1
> >> NetBSD/pmax Secondary Boot, Revision 1.0
> >> (root@vlad, Sat Mar  4 14:34:30 EST 2000)
> ...
> POSIX conformance testing by UNIFIX
> Unable to handle kernel paging request at virtual address 00000004, epc == 80054
> ...
> 
> Any ideas?  (I hope and think that it has nothing to do with me
> booting from a NetBSD partition.  I don't have ethernet on the machine
> and thus have to boot the kernel from the existing FFS partition in
> order to start Linux and then run delo.  NetBSD boots and works, btw.)

The next entry the kernel would print is the Turbochannel scan.
Do you have any unsupported cards in your system that could cause this?

Have you tried my kernels, by the way?

-- 
Karel van Houten

----------------------------------------------------------
The box said "Requires Windows 95 or better."
I can't understand why it won't work on my Linux computer. 
----------------------------------------------------------

From: erik.niessen@philips.com
Subject: Graphics on a mips-board
Message-ID: <0056890012369098000002L982*@MHS>
Date: Fri, 14 Jul 2000 00:00:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; name="MEMO 07/13/00 23:59:24"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: linux-mips@oss.sgi.com
Message-ID: <20000713220037.OKqfBGCivBDxB6t5tsTqlGC-3cU-rO6wtpZ2MxoLGMI@z>

Hello,

I have the ide-controller running on my mips-board. My next step will be to get some graphics out of this box. On the board is an onboard graphics chip and according to the specs it is VGA compatible.

I am using the serial-console for debugging and for sending characters to the box. My source tree is based on kernel 2.2.12.

Because the chip is VGA compatible I try to get the VGA16 framebuffer running on the box. After enabling the VGA16 framebuffer I receive the following output:

Jumping to image at 800605DCh...
Detected 16MB of memory.
Loading R4000/MIPS32 MMU routines.
CPU revision is: 000028a0
Primary instruction cache 32kb, linesize 32 bytes
Primary data cache 32kb, linesize 32 bytes
Linux version 2.2.12 (eniessen@psvcas16) (gcc version egcs-2.90.29 980515 (egcs-
1.0.3 release)) #10 Thu Jul 13 13:45:19 PDT 2000
calculating r4koff... 000f4240(1000000)
CPU frequency 200.00 MHz
Console: colour VGA+ 80x50
Calibrating delay loop... 199.88 BogoMIPS
Memory: 12652k/16380k available (616k kernel code, 2724k data)
Checking for 'wait' instruction...  available.
POSIX conformance testing by UNIFIX
PCI: Probing PCI hardware
Found SAA9730 at b2800000
Linux NET4.0 for Linux 2.2
Based upon Swansea University Computer Society NET3.039
Starting kswapd v 1.1.1.1
vga16fb: initializing
vga16fb: mapped to 0xa00a0000
Console: switching to colour frame buffer device 80x30

It is doing the take_over_console but when I check the output of my VGA-connector there is no signal. Someone an idea how I can debug this???

Has somebody any experience with framebuffers on a mips?

Any hints/links/tips would be welcome,

Thanks for your time,

	Erik

Date: Wed, 31 Jan 2001 17:36:54 -0500 (EST)
From: Kenneth C Barr <kbarr@MIT.EDU>
Subject: netbooting indy
Message-ID: <Pine.GSO.4.30L.0101311648280.22989-100000@home-on-the-dome.mit.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: linux-mips@oss.sgi.com
Message-ID: <20010131223654.0erRDMHxJf1zC0SqDyvKhpyo8eP9D3x7-OqTyb79B2E@z>

I finally got bootp/tftp to answer my indy's pleas for an image, but get
the following behavior (with my own IP addr and server, obviously):

>> boot bootp():/vmlinux
   73264+592+11520+331680+27848d+3628+5792 entry: 0x8df9a960
   Setting $netaddres to 192.168.1.5 (from server deadmoon)
   Obtaining /vmlinux from server deadmoon

i get a spinning cursor, which becomes the letter "n" and the entire
machine (including keyboard, mouse) locks.

A packet trace with ethereal reveals the indy ack'ing 2730 packets of 512
bytes each (1,397,760) before sending a "TFTP Error Code" packet:

Opcode: Error Code (5)
Error Code: Disk full or allocation exceeded (3)

The server's disks are not full, and my impression was that the indy would
be d/ling the vmlinux image into memory, not disk.  I have 64MB of RAM.

I repeated the process and got the same "n"-freeze a second time.

What does this behavior indicate?  (I didn't see it in HOWTO common
errors)  How can I fix it?

Thanks for your ideas,
Ken

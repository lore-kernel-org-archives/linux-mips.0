Received: from RADIUM (localhost [127.0.0.1])
	by medtron.medtronic.com (8.10.1/8.10.1) with SMTP id g9BHYrw16860
	for <linux-mips@linux-mips.org>; Fri, 11 Oct 2002 12:34:53 -0500 (CDT)
From: "Lyle Bainbridge" <lyle@zevion.com>
Subject: GCC 3.2 to build mips-linux kernel
Date: Fri, 11 Oct 2002 12:34:53 -0500
Message-ID: <NCBBKGDBOEEBDOELAFOFAEPMDAAA.lyle@zevion.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <lyle@zevion.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20021011173453.iQJHIjERa7zQsp4U1oGqdrTaZyVvQCgzpTjvZgP5FIE@z>


I built a mips-linix 2.4.18 kernel for an AU1500 board using:
  gcc-3.2  /   binutils-2.13   /   glibc-2.2.5

It builds and executes but is unsuccessful during startup.
I have attached the log at the end of this message.  It
appears to have skipped a number of steps.  I noticed that
a working kernel built with gcc 2.95.3 is 800K larger.
(~3MB versus !2.2MB).

I'm a little confused, and wondered if the 3.2 compiler requires
some patching to work for mips-linux.

Any advice would be appreciated.

Lyle Bainbridge

Kernel Startup Log follows:

init arch
init prom
init cpu
CPU revision is: 01030200
Primary instruction cache 16kb, linesize 32 bytes (4 ways)
Primary data cache 16kb, linesize 32 bytes (4 ways)
Linux version 2.4.18-mips (Lyle Bainbridge@RADIUM) (gcc version 3.2) #1 Fri
Oct
11 01:48:42 2002
Determined physical RAM map:
 memory: 02000000 @ 00000000 (usable)
On node 0 totalpages: 8192
zone(0): 8192 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line:  console=ttyS0,38400
calculating r4koff... 003c6ea4(3960484)
CPU frequency 396.05 MHz
Calibrating delay loop... 395.67 BogoMIPS
Memory: 29476k/32768k available (1309k kernel code, 3292k reserved, 96k
data, 20
0k init, 0k highmem)
Dentry-cache hash table entries: 4096 (order: 3, 32768 bytes)
Inode-cache hash table entries: 2048 (order: 2, 16384 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
Kernel panic: can't allocate root vfsmount
In idle task - not syncing

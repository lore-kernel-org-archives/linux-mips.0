Message-ID: <199907121239.OAA16846@zaphod.et.tudelft.nl>
Subject: Small problems on Indy
Date: Mon, 12 Jul 1999 14:39:26 +0200 (CEST)
From: Edwin Hakkennes <E.Hakkennes@et.tudelft.nl>
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: linux@cthulhu.engr.sgi.com
Cc: Edwin Hakkennes <E.Hakkennes@et.tudelft.nl>
Message-ID: <19990712123926.UAXOBM1tn41VrJK-W2OgN-G11j2LN1xiYVZ4XHgw_pE@z>

Hi all,

After lurking on the sgi-list for more than a year, I installed one of
our indy's with hardhat. I couldn't get bootp working, so I copied the
install kernel to the efs-root of the Irix (5.2?) disk, which proved a
workable solution.

I have a few questions:

1) The console uses 62 lines, but I can see only 47 of them using an
Iiyama monitor. I also tried a genuine SGI monitor, which gives me all
62 lines. How can I set the number of lines?

2) How can I specify kernel options in the ARC firmware?  

I tried
setenv -p OSLoadOptions "root=/dev/sdb1"
init
printenv OSLoadOptions 
which gives
OSLoadOptions=root=/dev/sd

so this doesn't seem to work.
Can I use rdev on i386 machine for this?

3) What is the prefered partitioning scheme.  I would like to go back
to one disk, with no IRIX installed. So the question is what partition 
types is the arc-firmware able to boot from? (iso,fat)

Can we alternatively store the kernel in the disk-label? From within Linux??

Is the following possible?  

sda1    20 MB      /boot    type=efs (or iso9660, or fat)
sda2   100 MB      /        type=ext2
sda3   whole disk? 				Is this necessary?
sda4   800 MB      /usr     type=ext2
sda5   128 MB      SWAP
sda6   REST        /data    type=ext2

Is linux capable of writing to an efs partition?


Thanks in advance,


Edwin Hakkennes


(I'm running 
Linux version 2.1.100 (root@alex3.med.iacnet.com) (gcc version 2.7.2) #1 Sun Jul 12 17:32:40 EDT 1998
on a 100Mhz Indy:
cpu                     : MIPS
cpu model               : R4600 V1.0
system type             : SGI Indy
BogoMIPS                : 99.94
byteorder               : big endian
unaligned accesses      : 0
wait instruction        : yes
microsecond timers      : no
extra interrupt vector  : no
hardware watchpoint     : no

Hinv of its neighbor running IRIX:

1 100 MHZ IP22 Processor
FPU: MIPS R4610 Floating Point Chip Revision: 0.0
CPU: MIPS R4600 Processor Chip Revision: 1.0
On-board serial ports: 2
On-board bi-directional parallel port
Data cache size: 16 Kbytes
Instruction cache size: 16 Kbytes
Main memory size: 64 Mbytes
Iris Audio Processor: version A2 revision 4.1.0
Integral Ethernet: ec0, version 1
Disk drive: unit 1 on SCSI controller 0
Integral SCSI controller 0: Version WD33C93B, revision D
Graphics board: Indy 8-bit
)

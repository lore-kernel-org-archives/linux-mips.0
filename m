Message-ID: <019801c0d50c$32024fb0$2dd75b82@serendipity>
From: "Patrick Fisher" <pbfisher@seas.upenn.edu>
Subject: Executing Programs from initrd
Date: Fri, 4 May 2001 22:36:31 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010505023631.DYYJ_FEWyTxEwnZpvT216n2qUnVRW5dOb50I1wnLAhQ@z>


I'm plodding along working with Linux/MIPS (and Linux-VR) on a Philips Nino.
I can boot linux, and fool around with the stand alone shell.  I can also
execute a program included on Steven Hill's Nino ramdisk - a simple Hello
World program, in assembly, which I compiled with my mipsel-linux toolchain
(well, also from Steven Hill, but it was compiled locally on my own
machine).  That program runs fine.

    However, I can't run any binaries other than this one and the shell.  I
wrote an additional Hello World program in C, compiled it for mipsel, and
put it in the ramdisk.  The executable is definitely there when I boot on
the nino - I can send it all to the serial console and see that it exists.
However, any attempt to execute it returns "No such file or directory".
It's got all the right permissions, and this occurs when I'm positive I'm
giving it the whole path.  It simply can't see the file.  I also copied "ls"
from a root image for a mipsel decstation, and got the same problem.  I
downloaded the GNU fileutils source, set it for a mipsel target, compiled,
put a few binaries on the ramdisk, and again, it can't find the file (but
it's there, and I can see the contents).
This occurs on a ~650k ramdisk with ~30k free, and a 2MB ramdisk with ~1.5MB
free, using either the SGI Linux/MIPS sources or the Linux-VR project's
sources.


Any ideas?

Thanks,
Patrick

Received: from amdk62400 ([206.172.132.43]) by tomts13-srv.bellnexxia.net
          (InterMail vM.5.01.05.32 201-253-122-126-132-20030307) with SMTP
          id <20030612191059.YYUS1194.tomts13-srv.bellnexxia.net@amdk62400>
          for <linux-mips@linux-mips.org>; Thu, 12 Jun 2003 15:10:59 -0400
Message-ID: <000501c33116$3e90e2b0$0400a8c0@amdk62400>
Reply-To: "HG" <henri@broadbandnetdevices.com>
From: "HG" <henri@broadbandnetdevices.com>
Subject: ramdisk on mips question 
Date: Thu, 12 Jun 2003 15:10:08 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <henri@broadbandnetdevices.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030612191008.UV9yK4DATttjPBt1XtSrhY6WzfPpzPh8qM0VIvZBGX4@z>

Hi all,

while compiling a kernel for our board based on the idt 79rc332 , i am
getting the error below.
The target board is big endian. The files that where gziped where created
with a crossassembler that produces big endian files
the kernel is the 2.4.21-pre3. the ramdisk.gz file was created on a pc based
linux with some test files(big endian)
and copied in the location .../linux/arch/mips/ramdisk

1-    am i reading it right that the linker wont accept the ramdisk.gz
because it was created on a little endian system (the pc linux)
command to create the file : cat file1 file2 ... | gzip -c > ramdisk.gz

2-    anyone know a workaround for this problem(other than changing the
target ,and its monitor to little endian ) .



many thanks for all help

Henri



from make .....
 make[1]: Entering directory
`/home/henri/idt/linux_2p4p21/linux/arch/mips/ramdisk'
echo "O_FORMAT:  " elf32-bigmips
O_FORMAT:   elf32-bigmips
mips-linux-ld -T ld.script -b binary --oformat elf32-bigmips -o ramdisk.o
"ramdisk.gz"
mips-linux-ld: ramdisk.gz: compiled for a little endian system and target is
big endian
File in wrong format: failed to merge target specific data of file
ramdisk.gz
make[1]: *** [ramdisk.o] Error 1
make[1]: Leaving directory
`/home/henri/idt/linux_2p4p21/linux/arch/mips/ramdisk'
make: *** [_dir_arch/mips/ramdisk] Error 2

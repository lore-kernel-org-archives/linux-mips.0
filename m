From: rajesh.palani@philips.com
Subject: Problem with using modutils
Message-ID: <0056910011132437000002L172*@MHS>
Date: Wed, 28 Mar 2001 13:53:04 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; name="MEMO 03/28/01 13:50:07"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com, linux-mips@fnet.fr
Message-ID: <20010328195304.t4fsZDMGWjVGhpgOmJJYnuriAL1fV7fMfz-qsyZBqoU@z>

Hi,

   I am trying to use insmod on a MIPS platform.  I try to install a simple module & get the following errors:

   local symbol gcc2_compiled. with index 10 exceeds local_symtab_size 10
   local symbol __gnu_compiled_c with index 11 exceeds local_symtab_size 10

   I use the following line for generating the object file:
   mipsel-linux-gcc -D__KERNEL__  -DMODULE -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer  -G 0 -mno-abicalls -fno-pic -mcpu=r3000 -mlong-calls -mips1 -pipe  -c

   I am using modutils version 2.3.11.  We have tried both Debian and RedHat sources cross-compiled for MIPS with the following options:
CC=mipsel-linux-gcc CFLAGS="-I../linux/include -DMIPS" RANLIB=mipsel-linux-ranlib AR=mipsel-linux-ar ./configure  --disable-kerneld
--disable-compat-2-0 --enable-insmod-static --target=mipsel-linux
However the problem still remains.

   Any pointers would be greatly appreciated.

   Best regards,

   Rajesh

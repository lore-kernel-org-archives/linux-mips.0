Received: from blaze.ghs.com (blaze.ghs.com [192.67.158.233])
	by eta.ghs.com (8.12.8/8.12.8) with ESMTP id h3K0LhMD000943
	for <linux-mips@linux-mips.org>; Sat, 19 Apr 2003 17:21:43 -0700 (PDT)
Received: from NOMAD (nomad.ghs.com [192.168.112.124])
	by blaze.ghs.com (8.10.2+Sun/8.10.2+Sun) with ESMTP id h3K0LgW05412
	for <linux-mips@linux-mips.org>; Sat, 19 Apr 2003 17:21:42 -0700 (PDT)
From: "Mike Connors" <mike.connors@ghs.com>
Subject: assembly debug question
Date: Sat, 19 Apr 2003 17:20:27 -0700
Message-ID: <001d01c306d2$a55fbe80$7c70a8c0@NOMAD>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-Path: <mike.connors@ghs.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030420002027.u0CSMrOQJGfHHel8FWJYc1HaVt_jtezzHwREEmNybrE@z>

Hi All, 

I'm using gcc v2.96 to compile a MIPS targeted Linux kernel 
and am finding it difficult to produce debug information 
for assembly files. 

I've discovered that a typical compile line for assembly 
in the kernel gets its parameters from AFLAGS and results 
in the following commandline: 

mipsel-linux-gcc -D__ASSEMBLY__ -D__KERNEL__ -I/l/include \
	-G 0 -mno-abicalls -fno-pic -mcpu=r4600 -mips2 \
	-Wa,--trap -pipe -c entry.S -o entry.o 

According to the documentation, some targets support 
dwarf debug information using --gdwarf2.  Does anyone 
know if the MIPS target is supported in version? 

Also, --gstabs doesn't seem to work either.  Nor does 
-gdwarf-2, -gdwarf -g2, -gstabs+, -gdwarf+, etc. 

Has anyone had luck producing debug information for 
assembly files with this version of gcc? 

./mipsel-linux-gcc --version 
2.96 
./mipsel-linux-as --version 
GNU assembler 2.11.92.0.10 

Thanks in advance, 
Mike 

--- 
Mike Connors			Green Hills Software, San Clemente 
Field Applications Engineer	131 Avenida Victoria 
mailto:mike.connors@ghs.com	San Clemente, CA  92672 
phone: 1-949-369-3950		
cell:  1-949-412-3951		fax: 1-949-369-3959 

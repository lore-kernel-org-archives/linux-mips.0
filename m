Message-ID: <03d201c15e56$7c26cac0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20011026185452.88972.qmail@web10804.mail.yahoo.com>
Subject: Re: MIPS 32bit and 64bit mode
Date: Fri, 26 Oct 2001 21:42:13 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: han han <piggie111000@yahoo.com>, linux-mips@oss.sgi.com
Message-ID: <20011026194213.R8u_4nS7MFmT6GrLeIrMCp28U9V6io8CnX9Vtkiz8Ws@z>

> But, how does MIPS 5kc work with 32bit Linux kernel?

If the KX, UX, and PX bits of the CP0 Status register
are all zero, a MIPS5Kc is essentaillly functioning as
a 32-bit CPU.  The registers are still 64 bits, and
arithmetic operations will cause all 64 bits of the
destination to be written, but this is outside of the
"event horizon" of the program so long as 64-bit
data and addressing is not enabled.  The 64-bit
5Kc can, and does, boot the same Linux kernel as 
the 32-bit 4Kc.  MIPS64 is a strict superset of MIPS32.

> Do you means there is no difference between 32 bit
> mode and 64 bit mode for MIPS 5kc in kernel mode?

There is no such thing as "32-bit mode" and "64-bit
mode", not really.  There are 64-bit data-type instructions
(e.g. "LD", "DADD") and, logically independently, there
is 64-bit addressing for loads and stores - which includes 
LW and LB as well as LD.  64-bit data is always enabled 
in kernel mode on a MIPS64 part.  For 64-bit data in User 
mode, and for 64-bit addressing in *either* mode, there are 
explicit enables.

            Kevin K.

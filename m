From: "Lyle Bainbridge" <lyle@zevion.com>
Subject: RE: How to translate Little to Big endian ?
Date: Wed, 24 Sep 2003 11:12:12 -0500
Message-ID: <000001c382b6$9e3b6fe0$1400a8c0@radium>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <01C382AE.A6330DF0.prabhakark@contechsoftware.com>
Return-Path: <lyle@zevion.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: prabhakark@contechsoftware.com, linux-mips@linux-mips.org
Message-ID: <20030924161212.o2pyDqw-5EhVn3n1sGHdEJMuMM3i8dNjyqQLB82ZxgA@z>

Hi,

I believe that the CSB250 port will support big or small endian. Check
out the latest mips-linux kernel code first (2.4.22 I beleive). Then you
need to use a big endian toolchain.  Mips not Mipsel (ie,
mips-linux-gcc). Then open the arch/mips/defconfig-csb250 file and
modify the CONFIG_CPU_LITTLE_ENDIAN option.  It should be:

CONFIG_CPU_LITTLE_ENDIAN=y

Then continue to build the kernel as you would for little endian. I
think that's all from the kernel standpoint. But, are you using Micromon
to boot the kernel?  By default I think the CSB250 and it's monitor are
built little endian, and you won't be able to use this if you want a BE
kernel.  You need the boot loader to put the Au1500 into BE mode.

Email if you need more details.

Lyle



> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org 
> [mailto:linux-mips-bounce@linux-mips.org] On Behalf Of 
> Prabhakar Kalasani
> Sent: Wednesday, September 24, 2003 10:15 AM
> To: 'linux-mips@linux-mips.org'
> Subject: How to translate Little to Big endian ?
> 
> 
> Hi all,
> I'm trying to port linux-2.4.21 on CSB250 , which is Au1500 
> processor based board, the processor is a Big endian, I have 
> taken PB1500 board as my prototype, but it's used Au1500 
> Little endian. anybody could help me out, what are the 
> changes do i need to change to make a Little endian souce 
> into Big endian source.
> 
> Is anybody worked on Cogent's CSB250 board till.
> 
> Thanks in advance
> Prabhakar
> 

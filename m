Message-ID: <00a601c213cf$8bf56b30$0b01a8c0@w2k30g>
From: "David Christensen" <dpchrist@holgerdanske.com>
References: <20020614115049.16384.qmail@email.com>
Subject: Re: Kernel - arch support(mips)
Date: Fri, 14 Jun 2002 11:15:35 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Cc: Domcan Sami <domca_psg@email.com>
Message-ID: <20020614181535.bh7icH_KB99wSF_eaRKz4UE3kteV1tPDaYCTd8k4YNY@z>

linux-mips@oss.sgi.com:

Domcan Sami <domca_psg@email.com> wrote:
> I am trying to compile a program using a MIPS-LINUX cross compiler
> (gcc). I've set up a connection between my i386 Linux machine and a
> MIPS(RM7000) processor. This is again connected to a WinNT Terminal
> where there should be an output from the MIPS processor.
>
> I have 2 kernels in my Linux machine under the directories:
> 1) /usr/src/linux - kernel version 2.2.14
> 2) /root/kernels/linux - kernel version 2.4.14
>
> I am using a boot image generated from the older kernel for booting.
> The problem is the older kernel doesn't support MIPS architecture.
> What should I do to upgrade my kernel so that it supports MIPS
> architecture & that I'll be able to cross-compile my programs
> properly.

Please provide more information:

1.  What is your target platform -- e.g. make of model of the board or
    computer that has the RM7000 processor on/in it?

2.  Does the target support Linux, does it have a ROM monitor, or is it
    a raw embedded target (e.g. requires crt0)?


David Christensen
dpchrist@holgerdanske.com

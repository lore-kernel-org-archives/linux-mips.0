Message-ID: <00d801bf73c9$32d3b820$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: FPU Emulator (Re: Enhanced 2.2.12 MIPS Kernel Sources  Available)
Date: Thu, 10 Feb 2000 14:06:53 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: "Bradley D. LaRonde" <brad@ltc.com>, linux@cthulhu.engr.sgi.com, linux-mips@fnet.fr
Message-ID: <20000210130653.ySUy-ZLVQCdikq1Ww9jzYdfipIsA6t4IFmuoYoDUWDU@z>

Hey, one reason I wanted to get the code out there
ASAP was to allow someone to do just that!

The bulk of the emulator lives in its own directory,
arch/mips/fpu_emulator, and the arch/mips/kernel/traps.c
hook is very simple.  There are, however, hooks that
need to be put into context switch, kgdb, and signal support
code here and there, and these key off some enhancements
we made to the CPU configuration code (e.g., there is
a mips_cpu data structure with an options field that
indicates the presence or absence of an FPU at
runtime).   In theory, the emulator is capable of executing
kernel FPU instructions and register register references
as well as those from user mode, but it's considerably
more efficient if the kernel knows to reference the simulator
state instead.  The work to merge all this into the SGI 2.3.xx
tree should not be too daunting, but it's not something that
MIPS is likely to take on internally any time soon.

            Regards,

            Kevin K.

-----Original Message-----
From: Bradley D. LaRonde <brad@ltc.com>
To: Kevin D. Kissell <kevink@mips.com>; linux@cthulhu.engr.sgi.com
<linux@cthulhu.engr.sgi.com>; linux-mips@fnet.fr <linux-mips@fnet.fr>
Date: Thursday, February 10, 2000 11:06 AM
Subject: Re: Enhanced 2.2.12 MIPS Kernel Sources Available


>RFC: What about geting the same FPU emulation into SGI's tree?
>
>Regards,
>Brad
>
>----- Original Message -----
>From: "Kevin D. Kissell" <kevink@mips.com>
>To: <linux@cthulhu.engr.sgi.com>; <linux-mips@fnet.fr>
>Sent: Wednesday, February 09, 2000 5:27 PM
>Subject: Enhanced 2.2.12 MIPS Kernel Sources Available
>
>
>> As many of you will have inferred, MIPS Technologies Inc
>> has been working on the MIPS/Linux kernel for the past
>> six months or so, driven by the need for a flexible software
>> platform for valdiation and characterisation of new MIPS
>> processor designs.  Relatively early on, we made the difficult
>> decision not to try to track the SGI Linux repository: It was
>> too unstable, and the SGI activity is driven by a very
>> different set of goals.  We therefore took the 2.2.12
>> kernel sources from kernel.org, and worked from there.
>> I've shared some of our bug findings and fixes with
>> the SGI mailing list, and still more of them with Ralf
>> directly, but a lot of other changes and improvements
>> have been made that will certainly be of interest to readers
>> of this list, particularly those targeting non-SGI platforms.
>>
>> This kernel supports the new generation of 32-bit MIPS
>> CPUs with R4K exception models.  This involved fairly
>> extensive changes to semaphore support and to TLB
>> and cache management routines.  We know it works on
>> the MIPS 4Kc, and with appropriate additions to the
>> table of recognized CPUs in the (revised) CPU probe
>> code, it should run on the IDT 323xx, and Toshiba TX49
>> processor families as well.
>>
>> It includes an integrated FPU emulator that handles
>> the full MIPS FP instruction set, and allows FPU-less
>> CPUs to run standard MIPS/Linux binaries.
>>
>> It contains a number of endianness fixes in the kernel
>> and driver code, and is very stable in both configurations.
>>
>> It contains platform support for the Algorithmics P-5064
>> and MIPS "Atlas" development boards, as well as the
>> SGI Indy.
>>
>> This code is NOT a supported product of MIPS
>> Technologies Inc.   It is being made available on an
>> "as is" basis subject to the ususal GPL.  It should be
>> accessible via anonymous (and blind) FTP for a while at
>> ftp://ftp.mips.com/incoming/linux.mips.src.01.01.tar.gz
>> and is archived on the Paralogos MIPS/Linux web site at
>> http://www.paralogos.com/mipslinux/.  We'd be very interested
>> in any feedback, experimental results, and enhancements
>> that any of you may wish to provide, and I will answer
>> email questions to the extent that my time allows.
>>
>>             Regards,
>>
>>             Kevin K.
>> __
>>
>> Kevin D. Kissell
>> MIPS Technologies European Architecture Lab
>> kevink@mips.com
>> Tel. +33.4.78.38.70.67
>> FAX. +33.4.78.38.70.68
>>
>

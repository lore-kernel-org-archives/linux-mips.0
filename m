Message-ID: <025701bf88e2$c648a7e0$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: FP emulation patch available
Date: Wed, 8 Mar 2000 10:43:23 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Harald Koerfgen <Harald.Koerfgen@home.ivm.de>, "Andrew R. Baker" <andrewb@uab.edu>
Cc: linux-mips@vger.rutgers.edu, linux-mips@fnet.fr, Linux SGI <linux@cthulhu.engr.sgi.com>, "Gleb O. Raiko" <raiko@niisi.msk.ru>
Message-ID: <20000308094323.bYFpmzNSa-Q6HD4c5QS-XRoRds55k3y-ttwMXPeb_W0@z>

Hearald Koerfgen wrote:
>
>On 07-Mar-00 Andrew R. Baker wrote:
>> 
>> 
>> On Tue, 7 Mar 2000, Gleb O. Raiko wrote:
>>> "Bradley D. LaRonde" wrote:
>>> > 
>>> > I would jump right on this but I really need it for 2.3.47+.
>>> > 
>>> > Regards,
>>> > Brad
>>> 
>>> I vote for 2.3 too. It seems 2.2 will vanish soon anyway.
>> 
>> Working on it.
>
>Me too. Compiles and links but doesn't work. I guess the cpu detection doesn't
>work properly for my Mobilon yet. I am actually compiling it for a DECstation
>:-)


It's odd - I'm on at least one of the mailing lists in question, but I missed
part of this thread yesterday - such as Bradley's message, and another
that must have come from someone (Dom?) at Algorithmics.  

Anyway, the my CPU detection would certainly not have worked for
a Mobilon.   But it ought to have worked for a DECstation.  What
CPU does it have?   In addition to the cpu_probe() routine itself,
arch/mips/kernel/cpu_probe.c contains a table that describes the
CPU's that are recognized, and in principle it "knows" all the CPUs
that were recognized by the old assembler code in head.S, plus
a couple more (R4300 and MIPS 4Kc/5Kc).   The problem may
be a CPU that is mis-identified, or it may be that the options in the
table associated with that CPU are incorrectly defined.  Please
let me know what CPU and "PrID" the system has.

            Regards,

            Kevin K.

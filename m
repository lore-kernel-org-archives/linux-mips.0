Subject: Re: Kernel/User Memory Access and Original Sin
Date: Mon, 28 Feb 2000 13:27:02 +0000 (GMT)
In-Reply-To: <010101bf81e6$9c546120$0ceca8c0@satanas.mips.com> from "Kevin D. Kissell" at Feb 28, 2000 01:23:17 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E12PQCX-0001uL-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: "Kevin D. Kissell" <kevink@mips.com>
Cc: Linux/MIPS fnet <linux-mips@fnet.fr>, Linux/MIPS algor <linux-porters@algor.co.uk>, Linux SGI <linux@cthulhu.engr.sgi.com>
Message-ID: <20000228132702.43UzPwGbKoWqqlWSxas31K4vp6VYSyAZ1EDhb6GByyg@z>

> Linux, as written for the x86, goes very heavily for inlining.
> Rather than call specially protected copyin/copyout sorts
> of routines for manipulating user memory, Linux uses inline
> macros (copy_from_user/copy_to_user, etc.) that depend on

Its up to the port how it is done. Most of them are non inline for
x86 for example.

> __access_ok routine, but it is much more heavyweight
> than the old heuristic.  Not only does it need to check the
> virtual address against the process' VMAs, but it needs

Its broken if it does that. The process VMA may change on an SMP box or
during fault handling sleeps.

__access_ok has one purpose. To verify the address range given is entirely
sensible to feed to __copy_*_user. If you have to do handling the complex
way (eg if your cpu design requires it) then __access_ok can just return 1
and the __copy_*_user - inline or out of line - can do all the work.

Received: from mailapp01.imgtec.com ([195.59.15.196]:24276 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993870AbdFEXOT4GAtM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 6 Jun 2017 01:14:19 +0200
Date: Tue, 6 Jun 2017 00:14:03 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 0/9] Instruction emulation fixes
Message-ID: <alpine.DEB.2.00.1706040314270.10864@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20170605231403.1UotVcUvwX7rq59s28p3l3G3IustN9CoNROYT3z-Bs0@z>

Ralf,

 Here is a bunch of instruction emulation fixes and clean-ups, mostly 
though not only affecting branches in the FPU emulator.  The severity of 
failures addressed varies, see the individual patch descriptions for 
details.  These patches have been verified to a varying extent, depending 
on the nature of the individual change, by running the GCC and glibc test 
suites for the MIPS16 o32 little-endian multilib.

 NB I don't know why `checkpatch.pl' complains about the correctly 
line-wrapped commit references with some of these patches.

 Please queue for the next release cycle and backport as noted with each 
of the patches.

 NB there is also an API mismatch between `init_fpu' returning SIGFPE and 
its caller `__compute_return_epc_for_insn', however I can't figure out why 
the incorrect return status is only passed up if NO_R6EMU, so I'm leaving 
it to whoever understands the dependency here to fix up.  Offhand it looks 
to me like the whole containing `!used_math()' conditional is bogus though 
-- we've got an exception in a delay slot of a COP1 branch, so the FPU 
clearly must have been used already or we wouldn't have reached the delay 
slot to trap in in the first place.  For the same reason we do not need to 
check `cpu_has_mips_r6' other than for telling overlapping R6 BC1EQZ and 
MIPS-3D BC1ANY2 minor opcodes apart, which we don't do anyway.

 So more fixes and clean-ups are due around here it would seem.  But this 
is too much for the amount of time I can afford right now, so I'll be 
leaving them for the next opportunity.

  Maciej

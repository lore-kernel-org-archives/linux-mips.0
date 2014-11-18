Received: from relay1.mentorg.com ([192.94.38.131]:56526 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007304AbaKRE4rKDPub (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 18 Nov 2014 05:56:47 +0100
Date: Tue, 18 Nov 2014 04:56:33 +0000
From: "Maciej W. Rozycki" <macro@codesourcery.com>
Subject: Re: MIPS: c-r4k.c: Fix the 74K D-cache alias erratum workaround
In-Reply-To: <546AC366.1070304@imgtec.com>
Message-ID: <alpine.DEB.1.10.1411180400480.2881@tp.orcam.me.uk>
References: <546A56C9.4060608@imgtec.com> <alpine.DEB.1.10.1411172321110.2881@tp.orcam.me.uk> <546A8EB3.3040504@imgtec.com> <alpine.DEB.1.10.1411180039100.2881@tp.orcam.me.uk> <546AC366.1070304@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej_Rozycki@mentor.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20141118045633.hwOl8lBipsK3ebFTnk3bi6Ko8qWV21psZj9ZBHHs9BU@z>

On Tue, 18 Nov 2014, Leonid Yegoshin wrote:

> >   That doesn't appear to have anything to do with ptrace(2) and
> > cache-coherency issues seen around software breakpoints, and the buggy
> > 74K is the only system of all that we have that shows that problem.  And
> > the problem goes away with my fix.  So perhaps MIPS_CACHE_ALIASES is
> > actually needed here, or maybe a more lightweight alternative fix, but
> > an item that addresses HIGHMEM support is clearly irrelevant.
> 
> Again, the 74K errata has deal only if there is two mappings and one of that
> mappings switches to the same physaddr. In other words - TLB change is needed
> (some another conditions are also needed). It has nothing with generic cache
> aliasing. Switching ON cache aliasing support just masks the issue behind
> massive cache flushes.

 For the erratum to trigger do the two mappings absolutely have to go 
through the TLB or can one of them be via the TLB and the other one via 
a fixed mapping by the means of KSEG0?  This will be the case here.

 And I understand what the consequence of setting MIPS_CACHE_ALIASES is, 
but I also insist that correctness is more important than performance, 
so we need to make sure that the kernel performs reliably even if that 
comes at a cost.  And the cost may be higher than necessary at the 
beginning, but that will be the right starting point for further 
improvements.

> If you have problem with ptrace(2) then it points to incorrect result of
> copy_to_user_page(), and most probably - with kmap() work. That HIGHMEM patch
> there takes care about address aliasings, so I assumed I took that case into
> account too but something may changes. I think it has sense to put the check
> of cpu_has_vtag_dcache in copy_to_user_page() - it definitely will enforce
> cache flashing after ptrace() write aka __access_remote_vm(..., true) and it
> doesn't harm the rest of system. And retest.
> 
> But it is needed to do after http://patchwork.linux-mips.org/patch/8459/ fix,
> without it it is futile.

 I think burying fixes for ordinary accesses among HIGHMEM pieces does 
not really help, would you be able to split off pieces relevant for 
non-HIGHMEM configurations, such as those for the 74K workaround, from 
your big change?  I think it would make it easier to get this part 
accepted, and the remaining pieces would then shrink too, also making 
them easier to review and accept.

 Also please note that writing a good change description is important 
for patch acceptance, sometimes it may even be more important than the 
change itself, that can be small, but unobvious.  The reviewer has to be 
able to infer from the explanation and understand what problem the 
change addresses, what the consequences of the change are and why the 
problem has been addressed in this way and not another, possibly down to 
the individual code fragments if necessary.  In my opinion your change 
seems somewhat lacking here I am afraid.

 Consider this like attending an exam where the patch is your solution 
to a problem you have been given to solve: what would you do to persuade 
your examiner to give you a good grade?  Here the patch reviewer is your 
examiner.

 And I have just noticed this 1/8 part is further buried in a series 
supposedly addressing XPA support on r5 cores which has even less to do 
with the 74K and its erratum than it might seem by looking at this 
single part only. :(

> >   Well, I-cache coherency issues around ptrace(2), specifically the
> > PTRACE_POKETEXT request, appear to persist -- how often do you verify
> > your code by getting the GDB test suite run on it (e.g. by your
> > toolchain team)?  Which so far is I believe the best way to trigger any
> > I-cache coherency issues there, and I remember still seeing issues with
> > software breakpoints in heavily threaded code across all processors I
> > could check with (and GDB's Remote Serial Protocol logs indicated they
> > were correctly propagated down to ptrace(2), so it was all up to the
> > kernel to sort out), at least a 24Kc, a 74Kc and an M14Kc.
> > 
> >   Please note that I test using gdbserver with GDB connecting remotely
> > from another system, I don't normally run native testing on these
> > boards, they are too weak for that.  It is an important detail as native
> > testing implies much higher cache pressure (gdbserver is a lightweight
> > agent while GDB itself is a large blob) where incoherent cache lines are
> > much more likely to cure by themselves in the course of line replacement
> > on cache fills.
> 
> Excuse me, I need more detailed instructions "how to", I am not GDB guru.

 Understood, but in this case you'll have to consult your toolchain team 
I am afraid, either to instruct you or to run tests for you.  Running 
the GDB test suite on a remote system is not straightforward (as e.g. 
`make check' would be) and will depend on how your infrastructure has 
been wired.  And I don't know what you have available.  Sorry I couldn't 
help much with this.

  Maciej

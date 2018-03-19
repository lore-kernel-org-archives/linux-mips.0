Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:40238 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992479AbeCSWy7F7VwL (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 19 Mar 2018 23:54:59 +0100
Date: Mon, 19 Mar 2018 22:52:24 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: 3.16.55-stable breaks yeeloong
In-Reply-To: <alpine.DEB.2.00.1803190706520.2163@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1803192231480.2163@tp.orcam.me.uk>
References: <ortvtd4gxf.fsf@lxoliva.fsfla.org> <1521416975.2495.186.camel@decadent.org.uk> <alpine.DEB.2.00.1803190706520.2163@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Alexandre Oliva <lxoliva@fsfla.org>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20180319225224.jldQ258-_crzTuebuXUVeUNgS-pYRH3xxXfeQ3Dc-tI@z>

On Mon, 19 Mar 2018, Maciej W. Rozycki wrote:

> > > Commit 304acb717e5b67cf56f05bc5b21123758e1f7ea0 AKA
> > > https://patchwork.linux-mips.org/patch/9705/ was backported to 3.16.55
> > > stable as 8605aa2fea28c0485aeb60c114a9d52df1455915 and I'm afraid it
> > > causes yeeloongs to fail to boot up.  3.16.54 was fine; bisection took
> > > me to this patch.
[...]
> > Guenter Roeck reported the same problem on QEMU Malta emulation.
> > I haven't yet ivnestigated why this causes breakage.  I will aim to fix
> > this in the next update (will be 3.16.57 now), if necessary by
> > reverting that and whatever depends on it.
> 
>  I'll see if I can trigger it with my development setup and investigate.

 OK, I have been able to reproduce the crash and I can see what is going 
on here: the backport didn't take into account a change from `break' to 
`goto out' required for code in `do_cpu' in that old version and 
consequently `force_sig(SIGILL, current)' is reached whenever the first 
FPU instruction is executed on hard-float hardware, with obvious 
consequences.

 Rather than messing with commit 304acb717e5b ("MIPS: Set `si_code' for 
SIGFPE signals sent from emulation too") though, I suggest cherry-picking 
commit 27e28e8ec47a ("MIPS: Normalise code flow in the CpU exception 
handler"), which was in the original series and which I have verified to 
remove the crash.  I believe it is obvious enough to be considered safe to 
backport.

 Please let me know if you need anything else from me.

  Maciej

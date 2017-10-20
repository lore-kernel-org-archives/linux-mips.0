Received: from 20pmail.ess.barracuda.com ([64.235.154.232]:40090 "EHLO
        20pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990406AbdJTWIPjEuCX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 21 Oct 2017 00:08:15 +0200
Date: Fri, 20 Oct 2017 22:46:44 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH] MIPS: kernel: proc: Remove spurious white space in
 cpuinfo
In-Reply-To: <1508533736.30181.7.camel@perches.com>
Message-ID: <alpine.DEB.2.00.1710202245400.3886@tp.orcam.me.uk>
References: <1508509203-30661-1-git-send-email-aleksandar.markovic@rt-rk.com>  <1508512648.30181.1.camel@perches.com>  <alpine.DEB.2.00.1710202148280.3886@tp.orcam.me.uk> <1508533736.30181.7.camel@perches.com>
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
To: Joe Perches <joe@perches.com>
Cc: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, linux-mips@linux-mips.org, Dragan Cecavac <dragan.cecavac@mips.com>, Aleksandar Markovic <aleksandar.markovic@mips.com>, Douglas Leung <douglas.leung@mips.com>, Goran Ferenc <goran.ferenc@mips.com>, James Hogan <james.hogan@mips.com>, James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org, "Maciej W. Rozycki" <macro@linux-mips.org>, Miodrag Dinic <miodrag.dinic@mips.com>, Paul Burton <paul.burton@imgtec.com>, Paul Burton <paul.burton@mips.com>, Petar Jovanovic <petar.jovanovic@mips.com>, Raghu Gandham <raghu.gandham@mips.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20171020214644.gMLzszGSP09nMKIaZW4MZPyGyyYMUjTRCSpN0vEr1Bg@z>

On Fri, 20 Oct 2017, Joe Perches wrote:

> > > That's somewhat unpleasant code as it formats a fmt string
> > > and the compiler can not verify fmt and args.
> > > 
> > > Perhaps something like the below is preferable:
> > 
> >  Hmm, what problem exactly are you trying to solve with code that has 
> > worked just fine for 16 years now?
> 
> The compiler cannot verify fmt and args.

 You have stated that already.  Why is that a problem?

  Maciej

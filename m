Received: from mailapp01.imgtec.com ([195.59.15.196]:46315 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008792AbbIVTQTTC5ZP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 21:16:19 +0200
Date: Tue, 22 Sep 2015 12:14:24 -0700
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH 0/3] MIPS GIC fixes
Message-ID: <20150922191424.GC29903@NP-P-BURTON>
References: <1442946551-27893-1-git-send-email-paul.burton@imgtec.com>
 <alpine.DEB.2.11.1509222106100.5606@nanos>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.11.1509222106100.5606@nanos>
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Marc Zyngier <marc.zyngier@arm.com>
Message-ID: <20150922191424.EoARZn_dS3tFIUsb1j9y3lBNL_0eRKN_JODD1zY32_o@z>

On Tue, Sep 22, 2015 at 09:07:15PM +0200, Thomas Gleixner wrote:
> On Tue, 22 Sep 2015, Paul Burton wrote:
> 
> > This series fixes a couple of problems with the MIPS GIC support,
> > impacting systems with the 64 bit CM3 and those with multithreading and
> > non-contiguous numbering for VP(E)s across cores.
> > 
> > Paul Burton (3):
> >   MIPS: CM: provide a function to map from CPU to VP ID
> >   irqchip: mips-gic: convert CPU numbers to VP IDs
> >   irqchip: mips-gic: fix pending & mask reads for MIPS64 with 32b GIC
> 
> I assume that's a bugfix scheduled for 4.3.
> 
> Ralf, if so, please ship it through the MIPS tree with my Acked-by for
> the irqchip parts.
> 
> Thanks,
> 
> 	tglx

Hi Thomas,

These are fixes but to the best of my knowledge the only currently
supported system it would break is multicore I6400 on Malta, which only
exists in emulation at the moment. So it's probably not a huge deal to
get this into v4.3. If it's easy though, absolutely go ahead :)

I'll aim to be clearer when submitting future fixes about where they
apply.

Thanks,
    Paul

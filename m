Received: from mailapp01.imgtec.com ([195.59.15.196]:64014 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007810AbcCAC1p47fZ- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 1 Mar 2016 03:27:45 +0100
Date: Tue, 1 Mar 2016 02:27:39 +0000
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH 1/2] MIPS: Add barriers between dcache & icache flushes
Message-ID: <20160301022738.GB12741@NP-P-BURTON>
References: <1456164585-26910-1-git-send-email-paul.burton@imgtec.com>
 <56CBA181.8070606@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <56CBA181.8070606@gmail.com>
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
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, Joshua Kinard <kumba@gentoo.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, "Maciej W. Rozycki" <macro@codesourcery.com>, Markos Chandras <markos.chandras@imgtec.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Message-ID: <20160301022739.A8P2s8FB6NFC3uMqOO5vOWBwvk62rSV90zMl6ypQ5j0@z>

On Mon, Feb 22, 2016 at 04:02:09PM -0800, Florian Fainelli wrote:
> On 22/02/16 10:09, Paul Burton wrote:
> > Index-based cache operations may be arbitrarily reordered by out of
> > order CPUs. Thus code which writes back the dcache & then invalidates
> > the icache using indexed cache ops must include a barrier between
> > operating on the 2 caches in order to prevent the scenario in which:
> > 
> >   - icache invalidation occurs.
> > 
> >   - icache fetch occurs, due to speculation.
> > 
> >   - dcache writeback occurs.
> > 
> > If the above were allowed to happen then the icache would contain stale
> > data. Forcing the dcache writeback to complete before the icache
> > invalidation avoids this.
> 
> Is that also true for CPUs with have cpu_has_ic_fills_dc?

Hi Florian,

Good question. I imagine not, but probably need to think some more & ask
some questions.

Thanks,
    Paul

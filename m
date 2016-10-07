Received: from mailapp02.imgtec.com ([217.156.133.132]:30498 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992226AbcJGPTKxCikZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 7 Oct 2016 17:19:10 +0200
Date: Fri, 7 Oct 2016 16:18:54 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] MIPS: Fix -mabi=64 build of vdso.lds
In-Reply-To: <20161007083858.GK19354@jhogan-linux.le.imgtec.org>
Message-ID: <alpine.DEB.2.00.1610071615090.31859@tp.orcam.me.uk>
References: <a226de28606d340f3e4cf0d6f6f4b4d12e766a69.1475791723.git-series.james.hogan@imgtec.com> <alpine.DEB.2.00.1610062349100.31859@tp.orcam.me.uk> <20161007083858.GK19354@jhogan-linux.le.imgtec.org>
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
To: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20161007151854.VDjksVGThSnVfoSptNzQmLXIAtzkRRaX2vWTlu00jQo@z>

On Fri, 7 Oct 2016, James Hogan wrote:

> >  Also I've noticed $(aflags-vdso) duplicate `-I' and `-E' options already 
> > included with $(ccflags-vdso); I wonder if the duplicates should simply be 
> > removed or whether $(cflags-vdso) ought to filter from $(KBUILD_CFLAGS) 
> > and $(aflags-vdso) -- from $(KBUILD_AFLAGS) instead (or $(ccflags-vdso) 
> > should just take the options from $(KBUILD_CPPFLAGS)).  Also why `-E' is 
> > supposed to take an argument?  Can you please have a look at it?
> 
> I think -E is to catch -EL / -EB.

 Ahh, forgot about the existence of these!

> Removing the duplication is easily
> fixed (I'll post a patch soon). As for whether it should filter from the
> other KBUILD_ flags, I'm inclined to avoid changing it unless we can be
> sure it will be more robust as a result.

 I've only been trying to figure out what Alex might have intended here.  
Obviously given that otherwise the current setup seems to work I tend to 
agree with you in that a simple removal of the duplication is the safest 
path of the least resistance fix.

  Maciej

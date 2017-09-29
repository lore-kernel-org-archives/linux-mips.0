Received: from mailapp01.imgtec.com ([195.59.15.196]:34543 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992618AbdI2XNHwnas6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 30 Sep 2017 01:13:07 +0200
Date: Sat, 30 Sep 2017 00:12:46 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] MIPS: Fix input modify in __write_64bit_c0_split()
In-Reply-To: <20170929161653.GB32161@jhogan-linux.le.imgtec.org>
Message-ID: <alpine.DEB.2.00.1709292354290.12020@tp.orcam.me.uk>
References: <20170919131122.23926-1-james.hogan@imgtec.com> <alpine.DEB.2.00.1709282351210.12020@tp.orcam.me.uk> <20170929161653.GB32161@jhogan-linux.le.imgtec.org>
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
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170929231246.GQVO9D-QPwkejdpgUAsw7a0LnhHQmhFhtRkvvVJ2MvM@z>

On Fri, 29 Sep 2017, James Hogan wrote:

> >  NB you could use DINS on MIPS64r2+ (and `__read_64bit_c0_split' could 
> > use one instruction less; patch posted separately).
> 
> Yes, that did occur to me, but it seemed simpler for this non-critical
> case to use the more compatible sequence (whereas for the equivalent VZ
> guest accessors, which imply R5+, I've used DINS in my not-yet-submitted
> patches).

 It would have to be a separate change anyway, however your observation 
about 32-bit EJTAG/Cache exception handlers clobbering the temporary 
64-bit value made in the other thread also applies here and we have R2 
code variants for other stuff already, so I think it would be a worthwhile 
improvement.

  Maciej

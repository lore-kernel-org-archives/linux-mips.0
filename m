Received: from mailapp01.imgtec.com ([195.59.15.196]:35797 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991119AbdGXMppKYosL convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 24 Jul 2017 14:45:45 +0200
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
Subject: RE: [PATCH v3 11/16] MIPS: math-emu: <MADDF|MSUBF>.<D|S>: Fix NaN
 propagation
Date: Mon, 24 Jul 2017 12:45:33 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B85015D9C3A0F@BADAG02.ba.imgtec.org>
References: <1500646206-2436-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1500646206-2436-12-git-send-email-aleksandar.markovic@rt-rk.com>,<20170724102412.GP6973@jhogan-linux.le.imgtec.org>
In-Reply-To: <20170724102412.GP6973@jhogan-linux.le.imgtec.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Aleksandar.Markovic@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <James.Hogan@imgtec.com>, Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Miodrag Dinic <Miodrag.Dinic@imgtec.com>, Goran Ferenc <Goran.Ferenc@imgtec.com>, Douglas Leung <Douglas.Leung@imgtec.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Burton <Paul.Burton@imgtec.com>, Petar Jovanovic <Petar.Jovanovic@imgtec.com>, Raghu Gandham <Raghu.Gandham@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170724124533.A5ptsY904i-uFHU8P9M-wi71WEw63SJEtz9au6uRlYc@z>

> _______________________________________
> From: James Hogan
> Sent: Monday, July 24, 2017 3:24 AM
> To: Aleksandar Markovic
> Cc: linux-mips@linux-mips.org; Aleksandar Markovic; Miodrag Dinic; Goran Ferenc; Douglas Leung; linux-> kernel@vger.kernel.org; Paul Burton; Petar Jovanovic; Raghu Gandham; Ralf Baechle
> Subject: Re: [PATCH v3 11/16] MIPS: math-emu: <MADDF|MSUBF>.<D|S>: Fix NaN propagation
> 
> On Fri, Jul 21, 2017 at 04:09:09PM +0200, Aleksandar Markovic wrote:
> > From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> >
> > Fix the cases of <MADDF|MSUBF>.<D|S> when any of three inputs is any
> > NaN. Correct behavior of <MADDF|MSUBF>.<D|S> fd, fs, ft is following:
> >
> >   - if any of inputs is sNaN, return a sNaN using following rules: if
> >     only one input is sNaN, return that one; if more than one input is
> >     sNaN, order of precedence for return value is fd, fs, ft
> >   - if no input is sNaN, but at least one of inputs is qNaN, return a
> >     qNaN using following rules: if only one input is qNaN, return that
> >     one; if more than one input is qNaN, order of precedence for
> >     return value is fd, fs, ft
> >
> > The previous code contained handling of some above cases, but not all.
> > Also, such handling was scattered into various cases of
> > "switch (CLPAIR(xc, yc))" statement and elsewhere. With this patch,
> > this logic is placed in one place, and "switch (CLPAIR(xc, yc))" is
> > significantly simplified.
> >
> > The relevant example:
> >
> > MADDF.S fd,fs,ft:
> >   If fs contains qNaN1, ft contains qNaN2, and fd contains qNaN3, fd
> >   is going to contain qNaN3 (without this patch, it used to contain
> >   qNaN1).
> >
> 
> Fixes: e24c3bec3e8e ("MIPS: math-emu: Add support for the MIPS R6 MADDF FPU instruction")
> Fixes: 83d43305a1df ("MIPS: math-emu: Add support for the MIPS R6 MSUBF FPU instruction")
> 

In v4, I will add these lines to commit messages of all MADDF/MSUBF patches from this series.

> > Signed-off-by: Miodrag Dinic <miodrag.dinic@imgtec.com>
> > Signed-off-by: Goran Ferenc <goran.ferenc@imgtec.com>
> > Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> 
> > If backported, I suspect commits:
> > 6162051e87f6 ("MIPS: math-emu: Unify ieee754sp_m{add,sub}f")
> > and
> > d728f6709bcc ("MIPS: math-emu: Unify ieee754dp_m{add,sub}f")
> > in 4.7 will require manual backporting between 4.3 and 4.7 (due to
> > separation of maddf/msubf before that point), so I suppose tagging
> > stable 4.7+ and backporting is best (assuming you consider this fix
> > worth backporting).

I am going to tag all MADDF/MSUBF patches "stable 4.7+" and all MIN/MAX/MINA/MAXA patches "stable 4.3+" in v4.

> > ---
> >  arch/mips/math-emu/dp_maddf.c | 71 ++++++++++++++-----------------------------
> >  arch/mips/math-emu/sp_maddf.c | 69 ++++++++++++++---------------------------
> >  2 files changed, 46 insertions(+), 94 deletions(-)
> ...
> > +     /* handle the cases when at least one of x, y or z is a NaN */
> > +     if (((xc == IEEE754_CLASS_SNAN) || (xc == IEEE754_CLASS_QNAN)) ||
> > +         ((yc == IEEE754_CLASS_SNAN) || (yc == IEEE754_CLASS_QNAN)) ||
> > +         ((zc == IEEE754_CLASS_SNAN) || (zc == IEEE754_CLASS_QNAN))) {
> 
> This condition basically covers all of the cases below. Any particular
> reason not to skip it ...
> > +             /* order of precedence is z, x, y */
> > +             if (zc == IEEE754_CLASS_SNAN)
> > +                     return ieee754dp_nanxcpt(z);
> > +             if (xc == IEEE754_CLASS_SNAN)
> > +                     return ieee754dp_nanxcpt(x);
> > +             if (yc == IEEE754_CLASS_SNAN)
> > +                     return ieee754dp_nanxcpt(y);
> > +             if (zc == IEEE754_CLASS_QNAN)
> > +                     return z;
> > +             if (xc == IEEE754_CLASS_QNAN)
> > +                     return x;
> >               return y;
> 
> ... and make this return conditional on (yc == IEEE754_CLASS_QNAN)?

You are right. I am going to reorganize the code as you suggested in v4.

Regards,
Aleksandar

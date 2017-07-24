Received: from mailapp01.imgtec.com ([195.59.15.196]:57704 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991119AbdGXNgQHPUTz convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 24 Jul 2017 15:36:16 +0200
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
Subject: RE: [PATCH v3 05/16] MIPS: math-emu: <MAX|MAXA|MIN|MINA>.<D|S>: Fix
 quiet NaN propagation
Date: Mon, 24 Jul 2017 13:36:05 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B85015D9C3A72@BADAG02.ba.imgtec.org>
References: <1500646206-2436-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1500646206-2436-6-git-send-email-aleksandar.markovic@rt-rk.com>,<20170721144504.GJ6973@jhogan-linux.le.imgtec.org>
In-Reply-To: <20170721144504.GJ6973@jhogan-linux.le.imgtec.org>
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

Hi, James,

I appreciate your thorough and expeditious review.

> 
> ________________________________________
> From: James Hogan
> Sent: Friday, July 21, 2017 7:45 AM
> To: Aleksandar Markovic
> Cc: linux-mips@linux-mips.org; Aleksandar Markovic; Miodrag Dinic; Goran Ferenc; Douglas Leung; linux-kernel@vger.kernel.org; Paul Burton; Petar Jovanovic; Raghu Gandham; Ralf Baechle
> Subject: Re: [PATCH v3 05/16] MIPS: math-emu: <MAX|MAXA|MIN|MINA>.<D|S>: Fix quiet NaN propagation
> 
> On Fri, Jul 21, 2017 at 04:09:03PM +0200, Aleksandar Markovic wrote:
> > From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> >
> > Fix the value returned by <MAX|MAXA|MIN|MINA>.<D|S>, if both inputs
> > are quiet NaNs. The specifications of <MAX|MAXA|MIN|MINA>.<D|S> state
> > that the returned value in such cases should be the quiet NaN
> > contained in register fs.
> >
> > The relevant example:
> >
> > MAX.S fd,fs,ft:
> >   If fs contains qNaN1, and ft contains qNaN2, fd is going to contain
> >   qNaN1 (without this patch, it used to contain qNaN2).
> >
> 
> Consider adding:
> 
> Fixes: a79f5f9ba508 ("MIPS: math-emu: Add support for the MIPS R6 MAX{, A} FPU instruction")
> Fixes: 4e9561b20e2f ("MIPS: math-emu: Add support for the MIPS R6 MIN{, A} FPU instruction")
> 

Will add in v4 (for all MIN/MAX/MINA/MAXa patches).

> > Signed-off-by: Miodrag Dinic <miodrag.dinic@imgtec.com>
> > Signed-off-by: Goran Ferenc <goran.ferenc@imgtec.com>
> > Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> 
> Consider adding:
> 
> Cc: <stable@vger.kernel.org> # 4.3+

Will add on v4 (for all MIN/MAX/MINA/MAXA patches).

> > ---
> >  arch/mips/math-emu/dp_fmax.c | 8 ++++++--
> >  arch/mips/math-emu/dp_fmin.c | 8 ++++++--
> >  arch/mips/math-emu/sp_fmax.c | 8 ++++++--
> >  arch/mips/math-emu/sp_fmin.c | 8 ++++++--
> >  4 files changed, 24 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/mips/math-emu/dp_fmax.c b/arch/mips/math-emu/dp_fmax.c
> > index fd71b8d..567fc33 100644
> > --- a/arch/mips/math-emu/dp_fmax.c
> > +++ b/arch/mips/math-emu/dp_fmax.c
> > @@ -47,6 +47,9 @@ union ieee754dp ieee754dp_fmax(union ieee754dp x, union ieee754dp y)
> >       case CLPAIR(IEEE754_CLASS_SNAN, IEEE754_CLASS_INF):
> >               return ieee754dp_nanxcpt(x);
> >
> > +     case CLPAIR(IEEE754_CLASS_QNAN, IEEE754_CLASS_QNAN):
> > +             return x;
> 
> couldn't the above...
> 
> > +
> >       /* numbers are preferred to NaNs */
> >       case CLPAIR(IEEE754_CLASS_ZERO, IEEE754_CLASS_QNAN):
> >       case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_QNAN):
> > @@ -54,7 +57,6 @@ union ieee754dp ieee754dp_fmax(union ieee754dp x, union ieee754dp y)
> 
> ... go somewhere around here and fall through to the existing return x
> case?
> 

It could, but at the expense of code clarity and/or logical grouping of special cases,
which after this patch looks like:

               . . .
                 |
  case of both inputs qNaN
                 |
  case of only x input qNaN
                 |
  case of only y input qNaN
                 |
               . . .

If you agree, I suggest keeping the code the same as currently proposed in
this patch, except that the following comments should be added in appropriate
places:

	/*
	 * Quiet NaN handling
	 */
	/* The case of both inputs quiet NaNs */
   . . .
	/* The cases of exactly one input quiet NaN */

Unfortunately, the code segment for handling of sNaN and infinity inputs do
not follow the organization that I proposed. However, I think that my proposal
for case organization is the superior one - therefore I intend to keep it in v4,
unless you tell me not to do so.

Regards,
Aleksandar

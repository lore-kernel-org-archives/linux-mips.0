Received: from mailapp01.imgtec.com ([195.59.15.196]:5941 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6860024AbaGUITkfqtFu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 21 Jul 2014 10:19:40 +0200
Date: Mon, 21 Jul 2014 09:19:31 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH] mips: Remove uneeded line in cmp_smp_finish
Message-ID: <20140721081931.GC30558@pburton-laptop>
References: <1405746604-7737-1-git-send-email-xerofoify@gmail.com>
 <1405771556.18077.5.camel@x220>
 <CAPDOMVgQ-F9Y4AoNfFW-vN0YP10kwYL-GCwkpnXj+zg_UMJ4jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAPDOMVgQ-F9Y4AoNfFW-vN0YP10kwYL-GCwkpnXj+zg_UMJ4jw@mail.gmail.com>
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
To: Nick Krause <xerofoify@gmail.com>
Cc: Paul Bolle <pebolle@tiscali.nl>, ralf@linux-mips.org, Leonid.Yegoshin@imgtec.com, markos.chandras@imgtec.com, Steven.Hill@imgtec.com, linux-mips@linux-mips.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <20140721081931.PgqfECn1PSe7wlbYVUwfPZoAeIsC0fnoeJI4cBsYJOw@z>

On Sat, Jul 19, 2014 at 05:33:16PM -0400, Nick Krause wrote:
> On Sat, Jul 19, 2014 at 8:05 AM, Paul Bolle <pebolle@tiscali.nl> wrote:
> > On Sat, 2014-07-19 at 01:10 -0400, Nicholas Krause wrote:
> >> This patch removes a unneeded line from this file as stated by the
> >> fix me in this file.
> >>
> >> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
> >> ---
> >>  arch/mips/kernel/smp-cmp.c | 2 --
> >>  1 file changed, 2 deletions(-)
> >>
> >> diff --git a/arch/mips/kernel/smp-cmp.c b/arch/mips/kernel/smp-cmp.c
> >> index fc8a515..61bfa20 100644
> >> --- a/arch/mips/kernel/smp-cmp.c
> >> +++ b/arch/mips/kernel/smp-cmp.c
> >> @@ -60,8 +60,6 @@ static void cmp_smp_finish(void)
> >>  {
> >>       pr_debug("SMPCMP: CPU%d: %s\n", smp_processor_id(), __func__);
> >>
> >> -     /* CDFIXME: remove this? */
> >> -     write_c0_compare(read_c0_count() + (8 * mips_hpt_frequency / HZ));
> >
> > That comment ends in a question mark. I wonder why...
> >
> >>  #ifdef CONFIG_MIPS_MT_FPAFF
> >>       /* If we have an FPU, enroll ourselves in the FPU-full mask */
> >
> >
> > Paul Bolle
> >
> If we need it then can I remove the FIx me comment.
> Cheers Nick

That depends: have you verified that we do need it?

I wouldn't feel comfortable with removing either line without someone
first explaining why it isn't necessary and testing the result on a
number of different systems, with varying combinations of csrc-r4k &
cevt-r4k.

I absolutely agree that removing unnecessary code or outdated comments
are both good things, but let's be sure they're unnecessary or outdated
first. Your patch does not make me confident that you've checked either
of those.

Thanks,
    Paul

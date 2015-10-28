Received: from mailapp01.imgtec.com ([195.59.15.196]:19833 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011702AbbJ1SVqAlBCw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 28 Oct 2015 19:21:46 +0100
Message-ID: <56311231.10503@imgtec.com>
Date: Wed, 28 Oct 2015 11:21:37 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [v3, 3/3] MIPS: VDSO: Add implementations of gettimeofday() and
 clock_gettime()
References: <1445417864-31453-1-git-send-email-markos.chandras@imgtec.com>      <5629904A.2070400@imgtec.com>   <20151027144748.GA23785@linux-mips.org> <562FE29C.8040106@imgtec.com>   <562FE678.2030307@gmail.com>    <562FE96C.3070002@imgtec.com>   <562FF05A.508@gmail.com>        <562FF15A.1050507@imgtec.com> <CAOFt0_AFnR0MF2e8rRXhz_wkiGbL2VTFy=AXpcmWTZ9_bYA=VQ@mail.gmail.com>
In-Reply-To: <CAOFt0_AFnR0MF2e8rRXhz_wkiGbL2VTFy=AXpcmWTZ9_bYA=VQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alex Smith <alex@alex-smith.me.uk>, David Daney <ddaney.cavm@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Markos Chandras <markos.chandras@imgtec.com>, linux-mips <linux-mips@linux-mips.org>, Alex Smith <alex.smith@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20151028182137.T28HyfJwHisQCWtvVm2Gqk7bB-K5uXHdnhoq0L0AmMY@z>

On 10/28/2015 03:20 AM, Alex Smith wrote:
> On 27 October 2015 at 20:46, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com> wrote:
>> I believe, until this issue is fixed the R4K only CPU should be excluded
>> from VDSO timing acceleration.
> The VDSO code will currently use the CP0 count whenever the kernel is
> using it as its primary clocksource, aside from the case where RDHWR
> is broken as it is on old QEMUs.

1) I don't see that in code - there is no check that kernel uses 
actually uses R4K clocksource as primary (A), and if kernel uses R4K 
count as a clocksource and later switches to some more precise 
clocksource then there is no change in VDSO gettimeofday handling (B).

2) The fact that MIPS kernel as today uses CP0_COUNT in any core as the 
same clocksource is correct only until first power saving event with CPU 
clock disabled (skipping Octeon). After that it is an incorrect use 
without an accurate synchronization and that synchronization doesn't exist.

And I remember that today kernel uses only CPU0 CP0_COUNT to update 
time... may be wrong, need to check, but that could be a good code.

>
> Maybe I'm missing something but I don't see anything in the generic
> timekeeping code that handles the same clocksource being
> unsynchronised or running at a different rate on different CPUs.

(I would like to skip here the generic timekeeping code capabilities, 
just to restrict a discussion to HW capabilities)

>
> Given that, if you think there is an issue that prevents the VDSO from
> using it then that would surely affect the kernel as well and needs to
> be fixed separately?
>
> If it really is necessary to prevent the VDSO from using a certain
> clocksource even though the kernel is using it, it should be a simple
> matter of setting clocksource.archdata.vdso_clock_mode to
> VDSO_CLOCK_NONE. This is how this patch stops it using the CP0 count
> when RDHWR is broken.

OK, just put kernel-build time check that it is not SMP without GIC 
clocksource or it is Octeon. It would be enough to stop a mess.

- Leonid

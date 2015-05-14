Received: from mailapp01.imgtec.com ([195.59.15.196]:6578 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011186AbbENIpJBgZRw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 14 May 2015 10:45:09 +0200
Date: Thu, 14 May 2015 09:44:59 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH 1/2] MIPS: malta-time: Don't switch RTC to BCD mode
Message-ID: <20150514084130.GE22815@NP-P-BURTON>
References: <1431519473-24049-1-git-send-email-james.hogan@imgtec.com>
 <1431519473-24049-2-git-send-email-james.hogan@imgtec.com>
 <alpine.LFD.2.11.1505131829580.1538@eddie.linux-mips.org>
 <20150513221956.GE7723@jhogan-linux.le.imgtec.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20150513221956.GE7723@jhogan-linux.le.imgtec.org>
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
To: James Hogan <james.hogan@imgtec.com>, "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20150514084459.c912B7_IYwmC6ZcwAbzFmpnnad5wVxWbfvtqsoOUkMQ@z>

On Wed, May 13, 2015 at 11:19:56PM +0100, James Hogan wrote:
> Hi Maciej,
> 
> On Wed, May 13, 2015 at 07:03:51PM +0100, Maciej W. Rozycki wrote:
> > On Wed, 13 May 2015, James Hogan wrote:
> > 
> > > On Malta, the RTC is forced into binary coded decimal (BCD) mode during
> > > init, even if the bootloader put it into binary mode (as YAMON does).
> > > This can result in the RTC seconds being an invalid BCD (e.g.
> > > 0x1a..0x1f) for up to 6 seconds.
> > 
> >  Sigh.  No sooner I had fixed the breakage (with 636221b8 and a fat 
> > comment) it got put back (with a87ea88d).  Even though it's easily 
> > spotted as it breaks the system time (all the fields, including the date 
> > too, not only the seconds!) across a reboot due to YAMON eagerly 
> > switching the mode back.  And that'd be the first item I'd check when 
> > validating a change touching the RTC.
> 
> Indeed, a quick bit of experimentation confirms a discrepancy before
> this patch is applied before YAMON's "date" command and the RTC clock as
> read by Linux (with year, day of month, hour & minute all going 22 -> 16
> (22 == 0x16), and presumably different rates of time depending on which
> mode its in. After this patch it appears to work again as it should.
> 
> >  Is there an actual need to reinitialise the RTC at all?  The RTC 
> > registers are readable, so the current configuration can be obtained, 
> > the RTC driver copes with any valid arrangement, so can any other code 
> > using the clock as a reference.
> > 
> >  YAMON OTOH is not as flexible, its clock management commands expect the 
> > format the monitor itself set the chip to, so I think the kernel has to 
> > respect that (just as it doesn't randomly flip bits in the RTC on x86 
> > PCs for example).
> > 
> >  So unless proven otherwise I'll ask for `init_rtc' to be dropped 
> > altogether
> 
> I suspect it comes down to what U-Boot does with RTC (possibly very
> little), but I'll leave that to you and Paul to discuss.

The reason for init_rtc was touched upon in the commit message for
a87ea88d8f6c (MIPS: Malta: initialise the RTC at boot) but could perhaps
have been clearer. Straight out of reset the RTC may not be running at
all, but the code in estimate_frequencies (note: not the RTC driver)
relies upon the RTC having been started. This was an issue when using
earlier builds of U-boot which didn't touch the RTC at all, and is still
an issue if you do something like load the kernel via a JTAG probe
rather than using U-boot or YAMON. If the kernel doesn't ensure the RTC
is started then it'll just hang in estimate_frequencies waiting for the
UIP bit to change even though it never will. YAMON isn't the only way to
boot on Malta, and dependencies such as this between the kernel & the
bootloader should really be minimised.

> > and any changes required made to `estimate_frequencies' 
> > instead.  Which I believe you already did with 2/2.
> 
> As long as the mode doesn't get changed, my change to
> estimate_frequencies() should be happy enough. Before patch 2/2 it only
> reads UIP flag to try to time a single second, so it shouldn't have
> cared about such details as the RTC mode.

...and since it seems the U-boot & YAMON RTC drivers use it in different
modes, I'd consider this patch reasonable. Feel free to have my:

  Reviewed-by: Paul Burton <paul.burton@imgtec.com>

Thanks,
    Paul

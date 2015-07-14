Received: from mailapp01.imgtec.com ([195.59.15.196]:30410 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009261AbbGNIfq1L-lx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Jul 2015 10:35:46 +0200
Date: Tue, 14 Jul 2015 09:35:39 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH v2 10/19] MIPS: asm: mips-cm: Extend CM accessors for
 64-bit CPUs
Message-ID: <20150714083539.GF2519@NP-P-BURTON>
References: <1436434853-30001-11-git-send-email-markos.chandras@imgtec.com>
 <1436861652-2063-1-git-send-email-markos.chandras@imgtec.com>
 <20150714083019.GD2519@NP-P-BURTON>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20150714083019.GD2519@NP-P-BURTON>
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
To: Markos Chandras <markos.chandras@imgtec.com>
Cc: linux-mips@linux-mips.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Andrew Bresticker <abrestic@chromium.org>
Message-ID: <20150714083539.k_UA2uVBeBj9gA_bM-62yU-WKRSoRG2y8AkeOfLCnto@z>

On Tue, Jul 14, 2015 at 09:30:19AM +0100, Paul Burton wrote:
> On Tue, Jul 14, 2015 at 09:14:12AM +0100, Markos Chandras wrote:
> > Previously, the CM accessors were only accessing CM registers as u32
> > types instead of using the native CM register with. However, newer CMs
> > may actually be 64-bit on MIPS64 cores. Fortunately, current 64-bit CMs
> > (CM3) hold all the useful configuration bits in the lower half of the
> > 64-bit registers (at least most of them) so they can still be accessed
> > using the current 32-bit accessors.
> > 
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Jason Cooper <jason@lakedaemon.net>
> > Cc: Andrew Bresticker <abrestic@chromium.org>
> > Cc: Paul Burton <paul.burton@imgtec.com>
> > Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> > ---
> > Changes since v1
> > - Use 32-bit CM I/O on 32-bit kernels
> 
> A concern I have, but haven't yet drank enough coffee to think through
> fully, is whether this will work on big endian systems. These are 64b
> addresses and you're writing 32b to their addresses which I suspect may
> go horribly wrong.

Should be:

"These are 64b registers and you're writing 32b to their addresses"

Apparently I haven't drunk enouugh coffee to formulate sentences yet
either ;)

Thanks,
    Paul

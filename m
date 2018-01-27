Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:36431 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990400AbeA0JS2ZSV55 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 27 Jan 2018 10:18:28 +0100
Date: Sat, 27 Jan 2018 09:15:40 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [for-4.15] ssb: Disable PCI host for PCI_DRIVERS_GENERIC
Message-ID: <20180127091540.GB21356@jhogan-linux.mipstec.com>
References: <20180115211714.24009-1-jhogan@kernel.org>
 <20180116191636.6B3E5605A4@smtp.codeaurora.org>
 <m2bmhfsm6v.fsf@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <m2bmhfsm6v.fsf@linux-m68k.org>
Return-Path: <James.Hogan@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, Michael Buesch <m@bues.ch>, linux-wireless@vger.kernel.org, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Guenter Roeck <linux@roeck-us.net>
Message-ID: <20180127091540.31_Oks25zXcyOyA07lCH90uef2VS8-A1bXBBmNRKjss@z>

On Sat, Jan 27, 2018 at 10:08:56AM +0100, Andreas Schwab wrote:
> On Jan 16 2018, Kalle Valo <kvalo@codeaurora.org> wrote:
> 
> > 58eae1416b80 ssb: Disable PCI host for PCI_DRIVERS_GENERIC
> 
> That breaks wireless on PowerMac!  There is nothing MIPS-specific about
> SSB.

Yes, really sorry about that. There is a patch here:
https://patchwork.kernel.org/patch/10185397/

Cheers
James

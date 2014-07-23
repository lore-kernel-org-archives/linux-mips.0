Received: from mailapp01.imgtec.com ([195.59.15.196]:19940 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6816417AbaGWGrH6k9FY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Jul 2014 08:47:07 +0200
Date: Wed, 23 Jul 2014 07:46:57 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: smp-cmp.c: CDFIXMES
Message-ID: <20140723064657.GK30558@pburton-laptop>
References: <CAPDOMVjNyAwo53Coz8MFuUs70M7j1e3QWprus5vGpTfAw=hspg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAPDOMVjNyAwo53Coz8MFuUs70M7j1e3QWprus5vGpTfAw=hspg@mail.gmail.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, John Crispin <blogic@openwrt.org>, markos.chandras@imgtec.com, Steven.Hill@imgtec.com, Linux-MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <20140723064657.8uiHyPWFi7wwn9pVQyo1UlC3fM9wWLgW6Mgz3EOKOL0@z>

On Wed, Jul 23, 2014 at 12:40:59AM -0400, Nick Krause wrote:
> Are the lines with  CDFIXME still needed? If not please tell me as I
> will send in a patch removing these
> two from this file in order to help you guys out :).
> Cheers Nick

Hi Nick,

I imagine the only answer any of us can give you is "we don't know". If
we did then we'd have removed the code or the comments already.

Please do note that the smp-cmp.c file lives behind a Kconfig option
that is now marked as deprecated, and that there is other work going on
in areas related to clocksource & clock events on the applicable
systems. So whilst someone could spend the time figuring out whether
those lines are useful, I expect that cleaning up these old FIXMEs is
not a particularly high priority for anyone right now.

If you'll leave them alone for a while I expect they'll disappear one
way or another in a few cycles time, along with the rest of the file.

Thanks,
    Paul

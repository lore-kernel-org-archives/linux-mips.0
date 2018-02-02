Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:58482 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990477AbeBBRmDf7DK7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Feb 2018 18:42:03 +0100
Date: Fri, 2 Feb 2018 17:38:00 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH RFC 3/6] MIPS: BMIPS: Avoid referencing CKSEG1
In-Reply-To: <1516758426-8127-4-git-send-email-f.fainelli@gmail.com>
Message-ID: <alpine.DEB.2.00.1802012034400.4191@tp.orcam.me.uk>
References: <1516758426-8127-1-git-send-email-f.fainelli@gmail.com> <1516758426-8127-4-git-send-email-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@linux-mips.org, Florian Fainelli <florian.fainelli@broadcom.com>, Ralf Baechle <ralf@linux-mips.org>, Kevin Cernekee <cernekee@gmail.com>, James Hogan <jhogan@kernel.org>, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, Huacai Chen <chenhc@lemote.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcin Nowakowski <marcin.nowakowski@mips.com>, Andrew Morton <akpm@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>, Ingo Molnar <mingo@kernel.org>, David Howells <dhowells@redhat.com>, Kees Cook <keescook@chromium.org>, Thomas Meyer <thomas@m3y3r.de>, Bryan O'Donoghue <pure.logic@nexus-software.ie>, Robin Murphy <robin.murphy@arm.com>, Michal Hocko <mhocko@suse.com>, Lucas Stach <l.stach@pengutronix.de>, Vladimir Murzin <vladimir.murzin@arm.com>, Bart Van Assche <bart.vanassche@sandisk.com>, open list <linux-kernel@vger.kernel.org>
Message-ID: <20180202173800.f7wVFFiHwdX3F-uM_xPawthApRvy7-g94i9mCt91VeQ@z>

On Tue, 23 Jan 2018, Florian Fainelli wrote:

> bmips_smp_movevec() references the CKSEG1 constant, which is about to be
> updated in order to support processors that might enable eXtended
> KSEG0/1. In doing so, we will generate a reference to a function, which
> is obviously not permissible within assembly. Fortunately,
> bmips_smp_movevec() is only used on BMIPS4350 which does not support
> eXtended KSEG0/1.

 Can you please avoid replacing the macro with a hardcoded magic number 
though, so that it retains the high-level meaning?

 Define another macro, say MIPS_ARCH_CKSEG1, and use it here instead, and 
possibly elsewhere too.  You could complement it with BMIPS_XKS01_CKSEG1 
if necessary too (I haven't thoroughly looked through your patches).

  Maciej

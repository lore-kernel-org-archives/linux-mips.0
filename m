Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:39001 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992121AbeCSHRZU13ar (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 19 Mar 2018 08:17:25 +0100
Date: Mon, 19 Mar 2018 07:16:54 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: 3.16.55-stable breaks yeeloong
In-Reply-To: <1521416975.2495.186.camel@decadent.org.uk>
Message-ID: <alpine.DEB.2.00.1803190706520.2163@tp.orcam.me.uk>
References: <ortvtd4gxf.fsf@lxoliva.fsfla.org> <1521416975.2495.186.camel@decadent.org.uk>
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
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Alexandre Oliva <lxoliva@fsfla.org>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20180319071654.pxHmEcmurbS5yNgBmqD3H9lm2Zi4nltZmze7O4Y80Ic@z>

On Sun, 18 Mar 2018, Ben Hutchings wrote:

> > Commit 304acb717e5b67cf56f05bc5b21123758e1f7ea0 AKA
> > https://patchwork.linux-mips.org/patch/9705/ was backported to 3.16.55
> > stable as 8605aa2fea28c0485aeb60c114a9d52df1455915 and I'm afraid it
> > causes yeeloongs to fail to boot up.  3.16.54 was fine; bisection took
> > me to this patch.
> > 
> > The symptom is a kernel panic -- attempt to kill init.  No further info
> > is provided.
> > 
> > Is this problem already known?  Is there by any chance a known fix for
> > me to try, or should I investigate further?
> 
> Guenter Roeck reported the same problem on QEMU Malta emulation.
> I haven't yet ivnestigated why this causes breakage.  I will aim to fix
> this in the next update (will be 3.16.57 now), if necessary by
> reverting that and whatever depends on it.

 I'll see if I can trigger it with my development setup and investigate.

  Maciej

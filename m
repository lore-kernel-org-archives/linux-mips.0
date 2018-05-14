Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:52089 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992684AbeENW4R4ohOU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 15 May 2018 00:56:17 +0200
Date: Mon, 14 May 2018 23:56:01 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH 1/2] MIPS: memset.S: EVA & fault support for
 small_memset
In-Reply-To: <20180416202234.GA23881@saruman>
Message-ID: <alpine.DEB.2.00.1805142329120.10896@tp.orcam.me.uk>
References: <1522315704-31641-1-git-send-email-matt.redfearn@mips.com> <1522315704-31641-2-git-send-email-matt.redfearn@mips.com> <20180416202234.GA23881@saruman>
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
To: James Hogan <jhogan@kernel.org>
Cc: Matt Redfearn <matt.redfearn@mips.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, stable@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20180514225601.66wArDnDKRzBM4cN2jfLWLKlloBZom8QtIZqu7Iu6g8@z>

On Mon, 16 Apr 2018, James Hogan wrote:

> > @@ -260,6 +260,11 @@
> >  	jr		ra
> >  	andi		v1, a2, STORMASK
> 
> This patch looks good, well spotted!
> 
> But whats that v1 write about? Any ideas? Seems to go back to the git
> epoch, and $3 isn't in the clobber lists when __bzero* is called.

 You need to dive deeper, that is beyond the secret commit 66f0a432564b 
("Add resource managment."), to find what's happened before the epoch. ;)

 Anyway, there isn't anything special here, the thing has been here since 
the inception of memset.S with commit 2e0f55e79c49 (no shortlog available 
for that one).  And it is clearly a bug, possibly just a leftover from a 
WIP implementation or whatever.

 And I can see Matt has already fixed that, thanks!

  Maciej

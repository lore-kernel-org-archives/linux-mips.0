Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:40723 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990400AbeEXQvjeXaDf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 24 May 2018 18:51:39 +0200
Date: Thu, 24 May 2018 17:51:25 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH] MIPS: ptrace: Fix PTRACE_PEEKUSR requests for 64-bit
 FGRs
In-Reply-To: <20180524125959.GB24269@jamesdev>
Message-ID: <alpine.DEB.2.00.1805241749320.10896@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1805161306260.10896@tp.orcam.me.uk> <20180524125959.GB24269@jamesdev>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Message-ID: <20180524165125.JcC7e2DhnhQsMkBV5n_z70W6PIQVgFcmzGt_tgTIR4o@z>

On Thu, 24 May 2018, James Hogan wrote:

> > Use 64-bit accesses for 64-bit floating-point general registers with 
> > PTRACE_PEEKUSR, removing the truncation of their upper halves in the 
> > FR=1 mode, caused by commit bbd426f542cb ("MIPS: Simplify FP context 
> > access"), which inadvertently switched them to using 32-bit accesses.
> > 
> > The PTRACE_POKEUSR side is fine as it's never been broken and continues 
> > using 64-bit accesses.
> > 
> > Cc: <stable@vger.kernel.org> # 3.19+
> 
> should that be 3.15+?

 Indeed, I must have used the wrong result; thank you for catching this!

  Maciej

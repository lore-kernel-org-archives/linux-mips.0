Received: from mailapp01.imgtec.com ([195.59.15.196]:8812 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992111AbdBWPh7nUBuR (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 Feb 2017 16:37:59 +0100
Date: Thu, 23 Feb 2017 15:37:39 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] MIPS: End spinlocks with .insn
In-Reply-To: <dea55f438343246636ca4b033cd8cdfef5f45b0d.1487861280.git-series.james.hogan@imgtec.com>
Message-ID: <alpine.DEB.2.00.1702231536580.26999@tp.orcam.me.uk>
References: <dea55f438343246636ca4b033cd8cdfef5f45b0d.1487861280.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Paul Burton <paul.burton@imgtec.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Message-ID: <20170223153739.N6V4wIkI41hhCtXVfOGGFoVku9ucsPPQKsINzd5qmAk@z>

On Thu, 23 Feb 2017, James Hogan wrote:

> ---
>  arch/mips/include/asm/spinlock.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Maciej W. Rozycki <macro@imgtec.com>

  Maciej

Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:59144 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990723AbeBZUInt90Ys (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Feb 2018 21:08:43 +0100
Date: Mon, 26 Feb 2018 20:05:20 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH 1/4] MIPS: Introduce isa-rev.h to define MIPS_ISA_REV
In-Reply-To: <1519664565-10955-2-git-send-email-matt.redfearn@mips.com>
Message-ID: <alpine.DEB.2.00.1802261957350.3553@tp.orcam.me.uk>
References: <1519664565-10955-1-git-send-email-matt.redfearn@mips.com> <1519664565-10955-2-git-send-email-matt.redfearn@mips.com>
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
To: Matt Redfearn <matt.redfearn@mips.com>
Cc: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Paul Burton <paul.burton@mips.com>, linux-kernel@vger.kernel.org
Message-ID: <20180226200520.23FvYyiwRIPt-2vADuLQBJY0u58mIQO4TvAOALUsLaM@z>

On Mon, 26 Feb 2018, Matt Redfearn wrote:

> +/* If the compiler has defined __mips_isa_rev, believe it. */
> +#ifdef __mips_isa_rev
> +#define MIPS_ISA_REV __mips_isa_rev
> +#else
> +/* The compiler hasn't defined the isa rev so assume it's MIPS I - V (0) */
> +#define MIPS_ISA_REV 0
> +#endif

 FYI, GCC has this:

/* The ISA revision level.  This is 0 for MIPS I to V and N for
   MIPS{32,64}rN.  */
int mips_isa_rev;

and this:

      if (mips_isa < 32)
	mips_isa_rev = 0;
      else
	mips_isa_rev = (mips_isa & 31) + 1;

and then:

      if (mips_isa_rev > 0)						\
	builtin_define_with_int_value ("__mips_isa_rev",		\
				       mips_isa_rev);			\

so your proposal looks like the right approach to me.  I think we should 
have the various target macros documented in the GCC manual.

Reviewed-by: Maciej W. Rozycki <macro@mips.com>

  Maciej

Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5DE1A5B8B;
	Thu,  5 Feb 2026 01:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770254801; cv=none; b=aAza+f87qgdR2Jt05KsKh7JKIRibpkqwarVhopzEX8Kw1olV5TU32oK3lamiGtlQK0DVZUEPCfQd/cfejZPjwMpv09U5BAAOSYsjke2jRfDb6lihBkkIOy/rzdf3c2YfnlwhmV5BUzHrT1MziV1ZsTUbG4Rd1IOAOofYXloIUWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770254801; c=relaxed/simple;
	bh=sf82TcBq9fxxRcRPGqMm/UuledHRNRfbLaDgEbbES2g=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nrvYIPzlUDOyLbLebAIXvPWWA1lJhVw9a3EM+vffg+i3KuB0UkaP0T4zHfee209A4e/Dvc2vERZye6N1PQR7smOIBLqkAkz9zWXqfWFyO1kCpk/wSwbI9aWia7vBqONX8LKFvXeaARcYHwIts++1O8HRYYLKvhWWfqECSnxaIqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id EB85F92009C; Thu,  5 Feb 2026 02:26:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E565B92009B;
	Thu,  5 Feb 2026 01:26:39 +0000 (GMT)
Date: Thu, 5 Feb 2026 01:26:39 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Yao Zi <me@ziyao.cc>
cc: Nathan Chancellor <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: tools: relocs: Ship a definition of R_MIPS_PC32
In-Reply-To: <aYFx5L2xC_u9t0IN@pie>
Message-ID: <alpine.DEB.2.21.2602050110020.17548@angie.orcam.me.uk>
References: <20260202041610.61389-1-me@ziyao.cc> <99c54e93-fb8c-4bdb-ad40-a3161a42bb8b@app.fastmail.com> <20260202230729.GA2319189@ax162> <aYFx5L2xC_u9t0IN@pie>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Feb 2026, Yao Zi wrote:

> > I interpret that to mean that the kallsyms patch should work fine since
> > the toolchain can handle these relocations? It is just building the
> > relocs tool against an older glibc or musl that does not have the
> > R_MIPS_PC32 definition that is broken? Or am I misunderstanding
> > something?
> 
> Yes, this patch is only meant to fix building of relocs tool. I don't
> think there are problems about toolchain supporting since R_MIPS_PC32
> has been in binutils for a long time, as Nathan found, since 2004. The

 Since Y2K to be exact:

commit bb2d6cd7b19cd82313963d2d878a94e6e85a38b6
Author: Geoffrey Keating <geoffk@geoffk.org>
Date:   Sat Mar 11 02:16:25 2000 +0000

[...]
    In include/elf:
    	* mips.h: Add R_MIPS_GNU_REL_HI16, R_MIPS_GNU_REL_LO16,
     	R_MIPS_GNU_REL16_S2, R_MIPS_PC64 and R_MIPS_PC32 relocation
     	numbers.

> situation is that it's likely to have a toolchain supporting
> R_MIPS_PC32, while elf.h on the build machine doesn't have its
> definition. And after ff79d31eb536 ("mips: Add support for PC32
> relocations in vmlinux"), the relocs tool started to require a
> definition of R_MIPS_PC32 to build.

 But where does ff79d31eb536 come from?  I can't see it on Linus's master 
and you can't refer an SHA-1 ID from another repo in a 'Fixes:' tag AFAIK, 
as it's going to change as a commit is merged.  Also can't you get the fix 
folded into the offending commit since it hasn't been merged yet?

  Maciej

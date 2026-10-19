Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53D84D3BCD;
	Mon, 19 Oct 2026 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421249; cv=none; b=tE02lv9Xt5jwgKRL1Zx0hIxzY7MFa49Mh8Uq2vnIP0bgJ7NbbVRYiW07Jm34SQr5UNrkWlUxTdqA0Fo5/7jabe7ck6mWtg1Fbr3YJxrAf0T2+eogZNFrtG5vC3I79JHtmYUh1kDXq2Uyhf4z22khU7VNCcz/v4wnSriH0oUDKjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421249; c=relaxed/simple;
	bh=wa+AB+JwBf4lseh+KdTvi7s33LG5JHO95vnSbetQA4M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PIKs+MQjA6Ow3fm+cXzZGcOKnUj9/5xPqDcAfZkr6B7KWv9KIzJLT55nfQZ8Jf9eWTAosHToAWs3FOTG4ptsP6a5VCrTLVt5koFuG6b5zrULgjMwazibOomwU5KvnHbdoFRGFZ8QlcAWbC3LDDuqk3DbbtdogJwaUuEdB3BFV1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 7C24192009C; Mon, 19 Oct 2026 16:47:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 761D092009B;
	Mon, 19 Oct 2026 15:47:24 +0100 (BST)
Date: Mon, 19 Oct 2026 15:47:24 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
cc: kernel test robot <lkp@intel.com>, Rosen Penev <rosenp@gmail.com>, 
    linux-mips@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: lib: prefetch ahead in csum_partial()
In-Reply-To: <CAMuHMdVoAthYZFzuMmVb8awHUia4xeEfFKK=1PA23iCV0SsFbw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2610191519120.22065@angie.orcam.me.uk>
References: <20261010065442.23780-1-rosenp@gmail.com> <202610131201.wWk11MLy-lkp@intel.com> <alpine.DEB.2.21.2610190013300.22065@angie.orcam.me.uk> <CAMuHMdVoAthYZFzuMmVb8awHUia4xeEfFKK=1PA23iCV0SsFbw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Geert,

> >  So oddly enough we're missing Tx49 support in the toolchain and we've
> > only managed to survive with CPU_HAS_PREFETCH enabled for CPU_TX49XX
> > because it also implies DMA_NONCOHERENT via MACH_TX49XX -> MACH_TXX9,
> > which in turn disables stuff in arch/mips/lib/memcpy.S.
> >
> >  Quite straighforward to fix in binutils since docs are available (as in:
> > I have a copy), but do we have any users?  Geert?
> 
> Yes, I still boot test rbtx4927 regularly.

 Thanks for confirming.

> I never touched binutils sources, though...

 No worries, this seems straightforward: just PREF, MADD/U plus [D]MULT/U 
extensions, and DERET/SDBBP debug stuff, much of which shared with the 
Tx39 we already support, so just a matter of sticking another flag onto 
the existing opcode table entries.

 I'd estimate it as one day worth of engineering effort plus maybe another 
one for machines to work through verification, for the binutils side and 
the associated changes needed for GCC, i.e. a `-march=' option update plus 
maybe enabling a couple of existing machine description patterns for the 
Tx49 too.  Would you be able to run GCC verification with your system?

 So I guess I could squeeze this in after the oustanding Allegrex support 
review, hopefully to start this week.

  Maciej

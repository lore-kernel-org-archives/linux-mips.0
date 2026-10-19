Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792439929;
	b=QOnEsdYkMSEo9DGfwGLrmUz+pGJyv7BJPuApodSPLRC2/1x1UN0E9c3hm7qPtNAkFWBo
	 W4gD20uj4Gz8dxXmAY0v2/1IgdStGuzm+g6q+t4BBc32Ktu4g3xqmOZGMQ9hp4P8H8F01
	 8Rake5K3nHowTLDi7eYKSc03roLM+JscSpq8DZv1B1fSIdPwVqmsTUyfTsHHizpQc/OOB
	 HgCaF5RXFB8Ij5lhhOpEurbzwKWhanlq60KRSODcOsEDWWj1nS/TunIUqakTrwvg+A0M0
	 XAnCGOEzavHYHy8JOPw/ImefBULTzqPOxQWz6Te0VEQ3yt1RVFRv0ftg+ck9Vxqe3Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792439929;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=ErgWcZmMTaBLQFpV5lxLifZbUpY+cx+TKNxtxNPZQl4=;
	b=pAZGA/wV0aKsENaXpAQZ8VtDqjYnT09CPVtkPGFGBdokj920lf6wD6IsY1biBkZ6QeLt
	 7GkMgntR4z70Rd7m0v5KlF8Q13r7RcGgXUZ6g7/Vd4fM0swC8Dl5+QQ5+to9yLYMR2pfD
	 E8lgV7MVe03zAcIScJ4TZU0vPyk6DbeubH6Um8mcTRxlSvzugrjvUB8z5OpqqPx2RAtwx
	 cpIbpcpSjxKEeL8BK4nLKy+CId6jJq2gwk4ZBmDmGZO8W7F1qXZ9LtgQ7ywfbFiqs9GgN
	 zDADX4xokfcgbcDh4rwprFu79OcFpNKcnqDKmr2L51Vdn5U7++N9vNMc2HTICk/WZeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565E7606A319;
	Mon, 19 Oct 2026 19:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 565E7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 4EA1E92009C; Mon, 19 Oct 2026 21:58:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 477C492009B;
	Mon, 19 Oct 2026 20:58:41 +0100 (BST)
Date: Mon, 19 Oct 2026 20:58:41 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
cc: kernel test robot <lkp@intel.com>, Rosen Penev <rosenp@gmail.com>, 
    linux-mips@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: lib: prefetch ahead in csum_partial()
In-Reply-To: <CAMuHMdXCKXN5PiDwRJiEj9aBGcU0J+H=q5tQoO7OfPEboCWGJg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2610192009000.22065@angie.orcam.me.uk>
References: <20261010065442.23780-1-rosenp@gmail.com> <202610131201.wWk11MLy-lkp@intel.com> <alpine.DEB.2.21.2610190013300.22065@angie.orcam.me.uk> <CAMuHMdVoAthYZFzuMmVb8awHUia4xeEfFKK=1PA23iCV0SsFbw@mail.gmail.com> <alpine.DEB.2.21.2610191519120.22065@angie.orcam.me.uk>
 <CAMuHMdXCKXN5PiDwRJiEj9aBGcU0J+H=q5tQoO7OfPEboCWGJg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Geert,

> >  I'd estimate it as one day worth of engineering effort plus maybe another
> > one for machines to work through verification, for the binutils side and
> > the associated changes needed for GCC, i.e. a `-march=' option update plus
> > maybe enabling a couple of existing machine description patterns for the
> > Tx49 too.  Would you be able to run GCC verification with your system?
> 
> The rbtx4927 is about the slowest system I still do regular testing on.

 Speed is of no essence, I've recently run regression-testing with a R3k 
DECstation, a VAXstation (with NetBSD), and previously, as a day job, with 
a crippled ARM board well below the capabilities of the former systems.  
Depending on the components chosen and the amount of breakage triggered by 
the tests themselves (timeouts!) it could take from several hours to a few 
days.

> It uses a Debian 8 nfsroot (over 10 Mbps Ethernet), which is the latest
> Debian release still supporting the instruction subset suppported
> by TX49XX.

 I run most of my target systems NFS-rooted as well (over 100Mbps FDDI for 
a change).  Little is required from the target environment: an SSH server 
and a POSIX shell, and then either an NFS client for direct build system 
access or rsync for remote sysroot maintenance (in which case `rm' command 
is needed too to discard test cases copied over, once executed).

> So as long as no native compilation of large packages is required,
> it can be done.  I can also give you remote access?

 There is no native compilation at all, only remote execution over SSH, 
driven from the build system by DejaGNU.

 As for remote access, that would be an option, perhaps an easy one since 
I've done it before with someone else, as long as you can offer temporary 
storage for the sysroot to operate the target system with (~225MiB for 
o32, ~285MiB for n64, indicative) and some network bandwidth.

  Maciej

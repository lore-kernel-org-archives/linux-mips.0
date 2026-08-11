Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9C52737FC
	for <linux-mips@vger.kernel.org>; Tue, 11 Aug 2026 12:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786452431; cv=none; b=AydxB1dCJbOJwTVFN2OJwraQryGX+VdnOjwWRNW8lwzBapYuNwEmhb7AMR1Kj/WZXvyJiu5UgOsO4zDxPu9GVnPX9E+itBu3cx5W1go1jWXTMfFFDskAW8GAEqM4gqKl3BXu82k2MoKSG43qiukxrn+go7E6zU9s5SU5tYrESwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786452431; c=relaxed/simple;
	bh=yciTQ+E9sMRXgpOZTjiaRRQAcfADv6Ssuq36wFLpKGE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=o1oOzMbPiWqyxK9pxe9KLssiL80Bh89rp7Mlww8S5PyNJRHpP1+VRQBI9i1KQkKBO5E/R933ep39vT1F+FzIsCvKutowMqcBku4I3P9LXUKrFajmKWEkgFBQHl6uobdYH2boEJnCW+lCXlDRwpqTvkvp5XrNdMmq3mwGDWLLPu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 68AF692009C; Tue, 11 Aug 2026 14:47:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 63C1992009B;
	Tue, 11 Aug 2026 13:47:07 +0100 (BST)
Date: Tue, 11 Aug 2026 13:47:07 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Randy Dunlap <rdunlap@infradead.org>
cc: linux-mips@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: mips randconfig builds?
In-Reply-To: <85609635-09af-4aa2-82ae-f022ee20264d@infradead.org>
Message-ID: <alpine.DEB.2.21.2608111241300.48788@angie.orcam.me.uk>
References: <85609635-09af-4aa2-82ae-f022ee20264d@infradead.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Aug 2026, Randy Dunlap wrote:

> I do lots of randconfig builds but I don't have a reliable way to
> specify mips 32BIT or mips 64BIT builds.

 How is the MIPS port different from other dual-wordsize ones, such as 
RISC-V?

 Can you just grep .config resulting for 32BIT/64BIT and assign the build 
accordingly?

 One target toolchain will handle both, so there is no need to know that 
in advance of `make randconfig' invocation (one advantage of not linking 
libgcc.a or any other target libraries is there's no need for multilibs).

  Maciej

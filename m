Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45B43C1400;
	Thu,  2 Jul 2026 10:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989199; cv=none; b=mOi1olyGIeZWKSwYDPPVCrynaiD0IoSJvOpm36Js/wnBi4k/m445YQgej6sMmOf0pOrYKdS7mC3snoWhDh5NGNnx5HQbJwXP1vM3S4FoT5efvPjJAvn7ratwO70B13U4VTLHZAq7DejiwpqT1oz/OmFsl2YsItzrpuCsEv/ca18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989199; c=relaxed/simple;
	bh=T/VYdxO+cFellJCBE9JnSRCYAC/tFqM8jVDZEPBwSFU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RS0iaWfpUQbSihUjkrTjN+oeQYW8jXnRYxGtFHn4rBSRRBAjm0NlAk8tNnS8LJfIyRhjChCGomT5J5000Gpsl36HcAIN3AQ9wHXXEZY3O5MqMd/IKTVr0o50waIKRbc/gwl5ITIo3KpFDSrQFvFFDvpDm0G9+ZRqpwAEyk5riuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id AD1B992009C; Thu,  2 Jul 2026 12:38:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id A9F5D92009B;
	Thu,  2 Jul 2026 11:38:59 +0100 (BST)
Date: Thu, 2 Jul 2026 11:38:59 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Stefan Wiehler <stefan.wiehler@nokia.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v2] mips: mm: Call rcutree_report_cpu_starting() even
 earlier
In-Reply-To: <18fdaf3e-a957-4d9e-bc29-3c570d50f482@nokia.com>
Message-ID: <alpine.DEB.2.21.2607021125340.516@angie.orcam.me.uk>
References: <20260409164846.3176046-2-stefan.wiehler@nokia.com> <alpine.DEB.2.21.2604101353010.29980@angie.orcam.me.uk> <dff4fa6e-8eed-4dde-be99-f8adced872e2@nokia.com> <7fd22b08-d9af-4751-a6f3-6ef9c9205a2b@nokia.com> <4a414140-66d7-4114-9b36-e746573d4fa9@nokia.com>
 <alpine.DEB.2.21.2605231440350.1450@angie.orcam.me.uk> <18fdaf3e-a957-4d9e-bc29-3c570d50f482@nokia.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Stefan,

> >  I'm afraid I have no QEMU installation ready to use, so I can't reproduce
> > your steps without getting sidetracked.  Would you be able to explain why
> > it triggers with QEMU and possibly the I6400 CPU in particular, but not on
> > real SMP hardware I have?  From your commit description I infer this isn't
> > supposed to be a heisenbug.
> 
> The only explanation that comes to my mind is that your platform has
> TLBINV support and never calls r4k_tlb_uniquify() [1], therefore
> skipping the kmalloc() call. Would you please verify that?

 The Broadcom SiByte SB-1 core I have tried to reproduce this issue with 
(in a dual SMP configuration) is a MIPSr1 CPU and does not have the TLBINV 
instruction or the EHINV feature and neither is architectually allowed to.  
I have used it as one of the test platforms for 64-bit r4k_tlb_uniquify() 
verification and it is guaranteed to call this function.

 I'll see what I can do, but it'll take a while, so maybe someone else can 
try and reproduce it with their setup before I can get to it?

  Maciej

Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE9337189D;
	Sat, 23 May 2026 13:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779544153; cv=none; b=Hbm5MATKPvwDgkyvqnuEtY8W2QdqlcPCMfxjuipJuv1VGOKkcxXuY2M0NLF20aLIeG5QZHs9119bAlgn1L8bXx2dCYTC1NQ3rwg3bnu1LaIXyRJur4V31HnpU3poRIW+7JVwjjFhYw2gr1kvC8CwAO4haOqwxI2IjbCMwwqBZy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779544153; c=relaxed/simple;
	bh=1PADtFU8de5ewtuhaEMhLnU3P1fYD7DA8KjXQDa3FiM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PhTlsm73jQp0nwOL1KkEouKbN4WrCAzq4wjXoXRHs2fLjDJVKZrXRz9CTtr5OUm7bNwzDBwXdcKLEh59OHZCZsaEWUdT37DOjB0Lc03vqlH68RZJmfGWu2MnA89yKJWjUTtt85cj3O8cxqweCTm93vUNow7g9BQoCRvrjNZpj04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6386592009C; Sat, 23 May 2026 15:49:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 54A6C92009B;
	Sat, 23 May 2026 14:49:08 +0100 (BST)
Date: Sat, 23 May 2026 14:49:08 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Stefan Wiehler <stefan.wiehler@nokia.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v2] mips: mm: Call rcutree_report_cpu_starting() even
 earlier
In-Reply-To: <4a414140-66d7-4114-9b36-e746573d4fa9@nokia.com>
Message-ID: <alpine.DEB.2.21.2605231440350.1450@angie.orcam.me.uk>
References: <20260409164846.3176046-2-stefan.wiehler@nokia.com> <alpine.DEB.2.21.2604101353010.29980@angie.orcam.me.uk> <dff4fa6e-8eed-4dde-be99-f8adced872e2@nokia.com> <7fd22b08-d9af-4751-a6f3-6ef9c9205a2b@nokia.com>
 <4a414140-66d7-4114-9b36-e746573d4fa9@nokia.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Stefan,

> > I was able to reproduce this splat on latest mainline with the attached
> > defconfig on QEMU, which I invoked as follows:
> >
> > $ qemu-system-mips64 -cpu I6400 -smp 2 -kernel vmlinux -nographic
[...]
> 
> Any chance we could conclude on this topic?

 I'm afraid I have no QEMU installation ready to use, so I can't reproduce 
your steps without getting sidetracked.  Would you be able to explain why 
it triggers with QEMU and possibly the I6400 CPU in particular, but not on 
real SMP hardware I have?  From your commit description I infer this isn't 
supposed to be a heisenbug.

  Maciej

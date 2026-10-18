Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F563D7D89;
	Sun, 18 Oct 2026 23:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792365215; cv=none; b=q5y8U6fW2hbOKQ35O4c1UEmq8V8vM8GmiZPXXoHCEql9ueGD6OInz3AgrsQJZwz7PvuSra5fk0diFxjHgSiA5lQa3N5kAcrY/+9yVYZvGHMCQnVSBgKv7tI/GWXUEI/C/UX0Fu9fpjDKxKCyNimtULly9RjrSE6HJSSF/BS2G48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792365215; c=relaxed/simple;
	bh=FdC1QG8uliLAMhlvwsdcTZ87dgtMNuI5mLqmJRdKtrk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BkHanXwocS3D0qCJvJzX19Jx2zIeT5D3i1a2msx60rRABy/VhfbMa2n07HlfsxQ+eJuDCX4vlZwYunuQx0xtq1bFEtsbRQEqc6o2i4drvI/12CBu4l2dzvI3itVRduFtZM0dTIBQL7dTovc6muQAqarnPZlF7UezwhEHRt7SL6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 7F62492009C; Mon, 19 Oct 2026 01:13:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7976C92009B;
	Mon, 19 Oct 2026 00:13:24 +0100 (BST)
Date: Mon, 19 Oct 2026 00:13:24 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Rosen Penev <rosenp@gmail.com>
cc: linux-mips@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: lib: prefetch ahead in csum_partial()
In-Reply-To: <20261010065442.23780-1-rosenp@gmail.com>
Message-ID: <alpine.DEB.2.21.2610190001130.22065@angie.orcam.me.uk>
References: <20261010065442.23780-1-rosenp@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 Oct 2026, Rosen Penev wrote:

> diff --git a/arch/mips/lib/csum_partial.S b/arch/mips/lib/csum_partial.S
> index 3d2ff4118d79..f0ec47259ef4 100644
> --- a/arch/mips/lib/csum_partial.S
> +++ b/arch/mips/lib/csum_partial.S
> @@ -190,6 +190,21 @@ EXPORT_SYMBOL(csum_partial)
>  	 andi	t2, a1, 0x40
>  
>  .Lmove_128bytes:
> +#ifdef CONFIG_CPU_HAS_PREFETCH
> +	/*
> +	 * Fetch the block two iterations ahead, but only while it lies
> +	 * inside the buffer: on non-coherent systems a line prefetched
> +	 * past the end could belong to a buffer the device still owns.
> +	 */
> +	sltiu	t5, t8, 3
> +	bnez	t5, 2f
> +	 nop

 I don't like this manual delay slot scheduling, but it seems like a case 
for a larger clean-up of this file, so I'd be inclined to accept it.

> +	pref	0, 0x100(src)
> +	pref	0, 0x120(src)
> +	pref	0, 0x140(src)
> +	pref	0, 0x160(src)

 What about MIPSr6 though, which only has a span of -256..255 for the 
immediate offset in the machine instruction here?

  Maciej

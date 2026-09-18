Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DBB311592;
	Fri, 18 Sep 2026 20:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789763428; cv=none; b=RQSuA1i196ICb87nVmtZ4kLdKUQOQ022ZzAOQWvr5MC7LHHShYv0M8qaZD7MuJfE19reuMw9WEgEkqKLsN+0p14BjIKkJ23bQbHhQOEMFiKg5I2foQBUmdPt8twLXjrfKWWc0+DJUcPJTYnOC7qXK9qW66itkd38ehVK/Vv3GQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789763428; c=relaxed/simple;
	bh=103chCZe28LS5oYjF0vKNpehsGRtul4k1ynFHTWB9bs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lfaQxxUd/ZfdrrfRB95b54JbA+a2E9reUbqnlYk/qFtx6Sk03/rp9SkNjWjpk/vVgkJymgWFpAJcsFvB2ZAfVgpgxn8E87qdndE6RT4lKEemESROHCbxXA33b3ZabZWnGqEQ1jYHGeyzxJwGl9cOBKzj4kAIey+8wiPoyAeitLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 620EB92009C; Fri, 18 Sep 2026 22:30:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5FF5792009B;
	Fri, 18 Sep 2026 21:30:23 +0100 (BST)
Date: Fri, 18 Sep 2026 21:30:23 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: WangYuli <wangyuli@uniontech.com>
cc: guanwentao@uniontech.com, linux-kernel@vger.kernel.org, 
    linux-mips@vger.kernel.org, niecheng1@uniontech.com, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, zhanjun@uniontech.com, 
    Chen Linxuan <chenlinxuan@uniontech.com>
Subject: Re: [PATCH v2 1/6] MIPS: dec: Only check -msym32 when need
 compiler
In-Reply-To: <C7DB555D3895DE54+20250422102253.137944-1-wangyuli@uniontech.com>
Message-ID: <alpine.DEB.2.21.2609182059480.57799@angie.orcam.me.uk>
References: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com> <C7DB555D3895DE54+20250422102253.137944-1-wangyuli@uniontech.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Apr 2025, WangYuli wrote:

> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index d9057e29bc62..1fffc6cf8b52 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -284,6 +284,7 @@ entry-y				= $(shell $(objtree)/arch/mips/tools/elf-entry vmlinux)
>  cflags-y			+= -I$(srctree)/arch/mips/include/asm/mach-generic
>  drivers-$(CONFIG_PCI)		+= arch/mips/pci/
>  
> +ifdef need-compiler
>  #
>  # Automatically detect the build format. By default we choose
>  # the elf format according to the load address.
> @@ -304,7 +305,8 @@ ifdef CONFIG_64BIT
>        $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
>      endif
>    endif
> -endif
> +endif # CONFIG_64BIT
> +endif # need-compiler

 This does what is needed, however can you please follow our convention 
here and use indentation nesting?  Please leave the comment outside (it 
begs for a rewrite for clarity, but that's material for a separate fix).

 So for now this is only:

Tested-by: Maciej W. Rozycki <macro@orcam.me.uk>

  Maciej

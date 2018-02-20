Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:57775 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994696AbeBTWPEYsA1S (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 Feb 2018 23:15:04 +0100
Date: Tue, 20 Feb 2018 22:14:39 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH V2 08/12] MIPS: Align kernel load address to 64KB
In-Reply-To: <20180219230719.GC6245@saruman>
Message-ID: <alpine.DEB.2.00.1802202206490.3553@tp.orcam.me.uk>
References: <1517022752-3053-1-git-send-email-chenhc@lemote.com> <1517023336-17575-1-git-send-email-chenhc@lemote.com> <1517023336-17575-2-git-send-email-chenhc@lemote.com> <20180219230719.GC6245@saruman>
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
To: James Hogan <jhogan@kernel.org>
Cc: Huacai Chen <chenhc@lemote.com>, Ralf Baechle <ralf@linux-mips.org>, "Steven J . Hill" <Steven.Hill@cavium.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>
Message-ID: <20180220221439.l1C6Cp-9D_M6r7XYdnCd8QU-7ZIlT0q7dCX71p7q-is@z>

On Mon, 19 Feb 2018, James Hogan wrote:

> > KEXEC assume kernel align to PAGE_SIZE, and 64KB is the largest
> > PAGE_SIZE.
> 
> Please expand, maybe referring to sanity_check_segment_list() which does
> the actual check. Maybe something like this:
> 
>  Kexec needs the new kernel's load address to be aligned on a page
>  boundary (see sanity_check_segment_list()), but on MIPS the default
>  vmlinuz load address is only explicitly aligned to 16 bytes.
> 
>  Since the largest PAGE_SIZE supported by MIPS kernels is 64KB, increase
>  the alignment calculated by calc_vmlinuz_load_addr to 64KB.

 But why does it have to be hardcoded?  Shouldn't it be inherited from 
the image being loaded?  I'm missing bits of context here, but that 
would be either CONFIG_PAGE_SIZE_* settings or the ELF program header's 
`p_align' value, depending on how this code operates.  Wasting say 60kB 
of memory on smaller systems due to excessive alignment might not be a 
good idea.

  Maciej

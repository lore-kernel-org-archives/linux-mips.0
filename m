Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:38370 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990439AbeBZMmzIuH0H (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Feb 2018 13:42:55 +0100
Date: Mon, 26 Feb 2018 12:41:28 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH V2 08/12] MIPS: Align kernel load address to 64KB
In-Reply-To: <20180221111344.GH29460@jhogan-linux.mipstec.com>
Message-ID: <alpine.DEB.2.00.1802261233560.3553@tp.orcam.me.uk>
References: <1517022752-3053-1-git-send-email-chenhc@lemote.com> <1517023336-17575-1-git-send-email-chenhc@lemote.com> <1517023336-17575-2-git-send-email-chenhc@lemote.com> <20180219230719.GC6245@saruman> <alpine.DEB.2.00.1802202206490.3553@tp.orcam.me.uk>
 <20180220222542.GF29460@jhogan-linux.mipstec.com> <alpine.DEB.2.00.1802202249410.3553@tp.orcam.me.uk> <20180220225845.GG29460@jhogan-linux.mipstec.com> <alpine.DEB.2.00.1802202313480.3553@tp.orcam.me.uk> <20180221111344.GH29460@jhogan-linux.mipstec.com>
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
To: James Hogan <james.hogan@mips.com>
Cc: Huacai Chen <chenhc@lemote.com>, Ralf Baechle <ralf@linux-mips.org>, "Steven J . Hill" <Steven.Hill@cavium.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>
Message-ID: <20180226124128.ZkTc9Fh6SxlIf8Tceu9JPktIblhfEfaFqnpKDA-H_Uw@z>

On Wed, 21 Feb 2018, James Hogan wrote:

> >  Forgive my dumbness, but I don't understand what's preventing the 1st 
> > kernel from getting the alignment of the 2nd kernel (regardless of 
> > whether the 2nd kernel has kexec enabled).  What prevents the 1st kernel 
> > from interpreting the `p_align' value from the relevant program header 
> > of the 2nd kernel before loading the segment the header describes?  It 
> > has to load the header anyway or it wouldn't know how much data to load 
> > and where from into the file, and how much BSS space to initialise.
> 
> The kernel doesn't always get an elf through kexec_load(2), but rather a
> list of load segments. In any case though its not about knowing the
> page size of 2nd kernel, its about kexec working with page size chunks.
> See the comment in sanity_check_segment_list().

 So this is 1st kernel's page size AFAICT.  And I can see `struct 
kexec_segment' drops ELF program header information, sigh.

> >  Here's an example program header dump from `vmlinux':
> > 
> > $ readelf -l vmlinux
> 
> Yeh but its not a vmlinux, its a vmlinuz. Thats the whole point. Though
> it sounds like you'd have the same problem with vmlinux too if you tried
> reducing the page size, so perhaps its fine for compressed kernels to
> just align to the page size of the 2nd kernel, so they're no worse than
> vmlinux.

 Well, even if compressed you need to preserve the original structures 
somehow so that once uncompressed the memory image is the same as if 
`vmlinux' was loaded directly.

> > As you can see there's only one loadable segment (the usual case) and 
> > its alignment is 0x4000, that is 16kiB.  So this kernel uses a page size 
> > of 16kiB.
> 
> For malta_defconfig *vmlinuz* however (CONFIG_PAGE_SIZE_16KB=y), I get
> this:
>   LOAD           0x008320 0x80828320 0x80828320 0x35e580 0x8605a0 RWE 0x10000

 Hmm, now you've left me stumped, so I'll shut up.

  Maciej

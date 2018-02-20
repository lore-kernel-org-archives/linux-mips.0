Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:35949 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994692AbeBTWx5VSCt5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 Feb 2018 23:53:57 +0100
Date: Tue, 20 Feb 2018 22:53:19 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH V2 08/12] MIPS: Align kernel load address to 64KB
In-Reply-To: <20180220222542.GF29460@jhogan-linux.mipstec.com>
Message-ID: <alpine.DEB.2.00.1802202249410.3553@tp.orcam.me.uk>
References: <1517022752-3053-1-git-send-email-chenhc@lemote.com> <1517023336-17575-1-git-send-email-chenhc@lemote.com> <1517023336-17575-2-git-send-email-chenhc@lemote.com> <20180219230719.GC6245@saruman> <alpine.DEB.2.00.1802202206490.3553@tp.orcam.me.uk>
 <20180220222542.GF29460@jhogan-linux.mipstec.com>
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
Message-ID: <20180220225319.vfiNR1kmFTM3kUoGUb77OSdKAIEIPqJgbOIW-rUwZFo@z>

On Tue, 20 Feb 2018, James Hogan wrote:

> > >  Since the largest PAGE_SIZE supported by MIPS kernels is 64KB, increase
> > >  the alignment calculated by calc_vmlinuz_load_addr to 64KB.
> > 
> >  But why does it have to be hardcoded?  Shouldn't it be inherited from 
> > the image being loaded?  I'm missing bits of context here, but that 
> > would be either CONFIG_PAGE_SIZE_* settings or the ELF program header's 
> > `p_align' value, depending on how this code operates.  Wasting say 60kB 
> > of memory on smaller systems due to excessive alignment might not be a 
> > good idea.
> 
> I presume there's nothing to stop a kernel with 64KB pages (and hence
> requiring 64KB alignment of load sections) loading a new kernel with 4KB
> pages (which is the one we're looking at).

 As I say, I'm missing bits of context.  If you say that a 64kiB-page 
kernel loads a 4kiB-page kernel, then the alignment for the latter is 
obviously 4kiB.  So I repeat my question: why hardcode the alignment to 
64kiB while we only need 4kiB in this case?

  Maciej

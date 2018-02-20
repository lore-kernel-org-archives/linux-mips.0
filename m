Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:46435 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23990422AbeBTXp4mNAI5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Feb 2018 00:45:56 +0100
Date: Tue, 20 Feb 2018 23:38:26 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH V2 08/12] MIPS: Align kernel load address to 64KB
In-Reply-To: <20180220225845.GG29460@jhogan-linux.mipstec.com>
Message-ID: <alpine.DEB.2.00.1802202313480.3553@tp.orcam.me.uk>
References: <1517022752-3053-1-git-send-email-chenhc@lemote.com> <1517023336-17575-1-git-send-email-chenhc@lemote.com> <1517023336-17575-2-git-send-email-chenhc@lemote.com> <20180219230719.GC6245@saruman> <alpine.DEB.2.00.1802202206490.3553@tp.orcam.me.uk>
 <20180220222542.GF29460@jhogan-linux.mipstec.com> <alpine.DEB.2.00.1802202249410.3553@tp.orcam.me.uk> <20180220225845.GG29460@jhogan-linux.mipstec.com>
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
Message-ID: <20180220233826.jdSIKf9bIA9Ja0BhrXQ8mrljS5O8X5TeoL7ABD9XbK4@z>

On Tue, 20 Feb 2018, James Hogan wrote:

> >  As I say, I'm missing bits of context.  If you say that a 64kiB-page 
> > kernel loads a 4kiB-page kernel, then the alignment for the latter is 
> > obviously 4kiB.  So I repeat my question: why hardcode the alignment to 
> > 64kiB while we only need 4kiB in this case?
> 
> Because its the 1st kernel which is doing the kexec'ing of the 2nd
> kernel. The 2nd kernel might not even have kexec enabled, but you still
> might want to boot it using kexec.

 Forgive my dumbness, but I don't understand what's preventing the 1st 
kernel from getting the alignment of the 2nd kernel (regardless of 
whether the 2nd kernel has kexec enabled).  What prevents the 1st kernel 
from interpreting the `p_align' value from the relevant program header 
of the 2nd kernel before loading the segment the header describes?  It 
has to load the header anyway or it wouldn't know how much data to load 
and where from into the file, and how much BSS space to initialise.

 Here's an example program header dump from `vmlinux':

$ readelf -l vmlinux

Elf file type is EXEC (Executable file)
Entry point 0x80506e70
There are 3 program headers, starting at offset 52

Program Headers:
  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
  ABIFLAGS       0x4b02e8 0x805ac2e8 0x805ac2e8 0x00018 0x00018 R   0x8
  LOAD           0x004000 0x80100000 0x80100000 0x534650 0x569710 RWE 0x4000
  NOTE           0x4145a8 0x805105a8 0x805105a8 0x00024 0x00024 R   0x4

 Section to Segment mapping:
  Segment Sections...
   00     .MIPS.abiflags
   01     .text __ex_table .notes .rodata .MIPS.abiflags .pci_fixup __ksymtab __ksymtab_gpl __kcrctab __kcrctab_gpl __ksymtab_strings __param __modver .data .init.text .init.data .exit.text .bss
   02     .notes
$ 

As you can see there's only one loadable segment (the usual case) and 
its alignment is 0x4000, that is 16kiB.  So this kernel uses a page size 
of 16kiB.

  Maciej

Received: from mailapp01.imgtec.com ([195.59.15.196]:24310 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011628AbcBIMcZIX8Zb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 9 Feb 2016 13:32:25 +0100
Date: Tue, 9 Feb 2016 12:32:18 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH v3 3/3] mips: Differentiate between 32 and 64 bit ELF
 header
In-Reply-To: <56B99D55.2020301@bmw-carit.de>
Message-ID: <alpine.DEB.2.00.1602091148570.15885@tp.orcam.me.uk>
References: <201602090033.mukhdG4N%fengguang.wu@intel.com> <56B99D55.2020301@bmw-carit.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Daniel Wagner <daniel.wagner@bmw-carit.de>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@01.org, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20160209123218.FXY-lyaNhEtPBacK1xdVK8uILZz6QhsCeVhrlAKSoj8@z>

On Tue, 9 Feb 2016, Daniel Wagner wrote:

> > All error/warnings (new ones prefixed by >>):
> > 
> >    arch/mips/kernel/../../../fs/binfmt_elf.c: In function 'load_elf_interp':
> >>> arch/mips/kernel/binfmt_elfn32.c:38:7: error: implicit declaration of function 'mips_elf_check_machine' [-Werror=implicit-function-declaration]
> >      if (!mips_elf_check_machine(__h))    \
> >           ^
> >>> arch/mips/kernel/../../../fs/binfmt_elf.c:536:7: note: in expansion of macro 'elf_check_arch'
> >      if (!elf_check_arch(interp_elf_ex))
> >           ^
> >    cc1: some warnings being treated as errors
> > --
> >    arch/mips/kernel/../../../fs/binfmt_elf.c: In function 'load_elf_interp':
> 
> Hmm how I was able to build binfmt_elfo32.o because it should suffer
> from the same problem.
> 
> I think reusing mips_elf_check_machine() in binfmt_elf?32.c is only
> going to work if we include arch/mips/include/asm/elf.h. Though this
> looks kind of wrong.

 But neither binfmt_elf?32.c actually expands `elf_check_arch' and both 
include fs/binfmt_elf.c at the end, which in turn includes <linux/elf.h>, 
which in turn does include <asm/elf.h> before expanding `elf_check_arch', 
and consequently at that point `mips_elf_check_machine' will have been 
already defined.  So things are all right, except you need to define the 
macro outside `#ifndef ELF_ARCH'.

 I suggest moving it down, right below the conditional, rather than up as 
the top of the file contains generic MIPS ELF stuff.  I think all the 
three macros can go together, it doesn't appear to me they need to depend 
on `ELF_ARCH', and we can fix it up if ever in the future they have to.

 FWIW I think all the MIPS ABI flags stuff also needs to go outside the 
conditional, because it's ABI agnostic.  I'll make the right change myself 
on top of your fixes.  It'll remove a little bit of code duplication, 
which is always welcome.

  Maciej

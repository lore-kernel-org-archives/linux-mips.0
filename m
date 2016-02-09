Received: from mail.bmw-carit.de ([62.245.222.98]:46996 "EHLO
        mail.bmw-carit.de" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010545AbcBIIDgva275 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 9 Feb 2016 09:03:36 +0100
Subject: Re: [PATCH v3 3/3] mips: Differentiate between 32 and 64 bit ELF
 header
References: <201602090033.mukhdG4N%fengguang.wu@intel.com>
From: Daniel Wagner <daniel.wagner@bmw-carit.de>
Message-ID: <56B99D55.2020301@bmw-carit.de>
Date: Tue, 9 Feb 2016 09:03:33 +0100
MIME-Version: 1.0
In-Reply-To: <201602090033.mukhdG4N%fengguang.wu@intel.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <daniel.wagner@bmw-carit.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Maciej W. Rozycki" <macro@imgtec.com>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@01.org, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20160209080333.iNT7t9NvxJQfhGNiJFzIffkhiqm9KC4sep8J83JJ13c@z>

Hi Maciej,

On 02/08/2016 05:22 PM, kbuild test robot wrote:
> Hi Daniel,
> 
> [auto build test ERROR on v4.5-rc3]
> [also build test ERROR on next-20160208]
> [if your patch is applied to the wrong git tree, please drop us a note to help improving the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Daniel-Wagner/Differentiate-between-32-and-64-bit-ELF-header/20160208-234759
> config: mips-fuloong2e_defconfig (attached as .config)
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=mips 
> 
> All error/warnings (new ones prefixed by >>):
> 
>    arch/mips/kernel/../../../fs/binfmt_elf.c: In function 'load_elf_interp':
>>> arch/mips/kernel/binfmt_elfn32.c:38:7: error: implicit declaration of function 'mips_elf_check_machine' [-Werror=implicit-function-declaration]
>      if (!mips_elf_check_machine(__h))    \
>           ^
>>> arch/mips/kernel/../../../fs/binfmt_elf.c:536:7: note: in expansion of macro 'elf_check_arch'
>      if (!elf_check_arch(interp_elf_ex))
>           ^
>    cc1: some warnings being treated as errors
> --
>    arch/mips/kernel/../../../fs/binfmt_elf.c: In function 'load_elf_interp':

Hmm how I was able to build binfmt_elfo32.o because it should suffer
from the same problem.

I think reusing mips_elf_check_machine() in binfmt_elf?32.c is only
going to work if we include arch/mips/include/asm/elf.h. Though this
looks kind of wrong.

Should I add a mips_elf_check_machine() to binfmt_elf?32.c as well or
just leave them as they are at this point?

cheers,
daniel

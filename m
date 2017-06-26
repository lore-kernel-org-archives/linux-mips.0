Received: from mail-it0-x244.google.com ([IPv6:2607:f8b0:4001:c0b::244]:35275
        "EHLO mail-it0-x244.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993894AbdFZH01i5jVZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Jun 2017 09:26:27 +0200
MIME-Version: 1.0
In-Reply-To: <201706261344.OUjMGlsQ%fengguang.wu@intel.com>
References: <20170623220857.28774-2-palmer@dabbelt.com> <201706261344.OUjMGlsQ%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jun 2017 09:26:20 +0200
Message-ID: <CAMuHMdXSrfbSX2de2q35Hj6vQwi+sr23M1LEg82JL+FyLq4OJw@mail.gmail.com>
Subject: Re: [PATCH] pci: Add and use PCI_GENERIC_SETUP Kconfig entry
Content-Type: text/plain; charset="UTF-8"
Return-Path: <geert.uytterhoeven@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: kbuild test robot <lkp@intel.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, "kbuild-all@01.org" <kbuild-all@01.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, "David S. Miller" <davem@davemloft.net>, cmetcalf@mellanox.com, Guan Xuetao <gxt@mprc.pku.edu.cn>, Bjorn Helgaas <bhelgaas@google.com>, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, alpha <linux-alpha@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>
Message-ID: <20170626072620.3FGlK5jyHnO4ReZlwdkg9n8g3sPSOpi92WwSUQnuPxI@z>

On Mon, Jun 26, 2017 at 7:39 AM, kbuild test robot <lkp@intel.com> wrote:
> [auto build test WARNING on linus/master]
> [also build test WARNING on v4.12-rc6]
> [cannot apply to next-20170623]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Palmer-Dabbelt/pci-Add-and-use-PCI_GENERIC_SETUP-Kconfig-entry/20170626-043558
> config: m68k-allnoconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 4.9.0
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=m68k
>
> All warnings (new ones prefixed by >>):
>
> warning: (M68K) selects PCI_GENERIC_SETUP which has unmet direct dependencies (MMU)

I can't seem to find this dependency of PCI_GENERIC_SETUP on MMU?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

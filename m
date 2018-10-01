Received: from conssluserg-06.nifty.com ([210.131.2.91]:61376 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990429AbeJAFuXhX2Ae convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 1 Oct 2018 07:50:23 +0200
MIME-Version: 1.0
References: <20180910150403.19476-1-robh@kernel.org> <20180910150403.19476-7-robh@kernel.org>
 <CAL_Jsq+=VbdcVLiwXbOA5d+R2YY6=2Pw2bQpci-jj-JvereD1A@mail.gmail.com>
 <CAK7LNAQFqhWw+LwDoypGG=OP6tH4qf2tT=LvtchK2GoiNyzDXg@mail.gmail.com>
 <CAMuHMdWEnoh97_jiDWMq=ke4PrhSFbToYnx91CPLBuq3mOGzoQ@mail.gmail.com>
 <CAK7LNATkkOiYPj2RLubcgZ_z59Bhz4GkgWqPMbnaHBk7EisXLg@mail.gmail.com> <20180928154150.GA25013@bogus>
In-Reply-To: <20180928154150.GA25013@bogus>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 1 Oct 2018 14:49:06 +0900
Message-ID: <CAK7LNATiSbwVfCRNsDOyksfq5wcv0pnNQYnMXdo2yRyE7fcn-Q@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] kbuild: consolidate Devicetree dtb build rules
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-Path: <yamada.masahiro@socionext.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, Linux-MIPS <linux-mips@linux-mips.org>, nios2-dev@lists.rocketboards.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-xtensa@linux-xtensa.org, Will Deacon <will.deacon@arm.com>, Paul Burton <paul.burton@mips.com>, Ley Foon Tan <ley.foon.tan@intel.com>
Message-ID: <20181001054906.893KYekx_k6_4KWCkxsx9HeCA7UrfGbqZpMb5YI5_t0@z>

Hi Rob,


2018年9月29日(土) 0:43 Rob Herring <robh@kernel.org>:

> +#
> ---------------------------------------------------------------------------
> +# Devicetree files
> +
> +ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/boot/dts/),)
> +dtstree := arch/$(SRCARCH)/boot/dts
> +endif
> +
> +ifneq ($(dtstree),)
> +
> +%.dtb : scripts_dtc

%.dtb: prepare3 prepare


because we need to make sure KERNELRELEASE
is correctly defined before dtbs_install happens.


> +       $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> +
> +PHONY += dtbs dtbs_install
> +dtbs: scripts_dtc


dtbs: prepare3 scripts_dtc



> +       $(Q)$(MAKE) $(build)=$(dtstree)
> +
> +dtbs_install: dtbs


Please do not have dtbs_install to depend on dtbs.

No install targets should ever trigger building anything
in the source tree.


For the background, see the commit log of
19514fc665ffbce624785f76ee7ad0ea6378a527




> +       $(Q)$(MAKE) $(dtbinst)=$(dtstree)
> +
> +ifdef CONFIG_OF_EARLY_FLATTREE
> +all: dtbs
> +endif
> +
> +endif
> +
> +PHONY += scripts_dtc
> +scripts_dtc: scripts_basic
> +       $(Q)$(MAKE) $(build)=scripts/dtc
> +
>  #
> ---------------------------------------------------------------------------
>  # Modules
>


-- 
Best Regards
Masahiro Yamada

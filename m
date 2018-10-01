Received: from conssluserg-05.nifty.com ([210.131.2.90]:27829 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994572AbeJAUferoaYk convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 1 Oct 2018 22:35:34 +0200
MIME-Version: 1.0
References: <20181001152531.3385-1-robh@kernel.org> <20181001152531.3385-7-robh@kernel.org>
In-Reply-To: <20181001152531.3385-7-robh@kernel.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 2 Oct 2018 05:34:18 +0900
Message-ID: <CAK7LNAQAG1pAOMbnrFd5VbmUfcN5337tcGdeFrRo92rPWkVWAg@mail.gmail.com>
Subject: Re: [PATCH v4 6/9] kbuild: consolidate Devicetree dtb build rules
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
Cc: DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, Linux-MIPS <linux-mips@linux-mips.org>, nios2-dev@lists.rocketboards.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-xtensa@linux-xtensa.org, Will Deacon <will.deacon@arm.com>, Paul Burton <paul.burton@mips.com>, Ley Foon Tan <ley.foon.tan@intel.com>
Message-ID: <20181001203418.8ZjjPM3uo74KV6SlN9m6Y-hvKlWXn0ezC8CptHTS0Lo@z>

2018年10月2日(火) 0:26 Rob Herring <robh@kernel.org>:
>
> There is nothing arch specific about building dtb files other than their
> location under /arch/*/boot/dts/. Keeping each arch aligned is a pain.
> The dependencies and supported targets are all slightly different.
> Also, a cross-compiler for each arch is needed, but really the host
> compiler preprocessor is perfectly fine for building dtbs. Move the
> build rules to a common location and remove the arch specific ones. This
> is done in a single step to avoid warnings about overriding rules.
>
> The build dependencies had been a mixture of 'scripts' and/or 'prepare'.
> These pull in several dependencies some of which need a target compiler
> (specifically devicetable-offsets.h) and aren't needed to build dtbs.
> All that is really needed is dtc, so adjust the dependencies to only be
> dtc.
>
> This change enables support 'dtbs_install' on some arches which were
> missing the target.
>
> Acked-by: Will Deacon <will.deacon@arm.com>
> Acked-by: Paul Burton <paul.burton@mips.com>
> Acked-by: Ley Foon Tan <ley.foon.tan@intel.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>

Please change this to

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>


Thanks.


> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: uclinux-h8-devel@lists.sourceforge.jp
> Cc: linux-mips@linux-mips.org
> Cc: nios2-dev@lists.rocketboards.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-xtensa@linux-xtensa.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v4:
>  - Make dtbs and %.dtb rules depend on arch/$ARCH/boot/dts path rather than
>    CONFIG_OF_EARLY_FLATTREE
>  - Fix install path missing kernel version for dtbs_install
>  - Fix "make CONFIG_OF_ALL_DTBS=y" for arches like ARM which selectively
>    enable CONFIG_OF (and therefore dtc)




-- 
Best Regards
Masahiro Yamada

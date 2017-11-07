Received: from mail-oi0-x241.google.com ([IPv6:2607:f8b0:4003:c06::241]:47404
        "EHLO mail-oi0-x241.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992143AbdKGMPaXkAd7 convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 7 Nov 2017 13:15:30 +0100
MIME-Version: 1.0
In-Reply-To: <5a0159b6.08bc500a.ebe4b.25c6@mx.google.com>
References: <5a0159b6.08bc500a.ebe4b.25c6@mx.google.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Nov 2017 13:15:22 +0100
Message-ID: <CAK8P3a3QKkGv6eSjX7wH6LpOY0-1XUPFoX0ntog5-ZSHPab6iA@mail.gmail.com>
Subject: Re: next/master build: 214 builds: 26 failed, 188 passed, 28 errors,
 6333 warnings (next-20171107)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-Path: <arndbergmann@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "kernelci.org bot" <bot@kernelci.org>
Cc: Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>, "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>, Masami Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
Message-ID: <20171107121522._CRGC-P5nIKpSBPwZUPQoHP6xCRLsh28ODH1wJ08HUY@z>

On Tue, Nov 7, 2017 at 7:59 AM, kernelci.org bot <bot@kernelci.org> wrote:

> Errors summary:
> 20 arch/mips/include/asm/smp.h:32:29: error: 'CONFIG_MIPS_NR_CPU_NR_MAP' undeclared here (not in a function)

I have reported this before, as did 0day, but I don't know if anyone
is fixing this:

https://lists.01.org/pipermail/kbuild-all/2017-October/038694.html

This is caused by commit 43b97bf59c69 ("MIPS: Allow __cpu_number_map
to be larger than NR_CPUS")

> 2 arch/arm/mach-footbridge/dc21285.c:145:2: error: expected ';' before 'else'

A harmless rework that Linus Walleij did apparently uncovered an
ancient bug. I'm
waiting for Linus to suggest a fix.

> 1 timekeeping.c:(.text+0x1628): undefined reference to `__lshrti3'
> 1 fair.c:(.text+0x35c): undefined reference to `__lshrti3'

Caused by the new 128-bit arithmetic in ARM64, a fix has been submitted by the
original author.

> 1 net/dsa/dsa2.c:678:7: error: implicit declaration of function 'of_property_read_variable_u32_array' [-Werror=implicit-function-declaration]

I sent a fix

> Warnings summary:
> 16 fs/xfs/libxfs/xfs_bmap.c:4777:20: warning: unused variable 'ifp' [-Wunused-variable]
> 16 fs/xfs/libxfs/xfs_bmap.c:4649:20: warning: unused variable 'ifp' [-Wunused-variable]

I sent a fix

> 12 arch/arm/boot/dts/spear1340-evb.dtb: Warning (dmas_property): Property 'dmas', cell 4 is not a phandle reference in /ahb/apb/serial@b4100000
> 12 arch/arm/boot/dts/spear1340-evb.dtb: Warning (dmas_property): Missing property '#dma-cells' in node /interrupt-controller@ec801000 or bad phandle (referred from /ahb/apb/serial@b4100000:dmas[4])
> 12 arch/arm/boot/dts/spear1310-evb.dtb: Warning (gpios_property): Property 'cs-gpios', cell 6 is not a phandle reference in /ahb/apb/spi@e0100000
> 12 arch/arm/boot/dts/spear1310-evb.dtb: Warning (gpios_property): Missing property '#gpio-cells' in node /interrupt-controller@ec801000 or bad phandle (referred from /ahb/apb/spi@e0100000:cs-gpios[6])
...

endless stream of new dtc warnings, mostly valid. I have started
fixing them but at some point
gave up. Looking for help here.

> Warnings:
> warning: objtool: x86 instruction decoder differs from kernel
> net/dccp/probe.c:166:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
> net/dccp/probe.c:170:4: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
> net/dccp/probe.c:190:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
> net/ipv4/tcp_probe.c:280:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
> net/ipv4/tcp_probe.c:298:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
> net/sctp/probe.c:189:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
> net/sctp/probe.c:194:3: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
> net/sctp/probe.c:240:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]

Not sure, we discussed possible alternatives, but it looks like this
is not getting addressed before
4.15, so we may end up removing the deprecation warning to get a clean
4.15 build instead.

> drivers/soc/qcom/rmtfs_mem.c:211:1: warning: label 'remove_cdev' defined but not used [-Wunused-label]

I sent a patch

> x86_64_defconfig (x86) — PASS, 0 errors, 2 warnings, 0 section mismatches
>
> Warnings:
> warning: objtool: x86 instruction decoder differs from kernel

Josh Poimboeuf sent a patch

> net/netfilter/nf_conntrack_netlink.c:536:15: warning: 'ctnetlink_proto_size' defined but not used [-Wunused-function]

I have a patch, will send after some more testing.

       Arnd

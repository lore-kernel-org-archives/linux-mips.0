Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:34456 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990434AbeBGQnm7LynV convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 7 Feb 2018 17:43:42 +0100
From: Aleksandar Markovic <Aleksandar.Markovic@mips.com>
Subject: RE: [PATCH 4/4] MIPS: generic: Don't claim PC parport/serio
Date: Wed, 7 Feb 2018 16:27:09 +0000
Message-ID: <BD3A5F1946F2E540A31AF2CE969BAEEE2517C9A2@MIPSMAIL01.mipstec.com>
References: <cover.fcf1b08ac94759a5cd4b4303f350734b68872619.1517609353.git-series.jhogan@kernel.org>,<62d0928450232217dcb1979e9c56e02a275bdfd0.1517609353.git-series.jhogan@kernel.org>
In-Reply-To: <62d0928450232217dcb1979e9c56e02a275bdfd0.1517609353.git-series.jhogan@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Aleksandar.Markovic@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Cc: Goran Ferenc <Goran.Ferenc@mips.com>, Miodrag Dinic <Miodrag.Dinic@mips.com>, Paul Burton <Paul.Burton@mips.com>
Message-ID: <20180207162709.IUVHyDr3eOTHx0Bi6YQ1Lbh1_VL2h2xZloG8ZYC8ilE@z>

> 
> ________________________________________
> From: James Hogan [jhogan@kernel.org]
> Sent: Friday, February 2, 2018 11:14 PM
> To: Ralf Baechle; linux-mips@linux-mips.org
> Cc: Aleksandar Markovic; Goran Ferenc; Miodrag Dinic; James Hogan; Paul Burton
> Subject: [PATCH 4/4] MIPS: generic: Don't claim PC parport/serio
> 
> None of the supported MIPS generic platforms can have the PC parallel
> port or PC serial port (and we don't yet have to be concerned with
> Malta which does), and enabling the PC serial driver will result in a
> panic from i8042_flush during boot. Therefore conditionalise the MIPS
> selection of ARCH_MIGHT_HAVE_PC_{PARPORT,SERIO} on !MIPS_GENERIC.
> 
> This particularly matters since commit f2d0b0d5c171 ("MIPS: ranchu: Add
> Ranchu as a new generic-based board"), which adds a board fragment which
> enables INPUT_KEYBOARD. That implicitly enables KEYBOARD_ATKBD which
> then selects SERIO_I8042 if ARCH_MIGHT_HAVE_PC_SERIO.
> 
> We can always select it from specific platforms later.
> 
> Fixes: f2d0b0d5c171 ("MIPS: ranchu: Add Ranchu as a new generic-based board")
> Signed-off-by: James Hogan <jhogan@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Miodrag Dinic <miodrag.dinic@mips.com>
> Cc: Goran Ferenc <goran.ferenc@mips.com>
> Cc: Aleksandar Markovic <aleksandar.markovic@mips.com>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: linux-mips@linux-mips.org
> ---
> Does anybody actually know which MIPS platforms can have these PC
> devices?
> ---
>  arch/mips/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Aleksandar Markovic <aleksandar.markovic@mips.com>
Acked-by: Miodrag Dinic <miodrag.dinic@mips.com>

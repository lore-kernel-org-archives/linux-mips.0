Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:57338 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992692AbeBGQoVTfFKV convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 7 Feb 2018 17:44:21 +0100
From: Aleksandar Markovic <Aleksandar.Markovic@mips.com>
Subject: RE: [PATCH 3/4] MIPS: generic: Fix Makefile alignment
Date: Wed, 7 Feb 2018 16:27:08 +0000
Message-ID: <BD3A5F1946F2E540A31AF2CE969BAEEE2517C999@MIPSMAIL01.mipstec.com>
References: <cover.fcf1b08ac94759a5cd4b4303f350734b68872619.1517609353.git-series.jhogan@kernel.org>,<aca836516478a60b0f3d68251448ec96014a610e.1517609353.git-series.jhogan@kernel.org>
In-Reply-To: <aca836516478a60b0f3d68251448ec96014a610e.1517609353.git-series.jhogan@kernel.org>
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
Cc: Goran Ferenc <Goran.Ferenc@mips.com>, Miodrag Dinic <Miodrag.Dinic@mips.com>

> 
> ________________________________________
> From: James Hogan [jhogan@kernel.org]
> Sent: Friday, February 2, 2018 11:14 PM
> To: Ralf Baechle; linux-mips@linux-mips.org
> Cc: Aleksandar Markovic; Goran Ferenc; Miodrag Dinic; James Hogan
> Subject: [PATCH 3/4] MIPS: generic: Fix Makefile alignment
> 
> Fix whitespace of generic platform Makefile so that obj-y values align.
> 
> Fixes: f2d0b0d5c171 ("MIPS: ranchu: Add Ranchu as a new generic-based board")
> Signed-off-by: James Hogan <jhogan@kernel.org>
> Reviewed-by: Paul Burton <paul.burton@mips.com>
> Reviewed-by: Matt Redfearn <matt.redfearn@mips.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Miodrag Dinic <miodrag.dinic@mips.com>
> Cc: Goran Ferenc <goran.ferenc@mips.com>
> Cc: Aleksandar Markovic <aleksandar.markovic@mips.com>
> Cc: linux-mips@linux-mips.org
> ---
>  arch/mips/generic/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Aleksandar Markovic <aleksandar.markovic@mips.com>
Acked-by: Miodrag Dinic <miodrag.dinic@mips.com>

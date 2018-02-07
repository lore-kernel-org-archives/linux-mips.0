Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:40315 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992618AbeBGQnstpUUV convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 7 Feb 2018 17:43:48 +0100
From: Aleksandar Markovic <Aleksandar.Markovic@mips.com>
Subject: RE: [PATCH 2/4] MIPS: generic: Fix ranchu_of_match[] termination
Date: Wed, 7 Feb 2018 16:27:06 +0000
Message-ID: <BD3A5F1946F2E540A31AF2CE969BAEEE2517C990@MIPSMAIL01.mipstec.com>
References: <cover.fcf1b08ac94759a5cd4b4303f350734b68872619.1517609353.git-series.jhogan@kernel.org>,<478b4da66648852b55c58eb7453f608d7501d5a8.1517609353.git-series.jhogan@kernel.org>
In-Reply-To: <478b4da66648852b55c58eb7453f608d7501d5a8.1517609353.git-series.jhogan@kernel.org>
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
Message-ID: <20180207162706.zxze252gcpMiXUNyMFBl-WR7VwYnbjDA60_pTEuvkI8@z>

> 
> ________________________________________
> From: James Hogan [jhogan@kernel.org]
> Sent: Friday, February 2, 2018 11:14 PM
> To: Ralf Baechle; linux-mips@linux-mips.org
> Cc: Aleksandar Markovic; Goran Ferenc; Miodrag Dinic; James Hogan
> Subject: [PATCH 2/4] MIPS: generic: Fix ranchu_of_match[] termination
> 
> ranchu_of_match[] has no terminating element to end the search for a
> matching compatible string when the first and only element does not
> match, so add one now.
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
>  arch/mips/generic/board-ranchu.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Aleksandar Markovic <aleksandar.markovic@mips.com>
Acked-by: Miodrag Dinic <miodrag.dinic@mips.com>

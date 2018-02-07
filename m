Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:52126 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990400AbeBGQnoptfCV convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 7 Feb 2018 17:43:44 +0100
From: Aleksandar Markovic <Aleksandar.Markovic@mips.com>
Subject: RE: [PATCH 1/4] MIPS: generic: Fix machine compatible matching
Date: Wed, 7 Feb 2018 16:27:03 +0000
Message-ID: <BD3A5F1946F2E540A31AF2CE969BAEEE2517B986@MIPSMAIL01.mipstec.com>
References: <cover.fcf1b08ac94759a5cd4b4303f350734b68872619.1517609353.git-series.jhogan@kernel.org>,<4d44540130007c278068ea4870e3c4efbd171ee6.1517609353.git-series.jhogan@kernel.org>
In-Reply-To: <4d44540130007c278068ea4870e3c4efbd171ee6.1517609353.git-series.jhogan@kernel.org>
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
> Subject: [PATCH 1/4] MIPS: generic: Fix machine compatible matching
> 
> We now have a platform (Ranchu) in the "generic" platform which matches
> based on the FDT compatible string using mips_machine_is_compatible(),
> however that function doesn't stop at a blank struct
> of_device_id::compatible as that is an array in the struct, not a
> pointer to a string.
> 
> Fix the loop completion to check the first byte of the compatible array
> rather than the address of the compatible array in the struct.
> 
> Fixes: eed0eabd12ef ("MIPS: generic: Introduce generic DT-based board support")
> Signed-off-by: James Hogan <jhogan@kernel.org>
> Reviewed-by: Paul Burton <paul.burton@mips.com>
> Reviewed-by: Matt Redfearn <matt.redfearn@mips.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-mips@linux-mips.org
> ---
>  arch/mips/include/asm/machine.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Aleksandar Markovic <aleksandar.markovic@mips.com>
Acked-by: Miodrag Dinic <miodrag.dinic@mips.com>

Received: from mail-sn1nam02on0055.outbound.protection.outlook.com ([104.47.36.55]:5024
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992307AbcIAXAqOdHbb (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 2 Sep 2016 01:00:46 +0200
Message-ID: <57C8B313.6030206@caviumnetworks.com>
Date: Thu, 1 Sep 2016 16:00:35 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 5/6] MIPS: OCTEON: delete legacy code for PHY access
References: <20160901204400.16562-1-aaro.koskinen@iki.fi> <20160901204400.16562-6-aaro.koskinen@iki.fi>
In-Reply-To: <20160901204400.16562-6-aaro.koskinen@iki.fi>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20160901230035.fAhosjl-M2HrCL5ahV5Y6ftzjAJBsHxRDeoFLj0Imqs@z>

On 09/01/2016 01:43 PM, Aaro Koskinen wrote:
> PHY access through the board helper should be impossible with the
> current drivers, so delete this code and add BUG_ON().
>
> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> ---
>   .../cavium-octeon/executive/cvmx-helper-board.c    | 110 +--------------------
>   1 file changed, 5 insertions(+), 105 deletions(-)
>
> diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-board.c b/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
> index 5572e39..8d75242 100644
> --- a/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
> +++ b/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
[...]
> +	BUG_ON(cvmx_helper_board_get_mii_address(ipd_port) != -1);
>

Can we do WARN_ON instead?

No need to crash the kernel for this I think.

David Daney

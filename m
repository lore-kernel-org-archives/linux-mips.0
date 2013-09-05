Received: from mail-bn1lp0154.outbound.protection.outlook.com ([207.46.163.154]:58616
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6837145Ab3IES4iJCF3q (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 5 Sep 2013 20:56:38 +0200
Message-ID: <5228D3B7.505@caviumnetworks.com>
Date: Thu, 5 Sep 2013 11:55:51 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] staging: octeon-ethernet: make dropped packets to
 consume NAPI budget
References: <1378406641-16530-1-git-send-email-aaro.koskinen@iki.fi> <1378406641-16530-2-git-send-email-aaro.koskinen@iki.fi>
In-Reply-To: <1378406641-16530-2-git-send-email-aaro.koskinen@iki.fi>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, richard@nod.at
Message-ID: <20130905185551.JyRNh_7sv92D4dkPjnqGMqqtKOKFLohfnjDb2WsIamg@z>

On 09/05/2013 11:43 AM, Aaro Koskinen wrote:
> We should count also dropped packets, otherwise the NAPI handler may
> end up running too long.

Is this actually a problem?

If so ... the patch looks sane and you and add Acked-by me.

>
> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> ---
>   drivers/staging/octeon/ethernet-rx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
> index 34afc16..10e5416 100644
> --- a/drivers/staging/octeon/ethernet-rx.c
> +++ b/drivers/staging/octeon/ethernet-rx.c
> @@ -303,6 +303,7 @@ static int cvm_oct_napi_poll(struct napi_struct *napi, int budget)
>   			if (backlog > budget * cores_in_use && napi != NULL)
>   				cvm_oct_enable_one_cpu();
>   		}
> +		rx_count++;
>
>   		skb_in_hw = USE_SKBUFFS_IN_HW && work->word2.s.bufs == 1;
>   		if (likely(skb_in_hw)) {
> @@ -429,7 +430,6 @@ static int cvm_oct_napi_poll(struct napi_struct *napi, int budget)
>   #endif
>   				}
>   				netif_receive_skb(skb);
> -				rx_count++;
>   			} else {
>   				/* Drop any packet received for a device that isn't up */
>   				/*
>

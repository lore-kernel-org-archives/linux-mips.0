Received: from mail-pf1-x444.google.com ([IPv6:2607:f8b0:4864:20::444]:40820
        "EHLO mail-pf1-x444.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992363AbeITOn6VRwXQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 20 Sep 2018 16:43:58 +0200
Received: by mail-pf1-x444.google.com with SMTP id s13-v6so4481164pfi.7
        for <linux-mips@linux-mips.org>; Thu, 20 Sep 2018 07:43:57 -0700 (PDT)
Date: Thu, 20 Sep 2018 07:43:41 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: [PATCH net-next 17/22] hv_netvsc: fix return type of
 ndo_start_xmit function
Message-ID: <20180920074341.3acef75c@xeon-e3>
In-Reply-To: <20180920123306.14772-18-yuehaibing@huawei.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
        <20180920123306.14772-18-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <stephen@networkplumber.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: YueHaibing <yuehaibing@huawei.com>
Cc: davem@davemloft.net, dmitry.tarnyagin@lockless.no, wg@grandegger.com, mkl@pengutronix.de, michal.simek@xilinx.com, hsweeten@visionengravers.com, madalin.bucur@nxp.com, pantelis.antoniou@gmail.com, claudiu.manoil@nxp.com, leoyang.li@nxp.com, linux@armlinux.org.uk, sammy@sammy.net, ralf@linux-mips.org, nico@fluxnic.net, steve.glendinning@shawell.net, f.fainelli@gmail.com, grygorii.strashko@ti.com, w-kwok2@ti.com, m-karicheri2@ti.com, t.sailer@alumni.ethz.ch, jreuter@yaina.de, kys@microsoft.com, haiyangz@microsoft.com, wei.liu2@citrix.com, paul.durrant@citrix.com, arvid.brodin@alten.se, pshelar@ovn.org, dev@openvswitch.org, linux-mips@linux-mips.org, xen-devel@lists.xenproject.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-can@vger.kernel.org, devel@linuxdriverproject.org, linux-hams@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Message-ID: <20180920144341.Ac64dSu0l9_nPkbVvio6lD_eJhMVPt6A0YuhpjO1ego@z>

On Thu, 20 Sep 2018 20:33:01 +0800
YueHaibing <yuehaibing@huawei.com> wrote:

> The method ndo_start_xmit() is defined as returning an 'netdev_tx_t',
> which is a typedef for an enum type, so make sure the implementation in
> this driver has returns 'netdev_tx_t' value, and change the function
> return type to netdev_tx_t.
> 
> Found by coccinelle.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/net/hyperv/netvsc_drv.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/hyperv/netvsc_drv.c b/drivers/net/hyperv/netvsc_drv.c
> index 3af6d8d..056c472 100644
> --- a/drivers/net/hyperv/netvsc_drv.c
> +++ b/drivers/net/hyperv/netvsc_drv.c
> @@ -511,7 +511,8 @@ static int netvsc_vf_xmit(struct net_device *net, struct net_device *vf_netdev,
>  	return rc;
>  }
>  
> -static int netvsc_start_xmit(struct sk_buff *skb, struct net_device *net)
> +static netdev_tx_t
> +netvsc_start_xmit(struct sk_buff *skb, struct net_device *net)
>  {
>  	struct net_device_context *net_device_ctx = netdev_priv(net);
>  	struct hv_netvsc_packet *packet = NULL;
> @@ -528,8 +529,11 @@ static int netvsc_start_xmit(struct sk_buff *skb, struct net_device *net)
>  	 */
>  	vf_netdev = rcu_dereference_bh(net_device_ctx->vf_netdev);
>  	if (vf_netdev && netif_running(vf_netdev) &&
> -	    !netpoll_tx_running(net))
> -		return netvsc_vf_xmit(net, vf_netdev, skb);
> +	    !netpoll_tx_running(net)) {
> +		ret = netvsc_vf_xmit(net, vf_netdev, skb);
> +		if (ret)
> +			return NETDEV_TX_BUSY;
> +	}

Sorry, the new code is wrong. It will fall through if ret == 0 (NETDEV_TX_OK)
Please review and test your patches.

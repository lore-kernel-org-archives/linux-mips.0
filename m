Received: from mail-cys01nam02on0118.outbound.protection.outlook.com ([104.47.37.118]:31552
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992408AbeITOkca3SBQ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 20 Sep 2018 16:40:32 +0200
From: Haiyang Zhang <haiyangz@microsoft.com>
Subject: RE: [PATCH net-next 17/22] hv_netvsc: fix return type of
 ndo_start_xmit function
Date: Thu, 20 Sep 2018 14:40:20 +0000
Message-ID: <BN6PR21MB016115A6ACD7D2685DC0070DCA130@BN6PR21MB0161.namprd21.prod.outlook.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
 <20180920123306.14772-18-yuehaibing@huawei.com>
In-Reply-To: <20180920123306.14772-18-yuehaibing@huawei.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <haiyangz@microsoft.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: YueHaibing <yuehaibing@huawei.com>, "davem@davemloft.net" <davem@davemloft.net>, "dmitry.tarnyagin@lockless.no" <dmitry.tarnyagin@lockless.no>, "wg@grandegger.com" <wg@grandegger.com>, "mkl@pengutronix.de" <mkl@pengutronix.de>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "hsweeten@visionengravers.com" <hsweeten@visionengravers.com>, "madalin.bucur@nxp.com" <madalin.bucur@nxp.com>, "pantelis.antoniou@gmail.com" <pantelis.antoniou@gmail.com>, "claudiu.manoil@nxp.com" <claudiu.manoil@nxp.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "sammy@sammy.net" <sammy@sammy.net>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "nico@fluxnic.net" <nico@fluxnic.net>, "steve.glendinning@shawell.net" <steve.glendinning@shawell.net>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>, "w-kwok2@ti.com" <w-kwok2@ti.com>, "m-karicheri2@ti.com" <m-karicheri2@ti.com>, "t.sailer@alumni.ethz.ch" <t.sailer@alumni.ethz.ch>, "jreuter@yaina.de" <jreuter@yaina.de>, KY Srinivasan <kys@microsoft.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "paul.durrant@citrix.com" <paul.durrant@citrix.com>, "arvid.brodin@alten.se" <arvid.brodin@alten.se>, "pshelar@ovn.org" <pshelar@ovn.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>, "devel@linuxdriverproject.org" <devel@linuxdriverproject.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "dev@openvswitch.org" <dev@openvswitch.org>
Message-ID: <20180920144020.2UJhv7iz8Oh3ltXwuTZ6LvLUee5jwLHT96uQ-ZDoRfY@z>



> -----Original Message-----
> From: YueHaibing <yuehaibing@huawei.com>
> Sent: Thursday, September 20, 2018 8:33 AM
> To: davem@davemloft.net; dmitry.tarnyagin@lockless.no;
> wg@grandegger.com; mkl@pengutronix.de; michal.simek@xilinx.com;
> hsweeten@visionengravers.com; madalin.bucur@nxp.com;
> pantelis.antoniou@gmail.com; claudiu.manoil@nxp.com; leoyang.li@nxp.com;
> linux@armlinux.org.uk; sammy@sammy.net; ralf@linux-mips.org;
> nico@fluxnic.net; steve.glendinning@shawell.net; f.fainelli@gmail.com;
> grygorii.strashko@ti.com; w-kwok2@ti.com; m-karicheri2@ti.com;
> t.sailer@alumni.ethz.ch; jreuter@yaina.de; KY Srinivasan <kys@microsoft.com>;
> Haiyang Zhang <haiyangz@microsoft.com>; wei.liu2@citrix.com;
> paul.durrant@citrix.com; arvid.brodin@alten.se; pshelar@ovn.org
> Cc: linux-kernel@vger.kernel.org; netdev@vger.kernel.org; linux-
> can@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linuxppc-
> dev@lists.ozlabs.org; linux-mips@linux-mips.org; linux-omap@vger.kernel.org;
> linux-hams@vger.kernel.org; devel@linuxdriverproject.org; linux-
> usb@vger.kernel.org; xen-devel@lists.xenproject.org; dev@openvswitch.org;
> YueHaibing <yuehaibing@huawei.com>
> Subject: [PATCH net-next 17/22] hv_netvsc: fix return type of ndo_start_xmit
> function
> 
> The method ndo_start_xmit() is defined as returning an 'netdev_tx_t', which is
> a typedef for an enum type, so make sure the implementation in this driver has
> returns 'netdev_tx_t' value, and change the function return type to netdev_tx_t.
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
> @@ -511,7 +511,8 @@ static int netvsc_vf_xmit(struct net_device *net, struct
> net_device *vf_netdev,
>  	return rc;
>  }
> 
> -static int netvsc_start_xmit(struct sk_buff *skb, struct net_device *net)
> +static netdev_tx_t
> +netvsc_start_xmit(struct sk_buff *skb, struct net_device *net)
>  {
>  	struct net_device_context *net_device_ctx = netdev_priv(net);
>  	struct hv_netvsc_packet *packet = NULL; @@ -528,8 +529,11 @@
> static int netvsc_start_xmit(struct sk_buff *skb, struct net_device *net)
>  	 */
>  	vf_netdev = rcu_dereference_bh(net_device_ctx->vf_netdev);
>  	if (vf_netdev && netif_running(vf_netdev) &&
> -	    !netpoll_tx_running(net))
> -		return netvsc_vf_xmit(net, vf_netdev, skb);
> +	    !netpoll_tx_running(net)) {
> +		ret = netvsc_vf_xmit(net, vf_netdev, skb);
> +		if (ret)
> +			return NETDEV_TX_BUSY;

For error case, please just return NETDEV_TX_OK. We are not sure if the 
error can go away after retrying, returning NETDEV_TX_BUSY may cause 
infinite retry from the upper layer.

Thanks,
- Haiyang

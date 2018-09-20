Received: from mail-bn3nam01on0107.outbound.protection.outlook.com ([104.47.33.107]:14050
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992241AbeITOudjwMGQ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 20 Sep 2018 16:50:33 +0200
From: Haiyang Zhang <haiyangz@microsoft.com>
Subject: RE: [PATCH net-next 17/22] hv_netvsc: fix return type of
 ndo_start_xmit function
Date: Thu, 20 Sep 2018 14:50:23 +0000
Message-ID: <BN6PR21MB016180C794F26A279345A17FCA130@BN6PR21MB0161.namprd21.prod.outlook.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
        <20180920123306.14772-18-yuehaibing@huawei.com>
 <20180920074341.3acef75c@xeon-e3>
In-Reply-To: <20180920074341.3acef75c@xeon-e3>
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
To: Stephen Hemminger <stephen@networkplumber.org>, YueHaibing <yuehaibing@huawei.com>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "dmitry.tarnyagin@lockless.no" <dmitry.tarnyagin@lockless.no>, "wg@grandegger.com" <wg@grandegger.com>, "mkl@pengutronix.de" <mkl@pengutronix.de>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "hsweeten@visionengravers.com" <hsweeten@visionengravers.com>, "madalin.bucur@nxp.com" <madalin.bucur@nxp.com>, "pantelis.antoniou@gmail.com" <pantelis.antoniou@gmail.com>, "claudiu.manoil@nxp.com" <claudiu.manoil@nxp.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "sammy@sammy.net" <sammy@sammy.net>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "nico@fluxnic.net" <nico@fluxnic.net>, "steve.glendinning@shawell.net" <steve.glendinning@shawell.net>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>, "w-kwok2@ti.com" <w-kwok2@ti.com>, "m-karicheri2@ti.com" <m-karicheri2@ti.com>, "t.sailer@alumni.ethz.ch" <t.sailer@alumni.ethz.ch>, "jreuter@yaina.de" <jreuter@yaina.de>, KY Srinivasan <kys@microsoft.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "paul.durrant@citrix.com" <paul.durrant@citrix.com>, "arvid.brodin@alten.se" <arvid.brodin@alten.se>, "pshelar@ovn.org" <pshelar@ovn.org>, "dev@openvswitch.org" <dev@openvswitch.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, "devel@linuxdriverproject.org" <devel@linuxdriverproject.org>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20180920145023.c0uz0Bhkm-ihK1vee0Rqfsk1sOyoWMdDycQZKmyNm9A@z>



> -----Original Message-----
> From: Stephen Hemminger <stephen@networkplumber.org>
> Sent: Thursday, September 20, 2018 10:44 AM
> To: YueHaibing <yuehaibing@huawei.com>
> Cc: davem@davemloft.net; dmitry.tarnyagin@lockless.no;
> wg@grandegger.com; mkl@pengutronix.de; michal.simek@xilinx.com;
> hsweeten@visionengravers.com; madalin.bucur@nxp.com;
> pantelis.antoniou@gmail.com; claudiu.manoil@nxp.com; leoyang.li@nxp.com;
> linux@armlinux.org.uk; sammy@sammy.net; ralf@linux-mips.org;
> nico@fluxnic.net; steve.glendinning@shawell.net; f.fainelli@gmail.com;
> grygorii.strashko@ti.com; w-kwok2@ti.com; m-karicheri2@ti.com;
> t.sailer@alumni.ethz.ch; jreuter@yaina.de; KY Srinivasan <kys@microsoft.com>;
> Haiyang Zhang <haiyangz@microsoft.com>; wei.liu2@citrix.com;
> paul.durrant@citrix.com; arvid.brodin@alten.se; pshelar@ovn.org;
> dev@openvswitch.org; linux-mips@linux-mips.org; xen-
> devel@lists.xenproject.org; netdev@vger.kernel.org; linux-usb@vger.kernel.org;
> linux-kernel@vger.kernel.org; linux-can@vger.kernel.org;
> devel@linuxdriverproject.org; linux-hams@vger.kernel.org; linux-
> omap@vger.kernel.org; linuxppc-dev@lists.ozlabs.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH net-next 17/22] hv_netvsc: fix return type of
> ndo_start_xmit function
> 
> On Thu, 20 Sep 2018 20:33:01 +0800
> YueHaibing <yuehaibing@huawei.com> wrote:
> > int netvsc_start_xmit(struct sk_buff *skb, struct net_device *net)
> >  	 */
> >  	vf_netdev = rcu_dereference_bh(net_device_ctx->vf_netdev);
> >  	if (vf_netdev && netif_running(vf_netdev) &&
> > -	    !netpoll_tx_running(net))
> > -		return netvsc_vf_xmit(net, vf_netdev, skb);
> > +	    !netpoll_tx_running(net)) {
> > +		ret = netvsc_vf_xmit(net, vf_netdev, skb);
> > +		if (ret)
> > +			return NETDEV_TX_BUSY;
> > +	}
> 
> Sorry, the new code is wrong. It will fall through if ret == 0 (NETDEV_TX_OK)
> Please review and test your patches.

Plus consideration of -- For error case, please just return NETDEV_TX_OK. We 
are not sure if the error can go away after retrying, returning NETDEV_TX_BUSY 
may cause infinite retry from the upper layer.

So, let's just always return NETDEV_TX_OK like this:
		netvsc_vf_xmit(net, vf_netdev, skb);
		return NETDEV_TX_OK;

Thanks,
- Haiyang

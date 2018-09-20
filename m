Received: from fllv0015.ext.ti.com ([198.47.19.141]:37962 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992408AbeITRFdkVEPe (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 20 Sep 2018 19:05:33 +0200
Subject: Re: [PATCH net-next 00/22] net: fix return type of ndo_start_xmit
 function
References: <20180920123306.14772-1-yuehaibing@huawei.com>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <46f95cf9-8f8f-e3ab-3142-947faeee9fa9@ti.com>
Date: Thu, 20 Sep 2018 12:04:58 -0500
MIME-Version: 1.0
In-Reply-To: <20180920123306.14772-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <grygorii.strashko@ti.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: YueHaibing <yuehaibing@huawei.com>, davem@davemloft.net, dmitry.tarnyagin@lockless.no, wg@grandegger.com, mkl@pengutronix.de, michal.simek@xilinx.com, hsweeten@visionengravers.com, madalin.bucur@nxp.com, pantelis.antoniou@gmail.com, claudiu.manoil@nxp.com, leoyang.li@nxp.com, linux@armlinux.org.uk, sammy@sammy.net, ralf@linux-mips.org, nico@fluxnic.net, steve.glendinning@shawell.net, f.fainelli@gmail.com, w-kwok2@ti.com, m-karicheri2@ti.com, t.sailer@alumni.ethz.ch, jreuter@yaina.de, kys@microsoft.com, haiyangz@microsoft.com, wei.liu2@citrix.com, paul.durrant@citrix.com, arvid.brodin@alten.se, pshelar@ovn.org
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mips@linux-mips.org, linux-omap@vger.kernel.org, linux-hams@vger.kernel.org, devel@linuxdriverproject.org, linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, dev@openvswitch.org
Message-ID: <20180920170458.8STgh0XZRXWyr6tW1baRN_uLyf86wvJ-j7YHC-Myml0@z>



On 09/20/2018 07:32 AM, YueHaibing wrote:
> The method ndo_start_xmit() is defined as returning an 'netdev_tx_t',
> which is a typedef for an enum type, so make sure the implementation in
> this driver has returns 'netdev_tx_t' value, and change the function
> return type to netdev_tx_t.
> 

May be I missed smth, but it's acceptable to report standard error codes from
.xmit() callback as per dev_xmit_complete().

-- 
regards,
-grygorii

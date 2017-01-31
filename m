Received: from mail-sn1nam01on0077.outbound.protection.outlook.com ([104.47.32.77]:11840
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993899AbdAaTcYclwvi convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 31 Jan 2017 20:32:24 +0100
From: Bart Van Assche <Bart.VanAssche@sandisk.com>
Subject: Re: [PATCH 4.10-rc3 09/13] iscsi: fix build errors when
 linux/phy*.h is removed from net/dsa.h
Date: Tue, 31 Jan 2017 19:32:10 +0000
Message-ID: <1485891116.3113.2.camel@sandisk.com>
References: <20170131191704.GA8281@n2100.armlinux.org.uk>
         <E1cYdxN-0000Wr-AS@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1cYdxN-0000Wr-AS@rmk-PC.armlinux.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C15BF99F1975BB4F8A878C6D0FDBB237@sandisk.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Bart.VanAssche@sandisk.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "nab@linux-iscsi.org" <nab@linux-iscsi.org>
Message-ID: <20170131193210.GyZ8pQ-NDxBxM78vGjvGRvyuO1Mzw8SZ1hwIIjlLiHc@z>

On Tue, 2017-01-31 at 19:19 +0000, Russell King wrote:
> drivers/target/iscsi/iscsi_target_login.c:1135:7: error: implicit declaration of function 'try_module_get' [-Werror=implicit-function-declaration]
> 
> Add linux/module.h to iscsi_target_login.c.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/target/iscsi/iscsi_target_login.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/target/iscsi/iscsi_target_login.c b/drivers/target/iscsi/iscsi_target_login.c
> index 450f51deb2a2..eab274d17b5c 100644
> --- a/drivers/target/iscsi/iscsi_target_login.c
> +++ b/drivers/target/iscsi/iscsi_target_login.c
> @@ -17,6 +17,7 @@
>   ******************************************************************************/
>  
>  #include <crypto/hash.h>
> +#include <linux/module.h>
>  #include <linux/string.h>
>  #include <linux/kthread.h>
>  #include <linux/idr.h>

Reviewed-by: Bart Van Assche <bart.vanassche@sandisk.com>

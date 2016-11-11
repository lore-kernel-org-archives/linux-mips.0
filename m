Received: from mail-bn3nam01on0056.outbound.protection.outlook.com ([104.47.33.56]:53280
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992105AbcKKI5b6wyZo (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 11 Nov 2016 09:57:31 +0100
Date: Fri, 11 Nov 2016 09:57:07 +0100
From: Jan Glauber <jan.glauber@caviumnetworks.com>
Subject: Re: [PATCH 2/2] i2c: octeon: Fix waiting for operation completion
Message-ID: <20161111085707.GC16907@hardcore>
References: <20161107200921.30284-1-paul.burton@imgtec.com>
 <20161107200921.30284-2-paul.burton@imgtec.com>
 <20161109134103.GC2960@hardcore>
 <1595446.2T31j1Ekg5@np-p-burton>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline
In-Reply-To: <1595446.2T31j1Ekg5@np-p-burton>
Return-Path: <Jan.Glauber@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-i2c@vger.kernel.org, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>, Peter Swain <pswain@cavium.com>, Wolfram Sang <wsa@the-dreams.de>, "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <20161111085707.q8P71DEEFNYsuTX_UVIqFQU-4kvFOFB1aTM3ZOcnlec@z>

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

> As you can see octeon_i2c_driver_init never returns. Are you able to test on 
> one of your MIPS-based systems?
> 
> Thanks,
>     Paul

Hi Paul,

we can reproduce the problem on our side, but I don't have direct access
to a MIPS system so I'm still just guessing what happens. If you want
you can try the attached patches.

I'm trying to get rid of the polling around the interrupt altogether.
It works fine on Thunderx, sometimes I run into an interrupt timeout 
after a lost-arbitration but recovery/retry is able to clean that up.

Please also revert 70121f7 as before. The last patch adds some debugging
output to see if we run into timeouts or recovery.

thanks,
Jan

--T4sUOijqQbZv57TR
Content-Type: text/x-diff; charset="us-ascii"
Content-Disposition: attachment;
	filename="0001-i2c-octeon-thunderx-TWSI-software-reset-in-recovery.patch"


--T4sUOijqQbZv57TR--

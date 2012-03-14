Received: from wolverine01.qualcomm.com ([199.106.114.254]:14345 "EHLO
        wolverine01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1903740Ab2CNSdS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 14 Mar 2012 19:33:18 +0100
Date: Wed, 14 Mar 2012 11:33:11 -0700
From: "Luis R. Rodriguez" <rodrigue@qca.qualcomm.com>
Subject: Re: [PATCH v2 13/13] MIPS: ath79: add initial support for the
 Atheros DB120 board
Message-ID: <20120314183311.GA8265@tux>
References: <1331721931-4334-1-git-send-email-juhosg@openwrt.org>
 <1331721931-4334-14-git-send-email-juhosg@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1331721931-4334-14-git-send-email-juhosg@openwrt.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Gabor Juhos <juhosg@openwrt.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, mcgrof@infradead.org
Message-ID: <20120314183311.lBvg3Xb_4UjpKsIljxV0OfnxIc1dx4HnrxdEltUdqms@z>

On Wed, Mar 14, 2012 at 11:45:31AM +0100, Gabor Juhos wrote:
> Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
> Acked-by: Luis R. Rodriguez <mcgrof@qca.qualcomm.com>
> ---
> v2: - remove USB controller registration, it will be added
>       by a separate patch-set
> 
> Ralf,
> 
> The mach-db120.c file is licensed under the Clear BSD license. That
> is based on the modified BSD license and the FSF's [1] site states
> that it is compatible with both the GPLv2 and GPLv3.
> 
> However if you have concerns about the copyright we can resubmit
> this file under the ISC license [2]. The ISC license is already
> used upstream by the ath6kl and ath9k drivers.
> 
> Thanks,
> Gabor
> 
> 1. http://www.gnu.org/licenses/license-list.html#clearbsd
> 2. http://www.gnu.org/licenses/license-list.html#ISC

Gabor, please resubmit under the ISC license. The patch
has been pending since December and I really do not
want to wait any longer. You can just resubmit this
one single patch.

  Luis

Received: from mail-bn1bon0066.outbound.protection.outlook.com ([157.56.111.66]:15676
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27012670AbbHKUM6pM2UF (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 11 Aug 2015 22:12:58 +0200
Date: Tue, 11 Aug 2015 22:12:37 +0200
From: Robert Richter <robert.richter@caviumnetworks.com>
Subject: Re: [PATCH v2 0/2] net: thunder: Add ACPI support.
Message-ID: <20150811201237.GW4914@rric.localhost>
References: <1439254717-2875-1-git-send-email-ddaney.cavm@gmail.com>
 <20150811.114908.1384923604512568161.davem@davemloft.net>
 <55CA5567.9010002@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <55CA5567.9010002@caviumnetworks.com>
Return-Path: <Robert.Richter@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney@caviumnetworks.com>
Cc: David Miller <davem@davemloft.net>, ddaney.cavm@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, tomasz.nowicki@linaro.org, sgoutham@cavium.com, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, mark.rutland@arm.com, rafael@kernel.org, david.daney@cavium.com
Message-ID: <20150811201237.l1PDGtWmCTF37O6LHZu4mCnF_QR9eglzPZMGmf3dJRA@z>

On 11.08.15 13:04:55, David Daney wrote:
> >In the future it might be better structured to try and get the OF
> >node, and if that fails then try and use the ACPI method to obtain
> >these values.
> 
> Our current approach, as you can see in the patch, is the opposite.  If ACPI
> is being used, prefer that over the OF device tree.
> 
> You seem to be recommending precedence for OF.  It should be consistent
> across all drivers/sub-systems, so do you really think that OF before ACPI
> is the way to go?

If ACPI is enabled then no OF function may be called at all.

With !ACPI or acpi=no kernel parameter, then acpi_disabled is set and
no ACPI function should be called. It always falls back to and only
uses OF/devicetree in this case.

So there is now way to try devicetree first and then use acpi or vice
versa. There is no mixup using acpi or devicetree with the same boot,
either one or the other.

-Robert

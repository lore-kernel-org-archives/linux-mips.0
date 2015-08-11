Received: from mail-by2on0081.outbound.protection.outlook.com ([207.46.100.81]:7392
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27012670AbbHKUFKzU8OF (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 11 Aug 2015 22:05:10 +0200
Message-ID: <55CA5567.9010002@caviumnetworks.com>
Date: Tue, 11 Aug 2015 13:04:55 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] net: thunder: Add ACPI support.
References: <1439254717-2875-1-git-send-email-ddaney.cavm@gmail.com> <20150811.114908.1384923604512568161.davem@davemloft.net>
In-Reply-To: <20150811.114908.1384923604512568161.davem@davemloft.net>
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
To: David Miller <davem@davemloft.net>
Cc: ddaney.cavm@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, rrichter@cavium.com, tomasz.nowicki@linaro.org, sgoutham@cavium.com, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, mark.rutland@arm.com, rafael@kernel.org, david.daney@cavium.com
Message-ID: <20150811200455._zKAmRlRZR0LvNG3RvDaT0GVUFMBJj6xfYkkDfGHW50@z>

On 08/11/2015 11:49 AM, David Miller wrote:
> From: David Daney <ddaney.cavm@gmail.com>
> Date: Mon, 10 Aug 2015 17:58:35 -0700
>
>> Change from v1:  Drop PHY binding part, use fwnode_property* APIs.
>>
>> The first patch (1/2) rearranges the existing code a little with no
>> functional change to get ready for the second.  The second (2/2) does
>> the actual work of adding support to extract the needed information
>> from the ACPI tables.
>
> Series applied.

Thank you very much.

>
> In the future it might be better structured to try and get the OF
> node, and if that fails then try and use the ACPI method to obtain
> these values.

Our current approach, as you can see in the patch, is the opposite.  If 
ACPI is being used, prefer that over the OF device tree.

You seem to be recommending precedence for OF.  It should be consistent 
across all drivers/sub-systems, so do you really think that OF before 
ACPI is the way to go?

Thanks,
David Daney

Received: from mail-bl2on0099.outbound.protection.outlook.com ([65.55.169.99]:47552
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27007608AbbKXSNjBHOdB (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 24 Nov 2015 19:13:39 +0100
Message-ID: <5654A8C6.3070306@caviumnetworks.com>
Date: Tue, 24 Nov 2015 10:13:26 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH v4] mmc: OCTEON: Add host driver for OCTEON MMC controller
References: <1426518362-24349-1-git-send-email-aleksey.makarov@auriga.com> <20150518210514.GG609@fuloong-minipc.musicnaut.iki.fi> <555A5C5C.9090903@auriga.com> <20151120173233.GH18138@blackmetal.musicnaut.iki.fi>
In-Reply-To: <20151120173233.GH18138@blackmetal.musicnaut.iki.fi>
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
Cc: Aleksey Makarov <aleksey.makarov@auriga.com>, linux-mmc@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Chandrakala Chavva <cchavva@caviumnetworks.com>, Leonid Rosenboim <lrosenboim@caviumnetworks.com>, Peter Swain <pswain@cavium.com>, Aaron Williams <aaron.williams@cavium.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Chris Ball <chris@printf.net>, Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org
Message-ID: <20151124181326.2fx4SkJfeaJ3KbzBQbrXRf1EZ8T8RMf0kFMgbdtajgc@z>

On 11/20/2015 09:32 AM, Aaro Koskinen wrote:
> Hi,
>
> On Mon, May 18, 2015 at 02:40:44PM -0700, Aleksey Makarov wrote:
>> On 05/18/2015 02:05 PM, Aaro Koskinen wrote:
>>> On Mon, Mar 16, 2015 at 06:06:00PM +0300, Aleksey Makarov wrote:
>>>> The OCTEON MMC controller is currently found on cn61XX and cnf71XX
>>>> devices.  Device parameters are configured from device tree data.
>>>>
>>>> eMMC, MMC and SD devices are supported.
>>>>
>>>> Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>
>>>> Signed-off-by: Chandrakala Chavva <cchavva@caviumnetworks.com>
>>>> Signed-off-by: David Daney <david.daney@cavium.com>
>>>> Signed-off-by: Aleksey Makarov <aleksey.makarov@auriga.com>
>>>> Signed-off-by: Leonid Rosenboim <lrosenboim@caviumnetworks.com>
>>>> Signed-off-by: Peter Swain <pswain@cavium.com>
>>>> Signed-off-by: Aaron Williams <aaron.williams@cavium.com>
>>>> ---
>>>
>>> Any updates on this patch? Are you still working on it for
>>> the mainline kernel inclusion?
>>
>> We are working on it.  It will also be used in ARM ThunderX arch.  So we
>> will send a new version soon.
>
> Any updates?
>
> Also distros are waiting for this patch, MMC is the main medium on
> some boards:
>
> 	https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=800594

I am aware of the need, but haven't been able to find the time to work 
on the MMC patch.

David Daney


>
> A.
>

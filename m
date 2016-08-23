Received: from mail-dm3nam03on0068.outbound.protection.outlook.com ([104.47.41.68]:27386
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23991963AbcHWT7p628r2 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 23 Aug 2016 21:59:45 +0200
Message-ID: <57BCAB27.8060502@caviumnetworks.com>
Date: Tue, 23 Aug 2016 12:59:35 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH V8 2/2] mmc: OCTEON: Add host driver for OCTEON MMC controller.
References: <57853474.9050108@cavium.com> <CAPDyKFqaGLWxkG+CqViqDfPqeffKE5rutgR0gduuGs9F0DX+zg@mail.gmail.com> <57BC8ACA.1040506@caviumnetworks.com> <CAPDyKFp047jKEZngegTxk1grvwPivqj+tqAX1ekF82s1zDE53Q@mail.gmail.com>
In-Reply-To: <CAPDyKFp047jKEZngegTxk1grvwPivqj+tqAX1ekF82s1zDE53Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Steven J. Hill" <steven.hill@cavium.com>, linux-mmc <linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-mips@linux-mips.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20160823195935.ctJMdLAXzXDASAVZMSEwmre3SZ3NSRFHKtY6yEyFoJQ@z>

On 08/23/2016 12:46 PM, Ulf Hansson wrote:
> On 23 August 2016 at 19:41, David Daney <ddaney@caviumnetworks.com> wrote:
>> On 08/23/2016 07:53 AM, Ulf Hansson wrote:
>>>
>>> On 12 July 2016 at 20:18, Steven J. Hill <steven.hill@cavium.com> wrote:
>>
>> [...]
>>
>>>> +#include <asm/byteorder.h>
>>>> +#include <asm/octeon/octeon.h>
>>>
>>>
>>
>> OK, we will duplicate any needed definitions from octeon.h into the driver
>> source file.
>
> Why can't you share it via a platfrom data header at
> include/linux/platform_data/* ?
>

It isn't "platform_data", it is register layout definitions (thousands 
of lines of them), so I don't think it it appropriate to place in 
include/linux.

I think the cleanest approach is to put the register definitions in the 
driver file, which is the only user, and delete the definition header 
files in arch/mips/include/...

David.

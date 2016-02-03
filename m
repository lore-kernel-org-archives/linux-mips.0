Received: from mail-bl2on0055.outbound.protection.outlook.com ([65.55.169.55]:47232
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27011683AbcBCR5PCBJTz (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 3 Feb 2016 18:57:15 +0100
Message-ID: <56B23F70.80308@caviumnetworks.com>
Date: Wed, 3 Feb 2016 09:57:04 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Octeon: Add Octeon III CN7XXX interface detection
References: <1454412318-27213-1-git-send-email-Zubair.Kakakhel@imgtec.com> <56B09528.1030902@cogentembedded.com> <56B23CB2.5090805@imgtec.com> <56B23E44.7080304@cogentembedded.com>
In-Reply-To: <56B23E44.7080304@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, david.daney@cavium.com, janne.huttunen@nokia.com, aaro.koskinen@nokia.com, ralf@linux-mips.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20160203175704.E53xY4eFuFdBuh7LZaba1Po869aKCnt6desIXjXQ7t8@z>

On 02/03/2016 09:52 AM, Sergei Shtylyov wrote:
> On 02/03/2016 08:45 PM, Zubair Lutfullah Kakakhel wrote:
>
>>>> Add basic CN7XXX interface detection.
>>>>
>>>> This allows the kernel to boot with ethernet working as it initializes
>>>> the ethernet ports with SGMII instead of defaulting to RGMII routines.
>>>>
>>>> Tested on the utm8 from Rhino Labs with a CN7130.
>>>>
>>>> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>>>> ---
>>>>   arch/mips/cavium-octeon/executive/cvmx-helper.c | 41
>>>> +++++++++++++++++++++++++
>>>>   1 file changed, 41 insertions(+)
>>>>
>>>> diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper.c
>>>> b/arch/mips/cavium-octeon/executive/cvmx-helper.c
>>>> index 376701f..1a28009 100644
>>>> --- a/arch/mips/cavium-octeon/executive/cvmx-helper.c
>>>> +++ b/arch/mips/cavium-octeon/executive/cvmx-helper.c
>>> [...]
>>>> @@ -260,6 +262,39 @@ static cvmx_helper_interface_mode_t
>>>> __cvmx_get_mode_octeon2(int interface)
>>>>   }
>>>>
>>>>   /**
>>>> + * @INTERNAL
>>>> + * Return interface mode for CN7XXX.
>>>> + */
>>>> +static cvmx_helper_interface_mode_t __cvmx_get_mode_cn7xxx(int
>>>> interface)
>>>
>>>     Not *unsigned*?
>>
>> The rest of the instances in the file don't have unsigned.
>>
>> Probably because it is an enum..
>
>     I meant the parameter, of course.
>

In this file, the "interface" is consistently given the type int.  Check 
it out, it is int everywhere.

I think it makes sense to maintain consistency and use int here too.

David Daney


> [...]
>
>> (⌐▀͡ ̯ʖ▀)
>>
>> Thanks
>> ZubairLK
>
> [...]
>
> MBR, Sergei
>

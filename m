Received: from mailapp01.imgtec.com ([195.59.15.196]:11906 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993637AbdCANr7trEBl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 1 Mar 2017 14:47:59 +0100
Subject: Re: [PATCH 1/4] MIPS: Handle non word sized instructions when
 examining frame
References: <1488296279-23057-1-git-send-email-matt.redfearn@imgtec.com>
 <1488296279-23057-2-git-send-email-matt.redfearn@imgtec.com>
 <alpine.DEB.2.00.1702282050410.26999@tp.orcam.me.uk>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <8cf06c75-4536-3296-7413-e2dce407e8ab@imgtec.com>
Date: Wed, 1 Mar 2017 13:47:53 +0000
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1702282050410.26999@tp.orcam.me.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Maciej W. Rozycki" <macro@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170301134753.g9EgNIdwlWl4N4EXvjbirYaZlx9X5GHfGCjZ8iBE2cQ@z>

Hi Maciej


On 28/02/17 20:54, Maciej W. Rozycki wrote:
> On Tue, 28 Feb 2017, Matt Redfearn wrote:
>
>> Since the instruction modifying the stack pointer is usually the first
>> in the function, that one is ususally handled correctly. But the
>   s/ususally/usually/

oops

>
>> diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
>> index 803e255b6fc3..5b1e932ae973 100644
>> --- a/arch/mips/kernel/process.c
>> +++ b/arch/mips/kernel/process.c
>> @@ -347,6 +347,7 @@ static int get_frame_info(struct mips_frame_info *info)
>>   	union mips_instruction insn, *ip, *ip_end;
>>   	const unsigned int max_insns = 128;
>>   	unsigned int i;
>> +	unsigned int last_insn_size = 0;
>   Please keep declarations in the reverse Christmas tree order, i.e. swap
> the last two.
>
>    Maciej

OK, no problem.
Thanks,
Matt

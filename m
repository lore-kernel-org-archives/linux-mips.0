Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:36022 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990425AbeDQNUBsGZ3P (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 Apr 2018 15:20:01 +0200
Subject: Re: [PATCH 1/2] MIPS: memset.S: EVA & fault support for small_memset
References: <1522315704-31641-1-git-send-email-matt.redfearn@mips.com>
 <1522315704-31641-2-git-send-email-matt.redfearn@mips.com>
 <20180416202234.GA23881@saruman>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <cc6ab882-6862-2cdc-fdaf-cf0d0ba22728@mips.com>
Date: Tue, 17 Apr 2018 14:20:07 +0100
MIME-Version: 1.0
In-Reply-To: <20180416202234.GA23881@saruman>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, stable@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20180417132007.ywBLXPuAgwHOCPjZqJoonfbRENRjt8KxyDp_MzrrSBU@z>

Hi James,

On 16/04/18 21:22, James Hogan wrote:
> On Thu, Mar 29, 2018 at 10:28:23AM +0100, Matt Redfearn wrote:
>> @@ -260,6 +260,11 @@
>>   	jr		ra
>>   	andi		v1, a2, STORMASK
> 
> This patch looks good, well spotted!
> 
> But whats that v1 write about? Any ideas? Seems to go back to the git
> epoch, and $3 isn't in the clobber lists when __bzero* is called.

No idea what the original intent was, but I've verified that v1 does 
indeed get clobbered if this path is hit. Patch incoming!

Thanks,
Matt

> 
> Cheers
> James
> 
>>   
>> +.Lsmall_fixup\@:
>> +	PTR_SUBU	a2, t1, a0
>> +	jr		ra
>> +	 PTR_ADDIU	a2, 1
>> +

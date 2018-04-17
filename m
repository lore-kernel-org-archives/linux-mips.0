Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:60890 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990425AbeDQNVOoWEiP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 Apr 2018 15:21:14 +0200
Subject: Re: [PATCH 2/2] MIPS: memset.S: Fix return of __clear_user from
 Lpartial_fixup
References: <1522315704-31641-1-git-send-email-matt.redfearn@mips.com>
 <1522315704-31641-3-git-send-email-matt.redfearn@mips.com>
 <20180416221340.GB23881@saruman>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <db826cd2-1b15-9577-6504-84cd9f6b08cd@mips.com>
Date: Tue, 17 Apr 2018 14:21:22 +0100
MIME-Version: 1.0
In-Reply-To: <20180416221340.GB23881@saruman>
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
Message-ID: <20180417132122.iGSEZt4vh1Bvt5YzOCdTckU6ronw6pyj9-Ah5OnPVkY@z>

Hi James,

On 16/04/18 23:13, James Hogan wrote:
> On Thu, Mar 29, 2018 at 10:28:24AM +0100, Matt Redfearn wrote:
>> The __clear_user function is defined to return the number of bytes that
>> could not be cleared. From the underlying memset / bzero implementation
>> this means setting register a2 to that number on return. Currently if a
>> page fault is triggered within the memset_partial block, the value
>> loaded into a2 on return is meaningless.
>>
>> The label .Lpartial_fixup\@ is jumped to on page fault. Currently it
>> masks the remaining count of bytes (a2) with STORMASK, meaning that the
>> least significant 2 (32bit) or 3 (64bit) bits of the remaining count are
>> always clear.
> 
> Are you sure about that. It seems to do that *to ensure those bits are
> set correctly*...
> 
>> Secondly, .Lpartial_fixup\@ expects t1 to contain the end address of the
>> copy. This is set up by the initial block:
>> 	PTR_ADDU	t1, a0			/* end address */
>> However, the .Lmemset_partial\@ block then reuses register t1 to
>> calculate a jump through a block of word copies. This leaves it no
>> longer containing the end address of the copy operation if a page fault
>> occurs, and the remaining bytes calculation is incorrect.
>>
>> Fix these issues by removing the and of a2 with STORMASK, and replace t1
>> with register t2 in the .Lmemset_partial\@ block.
>>
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
>> ---
>>
>>   arch/mips/lib/memset.S | 9 ++++-----
>>   1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/mips/lib/memset.S b/arch/mips/lib/memset.S
>> index 90bcdf1224ee..3257dca58cad 100644
>> --- a/arch/mips/lib/memset.S
>> +++ b/arch/mips/lib/memset.S
>> @@ -161,19 +161,19 @@
>>   
>>   .Lmemset_partial\@:
>>   	R10KCBARRIER(0(ra))
>> -	PTR_LA		t1, 2f			/* where to start */
>> +	PTR_LA		t2, 2f			/* where to start */
>>   #ifdef CONFIG_CPU_MICROMIPS
>>   	LONG_SRL	t7, t0, 1
> 
> Hmm, on microMIPS t7 isn't on the clobber list for __bzero, and nor is
> t8...
> 
>>   #endif
>>   #if LONGSIZE == 4
>> -	PTR_SUBU	t1, FILLPTRG
>> +	PTR_SUBU	t2, FILLPTRG
>>   #else
>>   	.set		noat
>>   	LONG_SRL	AT, FILLPTRG, 1
>> -	PTR_SUBU	t1, AT
>> +	PTR_SUBU	t2, AT
>>   	.set		at
>>   #endif
>> -	jr		t1
>> +	jr		t2
>>   	PTR_ADDU	a0, t0			/* dest ptr */
> 
> ^^^ note this...
> 
>>   
>>   	.set		push
>> @@ -250,7 +250,6 @@
>>   
>>   .Lpartial_fixup\@:
>>   	PTR_L		t0, TI_TASK($28)
>> -	andi		a2, STORMASK
> 
> ... this isn't right.
> 
> If I read correctly, t1 (after the above change stops clobbering it) is
> the end of the full 64-byte blocks, i.e. the start address of the final
> partial block.
> 
> 
> The .Lfwd_fixup calculation (for full blocks) appears to be:
> 
>    a2 = ((len & 0x3f) + start_of_partial) - badvaddr
> 
> which is spot on. (len & 0x3f) is the partial block and remaining bytes
> that haven't been set yet, add start_of_partial to get end of the full
> range, subtract bad address to find how much didn't copy.
> 
> 
> The calculation for .Lpartial_fixup however appears to (currently) do:
> 
>    a2 = ((len & STORMASK) + start_of_partial) - badvaddr
> 
> Which might make sense if start_of_partial (t1) was replaced with
> end_of_partial, which does seem to be calculated as noted above, and put
> in a0 ready for the final few bytes to be set.
> 
>>   	LONG_L		t0, THREAD_BUADDR(t0)
>>   	LONG_ADDU	a2, t1
> 
> ^^ So I think either it needs to just s/t1/a0/ here and not bother
> preserving t1 above (smaller change and probably the original intent),
> or preserve t1 and mask 0x3f instead of STORMASK like .Lfwd_fixup does
> (which would work but seems needlessly complicated to me).
> 
> Does that make any sense or have I misunderstood some subtlety?

Thanks for taking the time to work this through - you're right, changing 
t1 to a0 in the fault handler does give the right result and is much 
less invasive.  Updated patch incoming :-)

Thanks,
Matt


> 
> Cheers
> James
> 
>>   	jr		ra
>> -- 
>> 2.7.4
>>

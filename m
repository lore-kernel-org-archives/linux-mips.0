Received: from mail-by2lp0236.outbound.protection.outlook.com ([207.46.163.236]:23005
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6843069AbaEUQKtdVWiB (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 21 May 2014 18:10:49 +0200
Message-ID: <537CCFFF.2080707@caviumnetworks.com>
Date: Wed, 21 May 2014 09:10:39 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 06/15] MIPS: Add minimal support for OCTEON3 to c-r4k.c
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com> <1400597236-11352-7-git-send-email-andreas.herrmann@caviumnetworks.com> <537C7A12.7020606@imgtec.com>
In-Reply-To: <537C7A12.7020606@imgtec.com>
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
To: James Hogan <james.hogan@imgtec.com>
Cc: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, linux-mips@linux-mips.org, David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140521161039.o90Z6mV8oSAKECXNWYqk8H6JAoWJX15f8FCleztTbpI@z>

On 05/21/2014 03:04 AM, James Hogan wrote:
> On 20/05/14 15:47, Andreas Herrmann wrote:
>> From: David Daney <david.daney@cavium.com>
>>
>> These are needed to boot a generic mips64r2 kernel on OCTEONIII.
>>
>> Signed-off-by: David Daney <david.daney@cavium.com>
>> Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
>> ---
>>   arch/mips/include/asm/r4kcache.h |    2 ++
>>   arch/mips/mm/c-r4k.c             |   32 ++++++++++++++++++++++++++++++++
>>   2 files changed, 34 insertions(+)
>
>> diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
>> index 1c74a6a..789ede9 100644
>> --- a/arch/mips/mm/c-r4k.c
>> +++ b/arch/mips/mm/c-r4k.c
>
>> @@ -1094,6 +1110,21 @@ static void probe_pcache(void)
>>   		c->dcache.waybit = 0;
>>   		break;
>>
>> +	case CPU_CAVIUM_OCTEON3:
>> +		/* For now lie about the number of ways. */
>
> Is this to work around the finite length of way_string[]?
>
> Can we fix that to be more dynamic instead? (admittedly special casing
> "direct mapped" looks like a bit of a pain).

The OCTEON ICache is a weird size that is not (and I think cannot be) 
represented by the CP0_Config* bits.  However, it doesn't matter, as any 
operation that attempts to invalidate any part of it, operates on the 
entire cache, so everything works out in the end.

The DCache is fully coherent, so any invalidate/flush operations are 
redundant.

So for both of these, we just need to supply values that are both 
plausible, and don't result in panics and/or OOPS messages being printed.


>
> Cheers
> James
>
>> +		c->icache.linesz = 128;
>> +		c->icache.sets = 16;
>> +		c->icache.ways = 8;
>> +		c->icache.flags |= MIPS_CACHE_VTAG;
>> +		icache_size = c->icache.sets * c->icache.ways * c->icache.linesz;
>> +
>> +		c->dcache.linesz = 128;
>> +		c->dcache.ways = 8;
>> +		c->dcache.sets = 8;
>> +		dcache_size = c->dcache.sets * c->dcache.ways * c->dcache.linesz;
>> +		c->options |= MIPS_CPU_PREFETCH;
>> +		break;
>> +

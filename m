Message-ID: <000601bfe328$2e3fe6c0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: R5000 support (specifically two-way set-associative cache...)
Date: Sat, 1 Jul 2000 08:46:59 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Jun Sun <jsun@mvista.com>, Dominic Sweetman <dom@algor.co.uk>
Cc: linux-mips@fnet.fr, linux@cthulhu.engr.sgi.com, nigel@algor.co.uk
Message-ID: <20000701064659.AeCzQ50lW6xiA6oz5VChbTlZCiNvGghGkU9-3YplkEM@z>

In any case, note that the cache descriptor structures
defined by MIPS Technologies for the Linux 2.2 kernels
(coming one of these days to 2.3) allow for the cache
geometry to be fully described and specified, either
as a simple table copy based on the PrID, or as a
combination of table data and dynamic probing.

            Kevin K.

-----Original Message-----
From: Jun Sun <jsun@mvista.com>
To: Dominic Sweetman <dom@algor.co.uk>
Cc: linux-mips@fnet.fr <linux-mips@fnet.fr>; linux@cthulhu.engr.sgi.com
<linux@cthulhu.engr.sgi.com>; nigel@algor.co.uk <nigel@algor.co.uk>
Date: Saturday, July 01, 2000 3:29 AM
Subject: Re: R5000 support (specifically two-way set-associative cache...)


>
>> Fundamentally:
>>
>> o "index" operations just go first through one set, then the other.
>>   So long as initialisation routines are applied to each possible
>>   index in turn, both sets get initialised.
>>
>> o "hit" operations "just work".
>>
>> So long as initialisation is done carefully (basic rule: perform one
>> stage to the whole cache before going on to the next), run-time cache
>> maintenance can and should be done with "hit" instructions, and you
>> don't need to worry whether the CPU is direct mapped, 2- or 4-way set
>> associative.
>>
>> (it's all explained in my book, "See MIPS Run", of course...)
>>
>> Even with the Vr5432 you only have to know the difference when first
>> setting up the CPU.
>>
>
>Not exactly - the current Linux/MIPS implementation uese index
>operations to flush cache.
>As a result flush_all_cache() does not really flush all cache.
>
>
>> Dominic Sweetman
>> Algorithmics Ltd
>
>Jun
>> dom@algor.co.uk

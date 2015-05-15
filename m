Received: from mailapp01.imgtec.com ([195.59.15.196]:12841 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012621AbbEOVC7aYZ3P (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 15 May 2015 23:02:59 +0200
Message-ID: <55565EC0.9030102@imgtec.com>
Date: Fri, 15 May 2015 14:01:52 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2] MIPS64: Support of at least 48 bits of SEGBITS
References: <20150515013351.7450.12130.stgit@ubuntu-yegoshin> <55565BDF.6050503@gmail.com>
In-Reply-To: <55565BDF.6050503@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>
Cc: aleksey.makarov@auriga.com, james.hogan@imgtec.com, paul.burton@imgtec.com, david.daney@cavium.com, peterz@infradead.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org, davidlohr@hp.com, kirill@shutemov.name, akpm@linux-foundation.org, mingo@kernel.org
Message-ID: <20150515210152.emUtHcT-z94W9bg7Bc9NfNsKfnuM1eLNRuR42PvU6xg@z>

On 05/15/2015 01:49 PM, David Daney wrote:
> On 05/14/2015 06:34 PM, Leonid Yegoshin wrote:
>> SEGBITS default is 40 bits or less, depending from CPU type.
>> This patch introduces 48bits of application virtual address (SEGBITS) 
>> support.
>> It is defined only for 16K and 64K pages and is optional (configurable).
>>
>> Penalty - a small number of additional pages for generic (small) 
>> applications.
>> But for 64K pages it adds 3rd level of PTE structure, which has a little
>> impact during software TLB refill.
>>
>> This patch is needed because MIPS I6XXX and P6XXX cores have 48 bit of
>> virtual address in each segment (SEGBITS).
>>
>
> Those processors don't require the patch.  You wrote the patch to give 
> a larger VA space at the request of kernel users.  So perhaps say:
>
>   The patch (optionally) increases the VA space available to userspace 
> processes from N-bits to 48-bits
>

... if CPU model supports that

>
>>
>> +config 48VMBITS
>
> Should probabaly be called VABITS instead of VMBITS to match the terms 
> used in the architecture reference manuals, as well as other ports 
> (ARM64).
>
> Perhaps MIPS_VA_BITS_48

I don't mind here. It can be even called 48SEGBITS or so, to match arch 
manual more. MIPS Arch manual never says about VA bits but speaks about 
PABITS and SEGBITS.

- Leonid.

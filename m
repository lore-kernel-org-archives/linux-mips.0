Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:45089 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991783AbeEDLDWPrDq8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 4 May 2018 13:03:22 +0200
Subject: Re: [RFC PATCH] MIPS: Oprofile: Drop support
References: <1524574554-7451-1-git-send-email-matt.redfearn@mips.com>
 <20180424130511.GB28813@saruman>
 <5e464a40-4e4d-dde4-b5b5-ceb637dc5f38@mips.com>
 <20180504093002.GC4493@rric.localdomain>
 <dd951d1e-206d-78dd-49ae-3a16cad9ebcc@mips.com>
 <20180504102600.GD4493@rric.localdomain>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <294858af-9164-f0c3-62d3-d6b643e89e09@mips.com>
Date: Fri, 4 May 2018 12:03:12 +0100
MIME-Version: 1.0
In-Reply-To: <20180504102600.GD4493@rric.localdomain>
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
To: Robert Richter <rric@kernel.org>
Cc: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, Krzysztof Kozlowski <krzk@kernel.org>, oprofile-list@lists.sf.net
Message-ID: <20180504110312.TfEi9aF4b3NN5elQejwba_zdT_btetsH90ZlFYdRGJw@z>

Hi Robert,

On 04/05/18 11:26, Robert Richter wrote:
> On 04.05.18 10:54:32, Matt Redfearn wrote:
>> perf is available for MIPS and supports many more CPU types than oprofile.
>> oprofile userspace seemingly has been broken since 1.0.0 - removing oprofile
>> support from the MIPS kernel would not break it more thatn it already is,
> 
> What do you mean with "oprofile is broken"? It looks like you modified
> Kconfig to enable oprofile and perf in parallel, which is not intended
> to work. Have you tried a kernel with oprofile disabled and perf
> enabled?

Oh I see what you mean - previously I was trying v1.1.0 of the userspace 
with a kernel that has perf disabled - and that did not work (I assumed, 
naively, that the kernel oprofile code was required to run the oprofile 
userspace).

Thanks for the pointer - I confirmed that oprofile 1.1.0 userspace tools 
work with a kernel with "CONFIG_OPROFILE is not set", and 
"CONFIG_HW_PERF_EVENTS=y".

> 
> As said, oprofile version 0.9.x is still available for cpus that do
> not support perf. What is the breakage?

The breakage I originally set out to fix was the MT support in perf. 
https://www.linux-mips.org/archives/linux-mips/2018-04/msg00259.html

Since the perf code shares so much copied code from oprofile, those same 
issues exist in oprofile and ought to be addressed. But as newer 
oprofile userspace does not use the (MIPS) kernel oprofile code, then we 
could, perhaps, just remove it (as per the RFC). That would break legacy 
tools (0.9.x) though...

Thanks,
Matt

> 
> Thanks,
> 
> -Robert
> 

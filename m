Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:42470 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991819AbeEDM7gAZ3v9 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 4 May 2018 14:59:36 +0200
Subject: Re: [RFC PATCH] MIPS: Oprofile: Drop support
References: <1524574554-7451-1-git-send-email-matt.redfearn@mips.com>
 <20180424130511.GB28813@saruman>
 <5e464a40-4e4d-dde4-b5b5-ceb637dc5f38@mips.com>
 <20180504093002.GC4493@rric.localdomain>
 <dd951d1e-206d-78dd-49ae-3a16cad9ebcc@mips.com>
 <20180504102600.GD4493@rric.localdomain>
 <294858af-9164-f0c3-62d3-d6b643e89e09@mips.com>
 <20180504122750.GE4493@rric.localdomain>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <4b4943e5-bc87-3981-1d6c-28171e56c907@mips.com>
Date: Fri, 4 May 2018 13:59:32 +0100
MIME-Version: 1.0
In-Reply-To: <20180504122750.GE4493@rric.localdomain>
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
Message-ID: <20180504125932.SpBFCoMQRmnP1cIIUMJ8L6qG_mhf6LBKqjQqimEP3eY@z>

Hi Robert,

On 04/05/18 13:27, Robert Richter wrote:
> On 04.05.18 12:03:12, Matt Redfearn wrote:
>>> As said, oprofile version 0.9.x is still available for cpus that do
>>> not support perf. What is the breakage?
>>
>> The breakage I originally set out to fix was the MT support in perf.
>> https://www.linux-mips.org/archives/linux-mips/2018-04/msg00259.html
>>
>> Since the perf code shares so much copied code from oprofile, those same
>> issues exist in oprofile and ought to be addressed. But as newer oprofile
>> userspace does not use the (MIPS) kernel oprofile code, then we could,
>> perhaps, just remove it (as per the RFC). That would break legacy tools
>> (0.9.x) though...
> 
> Those support perf:
> 
>   (CPU_MIPS32 || CPU_MIPS64 || CPU_R10000 || CPU_SB1 || CPU_CAVIUM_OCTEON || CPU_XLP || CPU_LOONGSON3)
> 
> Here is the total list of CPU_*:
> 
>   $ git grep -h config.CPU_ arch/mips/ | sort -u | wc -l
>   79

To be fair, that list for oprofile is not much different:

arch/mips/oprofile/Makefile:

oprofile-$(CONFIG_CPU_MIPS32)		+= op_model_mipsxx.o
oprofile-$(CONFIG_CPU_MIPS64)		+= op_model_mipsxx.o
oprofile-$(CONFIG_CPU_R10000)		+= op_model_mipsxx.o
oprofile-$(CONFIG_CPU_SB1)		+= op_model_mipsxx.o
oprofile-$(CONFIG_CPU_XLR)		+= op_model_mipsxx.o
oprofile-$(CONFIG_CPU_LOONGSON2)	+= op_model_loongson2.o
oprofile-$(CONFIG_CPU_LOONGSON3)	+= op_model_loongson3.o

However, since those are generally CPU families rather than individual 
CPUs, the number of models supported by each framework tells a different 
story:

git grep -h ops.cpu_type arch/mips/oprofile | wc -l
20

git grep -h pmu.name arch/mips/kernel/perf_event* | wc -l
17

The difference is mainly older CPUs - M14Kc, 20K, loongson1, etc. But 
yes you are right dropping it would kill profiling for them - that being 
the case I guess oprofile should remain and instead just remove support 
for the MT capable CPUs (34K, interAptiv) which are all supported by perf.

Thanks,
Matt


> 
> The comparisation might not be accurate, but at least gives a hint
> that there are many cpus not supporting perf. You would drop profiling
> support at al to them.
> 
> If it is too hard to also fix the oprofile code (code duplication
> seems the main issue here), then it would be also ok to blacklist
> newer cpus to enable oprofile kernel code (where it is broken).
> 
> -Robert
> 

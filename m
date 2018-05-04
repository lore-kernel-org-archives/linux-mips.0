Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:39277 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991783AbeEDJydKylZN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 4 May 2018 11:54:33 +0200
Subject: Re: [RFC PATCH] MIPS: Oprofile: Drop support
References: <1524574554-7451-1-git-send-email-matt.redfearn@mips.com>
 <20180424130511.GB28813@saruman>
 <5e464a40-4e4d-dde4-b5b5-ceb637dc5f38@mips.com>
 <20180504093002.GC4493@rric.localdomain>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <dd951d1e-206d-78dd-49ae-3a16cad9ebcc@mips.com>
Date: Fri, 4 May 2018 10:54:32 +0100
MIME-Version: 1.0
In-Reply-To: <20180504093002.GC4493@rric.localdomain>
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
To: Robert Richter <robert.richter@cavium.com>
Cc: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, Krzysztof Kozlowski <krzk@kernel.org>, Robert Richter <rric@kernel.org>, oprofile-list@lists.sf.net
Message-ID: <20180504095432._a0J18nGFuziqs6tC6XvLXSbLmjooNrckoVaaCjDwS8@z>

Hi Robert,

On 04/05/18 10:30, Robert Richter wrote:
> On 24.04.18 14:15:58, Matt Redfearn wrote:
>> On 24/04/18 14:05, James Hogan wrote:
>>> On Tue, Apr 24, 2018 at 01:55:54PM +0100, Matt Redfearn wrote:
>>>> Since it appears that MIPS oprofile support is currently broken, core
>>>> oprofile is not getting many updates and not as many architectures
>>>> implement support for it compared to perf, remove the MIPS support.
>>>
>>> That sounds reasonable to me. Any idea how long its been broken?
>>
>> Sorry, not yet. I haven't yet looked into where/how it's broken that would
>> narrow that down...
> 
> oprofile moved to perf syscall as kernel i/f with version 1.0.0. The

OK interesting. I guess this was the point at which MIPS' current 
Kconfig rule which only allows building oprofile or perf into a kernel 
broke oprofile userspace.


> opcontrol script that was using the oprofile kernel i/f was removed:
> 
>   https://sourceforge.net/p/oprofile/oprofile/ci/0c142c3a096d3e9ec42cc9b0ddad994fea60d135/
> 
> Thus, cpus that do not support the perf syscall are no longer
> supported by 1.x releases.
> 
>   https://sourceforge.net/p/oprofile/oprofile/ci/797d01dea0b82dbbdb0c21112a3de75990e011d2/
> 
> For those remainings there is still version 0.9.x available (tagged
> PRE_RELEASE_1_0).
> 
> I am undecided whether removing oprofile kernel i/f falls under the
> rule of "never break user space" here. Strictly seen, yes it breaks
> those remainings. So if the perf syscall is not available as an
> alternative, the oprofile kernel support shouldn't be removed.

perf is available for MIPS and supports many more CPU types than 
oprofile. oprofile userspace seemingly has been broken since 1.0.0 - 
removing oprofile support from the MIPS kernel would not break it more 
thatn it already is, but of course it would be better to fix it - if it 
is still useful and people still use it. That is the question that I was 
looking for answers for with this RFC - whether to spend the time & 
effort to fix oprofile, or if it can be removed since everyone uses perf.

Thanks,
Matt

> 
> -Robert
> 

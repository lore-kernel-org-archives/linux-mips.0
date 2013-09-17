Received: from multi.imgtec.com ([194.200.65.239]:14215 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6822664Ab3IQK4GyPb9Q (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 17 Sep 2013 12:56:06 +0200
Message-ID: <5238353B.9050001@imgtec.com>
Date: Tue, 17 Sep 2013 11:55:55 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Fix accessing to per-cpu data when flushing the
 cache
References: <1379411005-20829-1-git-send-email-markos.chandras@imgtec.com> <20130917104431.GB22468@linux-mips.org>
In-Reply-To: <20130917104431.GB22468@linux-mips.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20130917105555.Id1aK8lhd5ynKJKFPVQI1OQtp4tNHbC_6LWMsgOCJT8@z>

On 09/17/13 11:44, Ralf Baechle wrote:
> On Tue, Sep 17, 2013 at 10:43:25AM +0100, Markos Chandras wrote:
>
>> The cache flushing code uses the current_cpu_data macro which
>> may cause problems in preemptive kernels because it relies on
>> smp_processor_id() to get the current cpu number. Per cpu-data
>> needs to be protected so we disable preemption around the flush
>> caching code. We enable it back when we are about to return.
>>
>> Fixes the following problem:
>>
>> BUG: using smp_processor_id() in preemptible [00000000] code: kjournald/1761
>> caller is blast_dcache32+0x30/0x254
>
> Just what I feared - these messages popping out from all over the tree.
>
> I'd prefer if we change the caller otherwise depending on the platform
> a single cache flush might involve several preempt_disable/-enable
> invocations.  Something like below.
>
> And it also keeps the header file more usable outside the core kernel
> which Florian's recent zboot a little easier.
>

Hi Ralf,

Changing the caller instead of the function in the header file looks 
good to me. Thanks for fixing it.

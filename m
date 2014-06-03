Received: from mail-bn1lp0145.outbound.protection.outlook.com ([207.46.163.145]:38424
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6816900AbaFCQkMZnH4a (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 3 Jun 2014 18:40:12 +0200
Message-ID: <538DFA61.4080100@caviumnetworks.com>
Date: Tue, 3 Jun 2014 09:40:01 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 09/13] MIPS: Add functions for hypervisor call
References: <1401313936-11867-1-git-send-email-andreas.herrmann@caviumnetworks.com> <1401313936-11867-10-git-send-email-andreas.herrmann@caviumnetworks.com> <20140603083031.GP17197@linux-mips.org> <20140603150337.GA28045@alberich>
In-Reply-To: <20140603150337.GA28045@alberich>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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
To: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, Ralf Baechle <ralf@linux-mips.org>, "Pinski, Andrew" <Andrew.Pinski@caviumnetworks.com>
Cc: linux-mips@linux-mips.org, David Daney <ddaney.cavm@gmail.com>, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140603164001.ZNr2pbILg6lCQY_MfTIkG0G-oX-8CeCEU1R7QyF7v1s@z>

In cases like this, I always wonder WWPD (What Would Pinski Do)...

Let's get him to opine.

Andrew, the patch in question is:

http://www.linux-mips.org/archives/linux-mips/2014-05/msg00309.html

Thanks,
David Daney

On 06/03/2014 08:03 AM, Andreas Herrmann wrote:
> On Tue, Jun 03, 2014 at 10:30:31AM +0200, Ralf Baechle wrote:
>> On Wed, May 28, 2014 at 11:52:12PM +0200, Andreas Herrmann wrote:
>>
>>> +/*
>>> + * Hypercalls for KVM.
>>> + *
>>> + * Hypercall number is passed in v0.
>>> + * Return value will be placed in v0.
>>> + * Up to 3 arguments are passed in a0, a1, and a2.
>>> + */
>>> +static inline unsigned long kvm_hypercall0(unsigned long num)
>>> +{
>>> +	register unsigned long n asm("v0");
>>> +	register unsigned long r asm("v0");
>>
>> Btw, is it safe to put two variables in the same register?
>
> I think it's safe.
>
> If we would have a matching constraint letter (say "v" for register v0) the
> asm should translate to
>
>          __asm__ __volatile__(
> 	       KVM_HYPERCALL
>                  : "=v" (n) : "v" (r) : "memory"
>                  );
>
> which isn't unusual on other archs. (Or maybe I am just biased from
> x86 ... or missed something else.)
>
>> The syscall wrappers that used to be in <asm/unistd.h> were occasionally
>> hitting problems which eventually forced me to stop forcing variables
>> into particular registers instead using a MOVE instruction to shove
>> each variable into the right place.
>>
>> Of course they were being used from non-PIC and PIC code, kernel and userland
>> so GCC had a much better chance to do evil than in the hypercall wrapper
>> case - but it made me paranoid ...
>
>
>
> Andreas
>

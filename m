Received: from mailapp01.imgtec.com ([195.59.15.196]:11806 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012492AbbHKSYQLt4jz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 11 Aug 2015 20:24:16 +0200
Message-ID: <55CA3DC7.8080206@imgtec.com>
Date: Tue, 11 Aug 2015 11:24:07 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: R6: emulation of PC-relative instructions
References: <20150805235343.21126.29589.stgit@ubuntu-yegoshin> <20150811144101.GA25145@mchandras-linux.le.imgtec.org>
In-Reply-To: <20150811144101.GA25145@mchandras-linux.le.imgtec.org>
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
To: Markos Chandras <markos.chandras@imgtec.com>
Cc: linux-mips@linux-mips.org, paul.burton@imgtec.com, david.daney@cavium.com, Steven.Hill@imgtec.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, macro@linux-mips.org
Message-ID: <20150811182407.v4cMRuOmJ4sO-XOZP36YCexU1Ahwfi1wLzt-R3Jw0mU@z>

On 08/11/2015 07:41 AM, Markos Chandras wrote:
> Hi,
>
> On Wed, Aug 05, 2015 at 04:53:43PM -0700, Leonid Yegoshin wrote:
>>   			if (nir) {
>>   				err = mipsr6_emul(regs, nir);
>>   				if (err > 0) {
>> +					regs->cp0_epc = nepc;
> Does this change belog to this patch? If so why?

Yes, it is needed for correct address calculation. Until PC-relative 
instruction emulation it was not needed in dsemul().

>   Maybe a comment would help?
> It does feel like it fixes a different problem but I haven't read your patch in depth.
>
>>   
>>
>>   
>>   #include "ieee754.h"
>>   
>> +#ifdef CONFIG_CPU_MIPSR6
> Can we simply avoid the if/def for R6 please? Just leave this function as is and
> use if(cpu_has_mips_r6) when calling it. If you can't do that, please explain
> why.
Yes, we can. But we have a bunch of that in many places and somewhere it 
is difficult to avoid "#ifdef".
I just like to have an uniform standard.

Besides that "#ifdef" assures quickly that it is a build time choice but 
not runtime.

>> +
>> +static int mipsr6_pc(struct pt_regs *regs, mips_instruction inst, unsigned long cpc,
>> +		    unsigned long bpc, unsigned long r31)
>> +{
>> +	union mips_instruction ir = (union mips_instruction)inst;
>> +	register unsigned long vaddr;
>> +	unsigned int val;
>> +	int err = SIGILL;
>> +
>> +	if (ir.rel_format.opcode != pcrel_op)
>> +		return SIGILL;
>> +
>> +	switch (ir.rel_format.op) {
>> +	case addiupc_op:
>> +		vaddr = regs->cp0_epc + (ir.rel_format.simmediate << 2);
>> +		if (config_enabled(CONFIG_64BIT) && !(regs->cp0_status & ST0_UX))
>> +			__asm__ __volatile__("sll %0, %0, 0":"+&r"(vaddr)::);
>> +		regs->regs[ir.rel_format.rs] = vaddr;
>> +		return 0;
>> +#ifdef CONFIG_CPU_MIPS64
> Could you use cpu_has_mips64 and avoid the if/def

No we can't - cpu_has_mips64 is a CPU ISA feature but here is a kernel 
code capability restriction. The difference happens during running 
MIPS32 kernel on MIPS64 processor. We should not emulate MIPS64 
instructions on MIPS32 kernel.

>   and return SIGILL if it is not
> true?

The common return standard for emulation functions in MIPS is:

     0 - OK, emulation done
     SIGILL - doesn't recognize an instruction, it still may be some 
another way to fix a problem or SIGILL.
     other - some trouble or whatever (non-standardized, in MIPS R2 
emulator it has subcodes)

I don't see a reason to change it and have here a special standard.

- Leonid.

>
>

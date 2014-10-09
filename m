Received: from mail-bn1on0079.outbound.protection.outlook.com ([157.56.110.79]:64055
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27011012AbaJIW7vXjeAf (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 10 Oct 2014 00:59:51 +0200
Message-ID: <5437134E.5040601@caviumnetworks.com>
Date: Thu, 9 Oct 2014 15:59:26 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/3] MIPS executable stack protection
References: <20141009195030.31230.58695.stgit@linux-yegoshin> <5437015B.3010205@gmail.com> <543709D0.6000501@imgtec.com>
In-Reply-To: <543709D0.6000501@imgtec.com>
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
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, Zubair.Kakakhel@imgtec.com, geert+renesas@glider.be, david.daney@cavium.com, peterz@infradead.org, paul.gortmaker@windriver.com, davidlohr@hp.com, macro@linux-mips.org, chenhc@lemote.com, richard@nod.at, zajec5@gmail.com, james.hogan@imgtec.com, keescook@chromium.org, alex@alex-smith.me.uk, tglx@linutronix.de, blogic@openwrt.org, jchandra@broadcom.com, paul.burton@imgtec.com, qais.yousef@imgtec.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, markos.chandras@imgtec.com, dengcheng.zhu@imgtec.com, manuel.lauss@gmail.com, akpm@linux-foundation.org, lars.persson@axis.com
Message-ID: <20141009225926.ZobWYCdTjehDKHKgvCiZdWatqgkDmb-nGr757gKbixY@z>

On 10/09/2014 03:18 PM, Leonid Yegoshin wrote:
> On 10/09/2014 02:42 PM, David Daney wrote:
>> On 10/09/2014 01:00 PM, Leonid Yegoshin wrote:
>>> The following series implements an executable stack protection in MIPS.
>>>
>>> It sets up a per-thread 'VDSO' page and appropriate TLB support.
>>> Page is set write-protected from user and is maintained via kernel VA.
>>> MIPS FPU emulation is shifted to new page and stack is relieved for
>>> execute protection as is as all data pages in default setup during ELF
>>> binary initialization. The real protection is controlled by GLIBC and
>>> it can do stack protected now as it is done in other architectures and
>>> I learned today that GLIBC team is ready for this.
>>
>> What does it mean to be 'ready'?  If they committed patches before
>> there was kernel support, that it putting the cart before the horse.
>> GlibC's state cannot be used as valid reason for committing major
>> kernel changes.  There would be no regression in any GLibC based
>> system as a result of not merging this patch.
> Rich Fuhler said me that they discussed it internally and have a
> solution to fix their problem (ignoring PT_GNU_STACK on first library
> load - they need to sort out the logic). But we need to split both issue
> - right now stack can't be protected because of emulation. If they set
> stack protected then emulation fails on CPU without FPU.

Yes, we understand why non-executable stack is not compatible with the 
FPU emulator.

>
>>
>>>
>>> Note: actual execute-protection depends from HW capability, of course.
>>>
>>> This patch is required for MIPS32/64 R2 emulation on MIPS R6
>>> architecture.
>>> Without it 'ssh-keygen' crashes pretty fast on attempt to execute
>>> instruction
>>> in stack.
>>
>> There is much more blocking MIPS32/64 R2 emulation on MIPS R6 than
>> just this patch isn't there?
>
> This one is critical - ssh-keygen crashes during running MIPS R2. I have
> a patch in my R6 repository but GLIBC still can't set stack executable
> and security suffers.

But is the R6 code already in the lmo or kernel.org repositories?

If not, then the lack of this patch is not a gating issue.  If this 
patch is really needed for R6 support, why not submit the R6 
prerequisite patches first?

If this patch has nothing to do with MIPS R6, then state that.

>
>>
>> Also, if you are supporting MIPS R6, this patch doesn't even work,
>> because it doesn't handle PC relative instructions at all.
>
> It seems like you missed my statement - adding support for PC-relative
> instruction is just 5 lines of code. I just refrain from this until
> toolchain starts generating that.

How can it be just 5 lines of code?  You have to emulate all those 
instructions:

   ADDIUPC
   AUIPC
   ALUIPC
   LDPC
   LWPC
   LWUPC

I think that is all of them.  You can emulate all of those in 5 lines of 
code?

We need to support everything the toolchain could product in the future. 
  I don't think it makes sense to add all this stuff when it is well 
known that it doesn't solve the problem for MIPS R6, especially when the 
justification for the patch is that it is needed for R6.

I understand what your goals are here, I have spend many months working 
towards a non-executable stack (see the patches that moved the signal 
trampolines off the stack).  But I am worried that there are many cases 
that it will not handle.

>
> Besides that, this version 2 of patch just passed 20-22 hours on P5600
> and Virtuoso (no FPU on both) under SOAK test and it gets around 1 per
> hour of signal right at emulated instruction in VDSO and unwind works
> (as I can see in debug prints).
>

I'm not saying that the patch doesn't work under your highly constrained 
test conditions, I believe that it does.

I am not familiar with the SOAK test.  Does it really put faulting 
instructions the delay slots of FP branch instructions, catch the 
resulting signal, and then throw an exception from the signal handler?


>>
>>
>> The recent discussions on this subject, including many comments from
>> Imgtec e-mail addresses, brought to light the need to use an
>> instruction set emulator for newer MIPSr6 ISA processors.
>
> In Imgtec I am only one who works on MIPS R6 SW and FPU branch emulation
> and I say you - it is not needed, this solution is enough.

It can't be true the PC relative support is not needed, why did you add 
the PC relative instructions, if you didn't want to use them in Linux 
userspace?

Really what I was talking about was a wider audience, the people that 
will write tools and code that target userspace.  They will want a 
solution without a bunch of restrictions forced upon them by the 
limitations of the FPU emulator.

>
>>
>> In light of this, why does it make sense to merge this patch, instead
>> of taking the approach of emulating the instructions in the delay slot?
>
> Well, because it does exist now. But full MIPS emulator... for all
> ASEs... for any MIPS vendor... I even doesn't want to estimate an amount
> of time and code size to develop it.
>
> Besides that, you missed my another statement - we don't force customer
> to disclose all details of their COP2 instructions.

Here is my proposal:

1) Add an emulator for all documented MIPS R6 instructions that can 
appear in a linux userspace delay slot.

2) Document as not supported placing COP2 instructions in FP branch 
delay slots.

3) Get rid of this execute-out-of-line code in the FPU emulator all 
together.

4) Enable non-execute stack.

In order to have full MIPS R6 support in the kernel, you will need an 
emulator for a subset of the instructions anyhow.  Going to a full ISA 
emulator will be a little more work, but it shouldn't be too hard.


David Daney

Received: from mail-bn1on0071.outbound.protection.outlook.com ([157.56.110.71]:46921
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27007854AbaLDCVzIWzDK (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 4 Dec 2014 03:21:55 +0100
Message-ID: <547FC530.1060109@caviumnetworks.com>
Date: Wed, 3 Dec 2014 18:21:36 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] MIPS: Add full ISA emulator.
References: <1417650258-2811-1-git-send-email-ddaney.cavm@gmail.com> <1417650258-2811-3-git-send-email-ddaney.cavm@gmail.com> <547FA2E5.1040105@imgtec.com> <547FA8D2.2030703@caviumnetworks.com> <547FB032.2000000@imgtec.com> <547FB8FB.7040803@caviumnetworks.com> <547FBF63.70802@imgtec.com>
In-Reply-To: <547FBF63.70802@imgtec.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
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
Cc: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, Zubair.Kakakhel@imgtec.com, geert+renesas@glider.be, peterz@infradead.org, paul.gortmaker@windriver.com, macro@linux-mips.org, chenhc@lemote.com, cl@linux.com, mingo@kernel.org, richard@nod.at, zajec5@gmail.com, james.hogan@imgtec.com, keescook@chromium.org, tj@kernel.org, alex@alex-smith.me.uk, pbonzini@redhat.com, blogic@openwrt.org, paul.burton@imgtec.com, qais.yousef@imgtec.com, linux-kernel@vger.kernel.org, markos.chandras@imgtec.com, dengcheng.zhu@imgtec.com, manuel.lauss@gmail.com, lars.persson@axis.com, David Daney <david.daney@cavium.com>
Message-ID: <20141204022136.0ZNZd9HWocNxTEPStiluX_5DG8-T4wu3kEpk9rGAR48@z>

On 12/03/2014 05:56 PM, Leonid Yegoshin wrote:
> David,
>
> I feel we can close a discission at that point - we disagree which
> approach is better, and there is no sense to continue dancing around.
>

That is something I do agree with.

> I see only two technical issues here which differs:
>
> 1.  You believe your GCC experts, I trust HW Architecture manual and
> don't trust toolchain people too much ==> we see a different value in
> fact that your approach has a subset of emulated ISAs (and it can't, of
> course, emulate anything because some custom opcodes are reused).

Yes, I agree that the emulation approach cannot handle some of the cases 
you mention (most would have to be the result of hand coded assembly 
specifically trying to break it).

>
> 2.  My approach is ready to use and is used right now, you still have a
> framework which passed an initial boot.


Let's add some more, please correct me if I misstate the facts:

3) Your approach uses one additional page of memory per user space 
thread, even if emulation is never needed or there is a hardware FPU.

4) Your approach adds a Thread creation overhead of copy_page().

>
>
> On 12/03/2014 05:29 PM, David Daney wrote:
>> On 12/03/2014 04:52 PM, Leonid Yegoshin wrote:
>>> On 12/03/2014 04:20 PM, David Daney wrote:
>>>> It is a proof of concept.  R6 can easily be added if needed.
>>>>
>>>> Your XOL emulation doesn't handle R6 either, so this is no worse than
>>>> your patch in that respect.
>>>
>>> You probably didn't research it well. A lot of changes in
>>> arch/mips/kernel/branch.c and and arch/mips/math-emu/cp1emu.c, all of it
>>> related with R6.
>>>
>>
>> I looked at:
>> commit 3a18ca061311f2f1ee9c44012f89c7436d392117
>>
>> And I saw no R6 support.
>>
>> Is it there, or in some other branch that isn't merged?
>
> Sorry, I misunderstood your statement:
>
> Yes, my "MIPS: Setup an instruction emulation in VDSO protected page
> instead of user stack <http://patchwork.linux-mips.org/patch/8631/>" has
> no any MIPS R6 specifics and actually has no any another MIPS Rx
> specific or FPU specific besides the fact that emulation can be done by
> multiple emulators and a small stack is supported in so-called "VDSO"
> page. I just remember that I pointed you to place where MIPS R6 is done
> and it has a lot of MIPS R6 instruction emulation and confused both events.
>
> - Leonid.

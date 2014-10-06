Received: from mail-by2on0077.outbound.protection.outlook.com ([207.46.100.77]:35904
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27010650AbaJFVSch8x15 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 6 Oct 2014 23:18:32 +0200
Message-ID: <5433071B.4050606@caviumnetworks.com>
Date: Mon, 6 Oct 2014 14:18:19 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH resend] MIPS: Allow FPU emulator to use non-stack area.
References: <1412627010-4311-1-git-send-email-ddaney.cavm@gmail.com> <20141006205459.GZ23797@brightrain.aerifal.cx>
In-Reply-To: <20141006205459.GZ23797@brightrain.aerifal.cx>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
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
To: Rich Felker <dalias@libc.org>
Cc: David Daney <ddaney.cavm@gmail.com>, libc-alpha@sourceware.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20141006211819.lw4X-UuPTZIMG8Pz_v5_zm4KeSXdscVSxEhUdZB2-eU@z>

On 10/06/2014 01:54 PM, Rich Felker wrote:
> On Mon, Oct 06, 2014 at 01:23:30PM -0700, David Daney wrote:
>> From: David Daney <david.daney@cavium.com>
>>
>> In order for MIPS to be able to support a non-executable stack, we
>> need to supply a method to specify a userspace area that can be used
>> for executing emulated branch delay slot instructions.
>>
>> We add a new system call, sys_set_fpuemul_xol_area so that userspace
>> threads that are using the FPU can specify the location of the FPU
>> emulation out of line execution area.
>>
>> Background:
>>
>> MIPS floating point support requires that any instruction that cannot
>> be directly executed by the FPU, be emulated by the kernel.  Part of
>> this emulation involves executing non-FPU instructions that fall in
>> the delay slots of FP branch instructions.  Since the beginning of
>> MIPS/Linux time, this has been done by placing the instructions on the
>> userspace thread stack, and executing them there, as the instructions
>> must be executed in the MM context of the thread receiving the
>> emulation.
>>
>> Because of this, the de facto MIPS Linux userspace ABI requires that
>> the userspace thread have an executable stack.  It is de facto,
>> because it is not written anywhere that this must be the case, but it
>> is never the less a requirement.
>>
>> Problem:
>>
>> How do we get MIPS Linux to use a non-executable stack in the face of
>> the FPU emulation problem?
>>
>> Since userspace desires to change the ABI, put some of the onus on the
>> userspace code.  Any userspace thread desiring a non-executable stack,
>> must allocate a 4-byte aligned area at least 8 bytes long with that
>> has read/write/execute permissions and pass the address of that area
>> to the kernel with the new sys_set_fpuemul_xol_area system call.
>>
>> This is similar to how we require userspace to notify the kernel of
>> the value of the thread local pointer.
>
> Userspace should play no part in this; requiring userspace to help
> make special accomodations for fpu emulation largely defeats the
> purpose of fpu emulation.

That is certainly one way of looking at it.  Really it is opinion, 
rather than fact though.

GLibc is full of code (see ld.so) that in earlier incantations of 
Unix/Linux was in kernel space, and was moved to userspace.  Given that 
there is a partitioning of code between kernel space and userspace, I 
think it not totally unreasonable to consider doing some of this in 
userspace.

Even on systems with hardware FPU, the architecture specification allows 
for/requires emulation of certain cases (denormals, etc.)  So it is 
already a requirement that userspace cooperate by always having free 
space below $SP for use by the kernel.  So the current situation is that 
userspace is providing services for the kernel FPU emulator.

My suggestion is to change the nature of the way these services are 
provided by the userspace program.

> The kernel is perfectly capable of mapping
> an appropriate page. The mapping should happen at exec time,  and at
> clone time with CLONE_VM

Why?  This adds overhead for threads that don't use the FPU.  So this 
suggestion adds at least one page of memory overhead for each thread in 
the system (unless I misunderstand what you are saying).

> unless the kernel is going to handle mutual
> exclusion so that only one thread can be using the page at a time.
> (Using one page for the whole process, and excluding simultaneous
> execution of fpu emulation in multiple threads, may be the more
> practical approach.)
>
> As an alternative, if the space of possible instruction with a delay
> slot is sufficiently small, all such instructions could be mapped as
> immutable code in a shared mapping, each at a fixed offset in the
> mapping. I suspect this would be borderline-impractical (multiple
> megabytes?), but it is the cleanest solution otherwise.
>

Yes, there are 2^32 possible instructions.  Each one is 4 bytes, plus 
you need a way to exit after the instruction has executed, which would 
require another instruction.  So you would need 32GB of memory to hold 
all those instructions, larger than the 32-bit virtual address space.

> Rich
>

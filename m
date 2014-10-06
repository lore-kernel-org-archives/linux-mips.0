Received: from mail-by2on0055.outbound.protection.outlook.com ([207.46.100.55]:55808
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27010553AbaJFWROfj0kL (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 7 Oct 2014 00:17:14 +0200
Message-ID: <543314DF.20808@caviumnetworks.com>
Date: Mon, 6 Oct 2014 15:17:03 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH resend] MIPS: Allow FPU emulator to use non-stack area.
References: <1412627010-4311-1-git-send-email-ddaney.cavm@gmail.com> <20141006205459.GZ23797@brightrain.aerifal.cx> <5433071B.4050606@caviumnetworks.com> <20141006213101.GA23797@brightrain.aerifal.cx> <54330D79.80102@caviumnetworks.com> <20141006215813.GB23797@brightrain.aerifal.cx>
In-Reply-To: <20141006215813.GB23797@brightrain.aerifal.cx>
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
Message-ID: <20141006221703.nM32y5gKIZZb-YKdH0_wsEeld6u-XaPgAvEx1npTENA@z>

On 10/06/2014 02:58 PM, Rich Felker wrote:
> On Mon, Oct 06, 2014 at 02:45:29PM -0700, David Daney wrote:
>> On 10/06/2014 02:31 PM, Rich Felker wrote:
>>> On Mon, Oct 06, 2014 at 02:18:19PM -0700, David Daney wrote:
>>>>> Userspace should play no part in this; requiring userspace to help
>>>>> make special accomodations for fpu emulation largely defeats the
>>>>> purpose of fpu emulation.
>>>>
>>>> That is certainly one way of looking at it.  Really it is opinion,
>>>> rather than fact though.
>>>
>>> It's an opinion, yes, but it has substantial reason behind it.
>>>
>>>> GLibc is full of code (see ld.so) that in earlier incantations of
>>>> Unix/Linux was in kernel space, and was moved to userspace.  Given
>>>> that there is a partitioning of code between kernel space and
>>>> userspace, I think it not totally unreasonable to consider doing
>>>> some of this in userspace.
>>>>
>>>> Even on systems with hardware FPU, the architecture specification
>>>> allows for/requires emulation of certain cases (denormals, etc.)  So
>>>> it is already a requirement that userspace cooperate by always
>>>> having free space below $SP for use by the kernel.  So the current
>>>> situation is that userspace is providing services for the kernel FPU
>>>> emulator.
>>>>
>>>> My suggestion is to change the nature of the way these services are
>>>> provided by the userspace program.
>>>
>>> But this isn't setup by the userspace program. It's setup by the
>>> kernel on program entry. Despite that, though, I think it's an
>>> unnecessary (and undocumented!) constraint; the fact that it requires
>>> the stack to be executable makes it even more harmful and
>>> inappropriate.
>>>
>>
>> The management of the stack is absolutely done by userspace code.
>> Any time you do pthread_create(), userspace code does mmap() to
>> allocate the stack area, it then sets permissions on the area, and
>> then it passes the address of the area to clone().
>
> This is hardly management.
>
>> Furthermore the
>> userspace code has to be very careful in its use of the $sp
>> register, so that it doesn't store data in places that will be
>> used/clobbered by the kernel.
>
> This is not "being careful". The stack pointer can never become
> invalid unless you do wacky things in asm or invoke UB.
>
>> All of this is under the control of the userspace program and done
>> with userspace code.
>
> For the most part it just happens by default. There is no particular
> intentionality needed, and certainly no hideous MIPS-specific hacks
> needed.
>

Yes, it happens by default.  But it wasn't magic.  It took careful work 
by the ABI and toolchain designers to make it work.


>> I appreciate the fact that libc authors might prefer *not* to write
>> more code, but they could, especially if they wanted to add the
>> feature of non-executable stacks to their library implementation.
>
> So your position is that:

It is not really a position that I have.  Rather a proposal for one 
possible way to make non-executable stacks work on MIPS.

>
> 1. A non-exec-stack system can only run new code produced to do extra
>     stuff in userspace.

Any non-executable stack solution for MIPS will require changes to the 
toolchain/libc.  So it is merely a question of what form the change 
should take.


>
> 2. The startup code needs to do special work in userspace on MIPS to
>     setup an executable area for fpu emulation.

Yes. Similar to how startup code has to do special work to set up the 
TLS areas, and load shared libraries.

>
> 3. Every call to clone/CLONE_VM needs to be accompanied by a call to
>     mmap and this new syscall to set the address, and every call to
>     SYS_exit needs to be accompanies by a call to munmap for the
>     corresponding mapping.
>

No, We don't have to mmap() on each thread creation.  Many threads 
(perhaps 512) could be handled by a single page, so the normal case 
would be a single mmap() for the life of the program.


> This is a huge ill-designed mess.
>

Have you seen the alternatives?

Have you ever wondered why MIPS doesn't have non-executable stack support?

> Rich
>

Received: from mail-bn1bon0091.outbound.protection.outlook.com ([157.56.111.91]:26699
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27008112AbaLDB3qsLRhy (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 4 Dec 2014 02:29:46 +0100
Message-ID: <547FB8FB.7040803@caviumnetworks.com>
Date: Wed, 3 Dec 2014 17:29:31 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] MIPS: Add full ISA emulator.
References: <1417650258-2811-1-git-send-email-ddaney.cavm@gmail.com> <1417650258-2811-3-git-send-email-ddaney.cavm@gmail.com> <547FA2E5.1040105@imgtec.com> <547FA8D2.2030703@caviumnetworks.com> <547FB032.2000000@imgtec.com>
In-Reply-To: <547FB032.2000000@imgtec.com>
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
Message-ID: <20141204012931.xARK4QJbOvcVcqdXPXTHKrILVTKpuvN1LzJhKiN8Tb4@z>

On 12/03/2014 04:52 PM, Leonid Yegoshin wrote:
> On 12/03/2014 04:20 PM, David Daney wrote:
>> On 12/03/2014 03:55 PM, Leonid Yegoshin wrote:
>>> On 12/03/2014 03:44 PM, David Daney wrote:
>>>
>>> (...)
>>>
>>> Big work
>>
>> Not really, although by number of lines of code, it is about 3x the
>> size of your patch, it only touches the existing code in one place. It
>> only took about 3 days to write, adding full MIPS64 and R6 support
>> would probably be less than another week of work.
>>
>> microMIPS I haven't looked at as we don't have anything to test it on.
>>
>>> but it doesn't support customized instructions,
>>
>> GCC will never put these in the delay slot of a FPU branch, so it is
>> not needed.
>
> I doubt that it is correct in all situations and with any GCC parameter
> combination.

My GCC experts assert that it is true.

>
> Never say never, if it is about toolchain. IMG Arch team was assured
> that branch likely are never used and removed it in MIPS R6, but BGEZL
> (or so) was a first which I hit then I ran GLIBC.

The fact that the Arch Team designed R6 without bothering to determine 
what legacy code does is not relevant to this conversation.

>
> Besides GCC there are LLVM and another JITs.
>

They don't do it either.  But that is not really important.  We can 
easily emulate faulting instructions if needed.

>>
>>> multiple ASEs,
>>
>> Same as above.  But any instructions that are deemed necessary can
>> easily be added.
>>
>>> MIPS R6
>>
>> It is a proof of concept.  R6 can easily be added if needed.
>>
>> Your XOL emulation doesn't handle R6 either, so this is no worse than
>> your patch in that respect.
>
> You probably didn't research it well. A lot of changes in
> arch/mips/kernel/branch.c and and arch/mips/math-emu/cp1emu.c, all of it
> related with R6.
>

I looked at:
commit 3a18ca061311f2f1ee9c44012f89c7436d392117

And I saw no R6 support.

Is it there, or in some other branch that isn't merged?


>>
>>> etc.
>>
>> GCC will never put trapping instructions in the delay slot either.
>
> It seems like it is not correct and requires a more accurate statement.
> FPU instructions may trap, LWL and LWR traps on R6 with RI, etc. Yes,
> there are restrictions but basing a kernel on that assumptions is
> unsafe. The only safe is HW architecture document.
>
> Finally, there is a manual encoding too.
>
>>
>> All we have to support are non-trapping and non-branch/jump
>> instructions from the ISA manuals that can be executed from userspace
>> processes. That makes it slightly simpler than complete ISA emulation.
>>
>>>
>>> Well, it is still not a replacement of XOL emulation.
>>
>> For use by the FPU emulator, it is probably good enough
>>
>>> Even close.
>>
>> I disagree, that is why I took the time to do it.
>>
>>>
>>>
>>
>

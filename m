Received: from mail-by2on0087.outbound.protection.outlook.com ([207.46.100.87]:43296
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27006935AbaLDRknIkcUe (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 4 Dec 2014 18:40:43 +0100
Message-ID: <54809C88.8060601@caviumnetworks.com>
Date: Thu, 4 Dec 2014 09:40:24 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] MIPS: Add full ISA emulator.
References: <1417650258-2811-1-git-send-email-ddaney.cavm@gmail.com> <1417650258-2811-3-git-send-email-ddaney.cavm@gmail.com> <547FA2E5.1040105@imgtec.com> <547FA8D2.2030703@caviumnetworks.com> <alpine.LFD.2.11.1412040310100.22073@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.11.1412040310100.22073@eddie.linux-mips.org>
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
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Zubair.Kakakhel@imgtec.com, geert+renesas@glider.be, peterz@infradead.org, paul.gortmaker@windriver.com, chenhc@lemote.com, cl@linux.com, Ingo Molnar <mingo@kernel.org>, richard@nod.at, zajec5@gmail.com, james.hogan@imgtec.com, keescook@chromium.org, tj@kernel.org, alex@alex-smith.me.uk, pbonzini@redhat.com, blogic@openwrt.org, paul.burton@imgtec.com, qais.yousef@imgtec.com, linux-kernel@vger.kernel.org, markos.chandras@imgtec.com, dengcheng.zhu@imgtec.com, manuel.lauss@gmail.com, lars.persson@axis.com, David Daney <david.daney@cavium.com>
Message-ID: <20141204174024.IJ-K0GKSw7VNlz6-UgCSIduqEjtt8CgIH5xAOStmjTk@z>

On 12/04/2014 03:49 AM, Maciej W. Rozycki wrote:
> On Wed, 3 Dec 2014, David Daney wrote:
>
>>> but it doesn't support customized instructions,
>>
>> GCC will never put these in the delay slot of a FPU branch, so it is not
>> needed.
>>
>>> multiple ASEs,
>>
>> Same as above.  But any instructions that are deemed necessary can easily be
>> added.
>
>   GAS will happily schedule any instruction into a branch delay slot as
> long as the instruction is not architecturally forbidden there (e.g.
> ERET), there is no data dependency with the branch that would affect the
> result produced and the instruction is not an explicit exception trap
> operation (BREAK, SYSCALL, TEQ, etc.).  For some reason, unknown to me all
> MT ASE instructions are disallowed too.  Anything else -- free to go in!
>
>   Of course instructions can be scheduled into branch delay slots manually
> too, in handcoded assembly, and that has to continue working.
>

It is not difficult to also emulate the trapping instructions.  In order 
to move forward, I will implement the trapping instructions in my 
emulator for the next patch.

Thanks,
David Daney

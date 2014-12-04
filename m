Received: from mail-bl2on0096.outbound.protection.outlook.com ([65.55.169.96]:26361
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27008085AbaLDAUunHvRr (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 4 Dec 2014 01:20:50 +0100
Message-ID: <547FA8D2.2030703@caviumnetworks.com>
Date: Wed, 3 Dec 2014 16:20:34 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] MIPS: Add full ISA emulator.
References: <1417650258-2811-1-git-send-email-ddaney.cavm@gmail.com> <1417650258-2811-3-git-send-email-ddaney.cavm@gmail.com> <547FA2E5.1040105@imgtec.com>
In-Reply-To: <547FA2E5.1040105@imgtec.com>
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
Message-ID: <20141204002034.dDucCQcLd8Uhljaun7NoYcVusjsuw3yx0nZXqvjMUyo@z>

On 12/03/2014 03:55 PM, Leonid Yegoshin wrote:
> On 12/03/2014 03:44 PM, David Daney wrote:
>
> (...)
>
> Big work

Not really, although by number of lines of code, it is about 3x the size 
of your patch, it only touches the existing code in one place.  It only 
took about 3 days to write, adding full MIPS64 and R6 support would 
probably be less than another week of work.

microMIPS I haven't looked at as we don't have anything to test it on.

> but it doesn't support customized instructions,

GCC will never put these in the delay slot of a FPU branch, so it is not 
needed.

> multiple ASEs,

Same as above.  But any instructions that are deemed necessary can 
easily be added.

> MIPS R6

It is a proof of concept.  R6 can easily be added if needed.

Your XOL emulation doesn't handle R6 either, so this is no worse than 
your patch in that respect.

> etc.

GCC will never put trapping instructions in the delay slot either.

All we have to support are non-trapping and non-branch/jump instructions 
from the ISA manuals that can be executed from userspace processes. 
That makes it slightly simpler than complete ISA emulation.

>
> Well, it is still not a replacement of XOL emulation.

For use by the FPU emulator, it is probably good enough

> Even close.

I disagree, that is why I took the time to do it.

>
>

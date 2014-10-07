Received: from mail-bn1bon0078.outbound.protection.outlook.com ([157.56.111.78]:52640
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27010789AbaJGX7QlkaEQ (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 8 Oct 2014 01:59:16 +0200
Message-ID: <54347E47.1080809@caviumnetworks.com>
Date: Tue, 7 Oct 2014 16:59:03 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH resend] MIPS: Allow FPU emulator to use non-stack area.
References: <1412627010-4311-1-git-send-email-ddaney.cavm@gmail.com> <20141006205459.GZ23797@brightrain.aerifal.cx> <5433071B.4050606@caviumnetworks.com> <20141007232019.GA30470@linux-mips.org>
In-Reply-To: <20141007232019.GA30470@linux-mips.org>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Rich Felker <dalias@libc.org>, David Daney <ddaney.cavm@gmail.com>, libc-alpha@sourceware.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20141007235903.w9_B5MMuyDA9Yx78hLN5AyRh6NN1dIU9dgF5x6jalm0@z>

On 10/07/2014 04:20 PM, Ralf Baechle wrote:
> On Mon, Oct 06, 2014 at 02:18:19PM -0700, David Daney wrote:
>
>>> As an alternative, if the space of possible instruction with a delay
>>> slot is sufficiently small, all such instructions could be mapped as
>>> immutable code in a shared mapping, each at a fixed offset in the
>>> mapping. I suspect this would be borderline-impractical (multiple
>>> megabytes?), but it is the cleanest solution otherwise.
>>>
>>
>> Yes, there are 2^32 possible instructions.  Each one is 4 bytes, plus you
>> need a way to exit after the instruction has executed, which would require
>> another instruction.  So you would need 32GB of memory to hold all those
>> instructions, larger than the 32-bit virtual address space.
>
> Plus errata support for some older CPUs requires no other instructions
> that might cause an exception to be present in the same cache line inflating
> the size to 32 bytes per instruction.
>
> I've contemplated a full emulation - but that would require an emulator that
> is capable of most of the instruction set.  With all the random ASEs around
> that would be hard to implement while the FPU emulator trampoline as currently
> used has the advantage of automatically supporting ASEs, known and unknown.
> So it's a huge bonus for maintenance.
>

Unfortunatly it breaks when our friends at Imgtec introduce their PC 
relative instructions in mipsr6, so an emulator may be unavoidable.

David Daney

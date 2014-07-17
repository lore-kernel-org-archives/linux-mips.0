Received: from mailapp01.imgtec.com ([195.59.15.196]:24432 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6817540AbaGQImHoPKhA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 17 Jul 2014 10:42:07 +0200
Message-ID: <53C78C4D.5090308@imgtec.com>
Date: Thu, 17 Jul 2014 09:41:49 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] mips: Add cma support to mips
References: <1405525892-60383-1-git-send-email-Zubair.Kakakhel@imgtec.com> <CAOLZvyEs_+R+urf-rhvpfZ+ieqhgg6zXuOtLLPUqKSaeNTzpNg@mail.gmail.com> <CAOLZvyFjkuCzUkbb3SpJ25gKQoZ-Ken9Ri1YEckxdM6ETNyuSg@mail.gmail.com>
In-Reply-To: <CAOLZvyFjkuCzUkbb3SpJ25gKQoZ-Ken9Ri1YEckxdM6ETNyuSg@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <Zubair.Kakakhel@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Manuel Lauss <manuel.lauss@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Marek Szyprowski <m.szyprowski@samsung.com>, mina86@mina86.com, Linux-MIPS <linux-mips@linux-mips.org>
Message-ID: <20140717084149.-DQmalLv_JTEMwTXViVQKkwTO50Sxt83rnwrL2HDV3A@z>



On 17/07/14 09:38, Manuel Lauss wrote:
> On Wed, Jul 16, 2014 at 6:18 PM, Manuel Lauss <manuel.lauss@gmail.com> wrote:
>> Hi,
>>
>> On Wed, Jul 16, 2014 at 5:51 PM, Zubair Lutfullah Kakakhel
>> <Zubair.Kakakhel@imgtec.com> wrote:
>>> Here we have 4 patches that add cma support to mips.
>>>
>>> Patch 1 adds dma-contiguous.h to asm-generic
>>> Patch 2 and 3 make arm64 and x86 use dma-contiguous from asm-generic
>>> Patch 4 adds cma to mips.
>>
>> I've given this a try on mips32, I haven't dug into this error yet, maybe
>> you have an idea:
> [ oops snipped ]
> 
> Nevermind.   Did a full recompile, the oops is gone.  Works fine now,
> framebuffer driver and others are very happy.
> 
> Thanks!
>         Manuel
> 

Good to know. :)

Thanks for testing it on your platform.

ZubairLK

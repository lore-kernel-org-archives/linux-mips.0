Received: from mail-by2on0064.outbound.protection.outlook.com ([207.46.100.64]:31584
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27012601AbbHFAiCwDpux (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 6 Aug 2015 02:38:02 +0200
Message-ID: <55C2AC5B.50408@caviumnetworks.com>
Date: Wed, 5 Aug 2015 17:37:47 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/3] MIPS: set stack/data protection as non-executable
References: <20150805234348.20722.71740.stgit@ubuntu-yegoshin> <20150805234936.20722.60927.stgit@ubuntu-yegoshin> <20150805235543.GG2057@NP-P-BURTON> <55C2A50A.50805@imgtec.com> <55C2A6FE.1020003@caviumnetworks.com> <55C2A91B.1090704@imgtec.com>
In-Reply-To: <55C2A91B.1090704@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, daniel.sanders@imgtec.com, linux-mips@linux-mips.org, cernekee@gmail.com, Zubair.Kakakhel@imgtec.com, geert+renesas@glider.be, david.daney@cavium.com, peterz@infradead.org, heiko.carstens@de.ibm.com, paul.gortmaker@windriver.com, behanw@converseincode.com, macro@linux-mips.org, cl@linux.com, pkarat@mvista.com, linux@roeck-us.net, tkhai@yandex.ru, james.hogan@imgtec.com, alexinbeijing@gmail.com, rusty@rustcorp.com.au, Steven.Hill@imgtec.com, lars.persson@axis.com, aleksey.makarov@auriga.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, luto@amacapital.net, dahi@linux.vnet.ibm.com, markos.chandras@imgtec.com, eunb.song@samsung.com, kumba@gentoo.org
Message-ID: <20150806003747.EHxp2R7XO1_qGj1bhOhY-v_5hsCN4EYA0VTXIQFQ7SY@z>

On 08/05/2015 05:23 PM, Leonid Yegoshin wrote:
> On 08/05/2015 05:14 PM, David Daney wrote:
>> On 08/05/2015 05:06 PM, Leonid Yegoshin wrote:
>>> On 08/05/2015 04:55 PM, Paul Burton wrote:
>>>>
>>>>
>>>> As was pointed out last time you posted this, it breaks backwards
>>>> compatibility with userland & thus cannot be applied.
>>>
>>> Never observed since first version.
>>>
>>> In other side, the problem with apps like ssh_keygen is observed in
>>> absence of executable stack protection.
>>
>> You cannot change the default.
>>
>> If your ssh_keygen is broken, get a working version.
>
> It is actually any application which requests non-executable stack
> protection and needs some emulation BEFORE GLIBC cancels that
> non-executable stack protection due to libraries.
>
> If you build all libraries with PT_GNU_STACK 'non-executable' and use
> application with the same protection then you can't emulate even a
> single instruction - it crashes immediately. So, it is not a bad
> application, it is a bad choice for emulation space in past.
>

This just means that your userspace is broken.

If GLibC cannot do the right thing then it should be fixed.

The very first thing that is executed is ld.so, you need to make your 
ld.so do the right thing before transferring control to your program's 
entry point.

You cannot change the default setting for executable stack just because 
you have created a broken userspace.

The ability of legacy userspace to continue functioning cannot be 
sacrificed.

David Daney

Received: from mailapp01.imgtec.com ([195.59.15.196]:13401 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012535AbbHFArAWMfVx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 6 Aug 2015 02:47:00 +0200
Message-ID: <55C2AE7B.4040805@imgtec.com>
Date: Wed, 5 Aug 2015 17:46:51 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/3] MIPS: set stack/data protection as non-executable
References: <20150805234348.20722.71740.stgit@ubuntu-yegoshin> <20150805234936.20722.60927.stgit@ubuntu-yegoshin> <20150805235543.GG2057@NP-P-BURTON> <55C2A50A.50805@imgtec.com> <55C2A6FE.1020003@caviumnetworks.com> <55C2A91B.1090704@imgtec.com> <55C2AC5B.50408@caviumnetworks.com>
In-Reply-To: <55C2AC5B.50408@caviumnetworks.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney@caviumnetworks.com>
Cc: Paul Burton <paul.burton@imgtec.com>, daniel.sanders@imgtec.com, linux-mips@linux-mips.org, cernekee@gmail.com, Zubair.Kakakhel@imgtec.com, geert+renesas@glider.be, david.daney@cavium.com, peterz@infradead.org, heiko.carstens@de.ibm.com, paul.gortmaker@windriver.com, behanw@converseincode.com, macro@linux-mips.org, cl@linux.com, pkarat@mvista.com, linux@roeck-us.net, tkhai@yandex.ru, james.hogan@imgtec.com, alexinbeijing@gmail.com, rusty@rustcorp.com.au, Steven.Hill@imgtec.com, lars.persson@axis.com, aleksey.makarov@auriga.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, luto@amacapital.net, dahi@linux.vnet.ibm.com, markos.chandras@imgtec.com, eunb.song@samsung.com, kumba@gentoo.org
Message-ID: <20150806004651.TLeOFg-ItKY6SR8lO2OpSXCPCRIvVzRi3dIwiK6x6RQ@z>

On 08/05/2015 05:37 PM, David Daney wrote:
> This just means that your userspace is broken.
>
> If GLibC cannot do the right thing then it should be fixed.

Let's skip this until you explain how to create a fully 
non-executable-stack process. GLIBC people is ready to do something but 
after we remove emulation from stack.

>
>
> You cannot change the default setting for executable stack just 
> because you have created a broken userspace.

Please give me at least one example, one existing application which 
would suffer.

I remember that people already wrote here that this kind of apps (which 
is based on eXecutable stack and doesn't announce it in PT_GNU_STACK) 
need to be eliminated.

>
> The ability of legacy userspace to continue functioning cannot be 
> sacrificed.
>

Not at any price.

However, this switch is a separate patch from others. It can be not 
applied or it can be applied, depending from prevailing mind - what is 
more significant, some (unknown) app or non-executable stack protection.

- Leonid.

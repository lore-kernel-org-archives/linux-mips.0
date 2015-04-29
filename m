Received: from mailapp01.imgtec.com ([195.59.15.196]:33680 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012146AbbD2PMqXyxmY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 29 Apr 2015 17:12:46 +0200
Message-ID: <5540F4E9.7010100@imgtec.com>
Date: Wed, 29 Apr 2015 16:12:41 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS64: R6: R2 emulation bugfix
References: <20150428195335.11229.4516.stgit@ubuntu-yegoshin> <5540A1BF.7060408@imgtec.com> <alpine.LFD.2.11.1504291025430.17786@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.11.1504291025430.17786@eddie.linux-mips.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Maciej W. Rozycki" <macro@linux-mips.org>, James Hogan <james.hogan@imgtec.com>
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org
Message-ID: <20150429151241.H70jCMzi7ML0sAwv7jaFhyJMGn5UOBSpvpDdPJdpiTU@z>

On 04/29/2015 10:49 AM, Maciej W. Rozycki wrote:
> On Wed, 29 Apr 2015, James Hogan wrote:
> 
>>> Error recovery pointers for fixups was improperly set as ".word"
>>> which is unsuitable for MIPS64.
>>>
>>> Replaced by __stringify(PTR)
>>
>> Every other case of this sort of thing uses STR(PTR) (or __UA_ADDR in
>> uaccess.h). Can we stick to STR(PTR) for consistency please?
> 
>  Or __PA_ADDR in paccess.h.
> 
>  I have mixed feelings, the reason for __stringify being absent is the 
> macro being generic and more recently added than pieces of code that use 
> STR, e.g. unaligned.c that has been there since forever.  And we do use 
> __stringify in many other cases.
> 
>  On the other hand STR is short and sweet, unlike __stringify.

The patch overall looks good to me so here is my

Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>

I do agree with James that it would be nice to have it in stable 4.0+ as
well.

I don't particularly care if STR() is going to be used at the end or we
stick to __stringify. Both are used in arch/mips/* anyway

-- 
markos

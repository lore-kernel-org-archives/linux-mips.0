Received: from mailapp01.imgtec.com ([195.59.15.196]:52330 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026373AbbD3Wsrv9p9K (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 1 May 2015 00:48:47 +0200
Message-ID: <5542B019.7010303@imgtec.com>
Date: Thu, 30 Apr 2015 15:43:37 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS64: R6: R2 emulation bugfix
References: <20150428195335.11229.4516.stgit@ubuntu-yegoshin> <5540A1BF.7060408@imgtec.com> <alpine.LFD.2.11.1504291025430.17786@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.11.1504291025430.17786@eddie.linux-mips.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
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
To: "Maciej W. Rozycki" <macro@linux-mips.org>, James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org, markos.chandras@imgtec.com, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org
Message-ID: <20150430224337.oSQe21QKYCqK0xSHq4VzS6zvtC1eWcGTxKUlB-lnQgU@z>

On 04/29/2015 02:49 AM, Maciej W. Rozycki wrote:
> On Wed, 29 Apr 2015, James Hogan wrote:
>
>>> Error recovery pointers for fixups was improperly set as ".word"
>>> which is unsuitable for MIPS64.
>>>
>>> Replaced by __stringify(PTR)
>> Every other case of this sort of thing uses STR(PTR) (or __UA_ADDR in
>> uaccess.h). Can we stick to STR(PTR) for consistency please?
>   Or __PA_ADDR in paccess.h.
>
>   I have mixed feelings, the reason for __stringify being absent is the
> macro being generic and more recently added than pieces of code that use
> STR, e.g. unaligned.c that has been there since forever.  And we do use
> __stringify in many other cases.
>
>   On the other hand STR is short and sweet, unlike __stringify.
>
>   So how about adding a macro like __STR_PTR that expands to
> __stringify(PTR) and converting all the places throughout our port
> (including ones currently using __UA_ADDR/__PA_ADDR) to use the new macro?
>
>   Leonid's bug fix will need to go in first of course.
>
>    Maciej
As for me, I don't mind which solution is - STR/__stringify or __PA_ADDR.
I just would like to have one for future submissions and I assumed that 
__stringify is it because it a last one so far introduced.

So, I put a decision to maintainer. Ralf?

- Leonid.

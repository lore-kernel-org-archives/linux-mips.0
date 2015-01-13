Received: from mailapp01.imgtec.com ([195.59.15.196]:34018 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010496AbbAMNNI6qfrR (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Jan 2015 14:13:08 +0100
Message-ID: <54B519DE.4010708@imgtec.com>
Date: Tue, 13 Jan 2015 13:13:02 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH RFC 12/67] MIPS: asm: asmmacro: Replace add instructions
 with "addui"
References: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com> <1418915416-3196-13-git-send-email-markos.chandras@imgtec.com> <54932370.605@gmail.com> <5493E97A.1070608@imgtec.com> <alpine.LFD.2.11.1501112322130.27458@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.11.1501112322130.27458@eddie.linux-mips.org>
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
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20150113131302.agqjIJzePUcSdMT561-JZEsuPVYLBe0CdUsXnVBRBC0@z>

On 01/11/2015 11:34 PM, Maciej W. Rozycki wrote:
> On Fri, 19 Dec 2014, Markos Chandras wrote:
> 
>>>> The use of "add" instruction for immediate operations is wrong and
>>>> relies to gas being smart enough to notice that and replace it with
>>>> either addi or addui. However, MIPS R6 removed the addi instruction
>>>> so, fix this problem properly by using the correct instruction
>>>> directly.
> 
>  Not true, depending on the arguments the ADD assembly macro expands to 
> either of the ADD and the ADDI hardware instructions; where an immediate 
> outside the 16-bit signed range is used it also expands to a longer 
> sequence involving LUI and the actual operation is ADD.  It never expands 
> to ADDIU (which I gather you meant).
> 
>>> This is another case of the use of "add" being a real bug.  We should
>>> never have faulting instructions like this in the kernel.
>>>
>>> Can you send all patches in this set that fix this bug as a separate
>>> patch?  Since they are obviously correct, and really should be used by
>>> all non-R6 processors, we can get them in sooner that the entire R6 thing.
>>>
>>> Thanks,
>>> David Daney
>>
>> sure i will move these patches away from R6 and post them separately.
> 
>  I think using the ADDU macro is preferred here as it allows arbitrary 
> 32-bit values for `off', just like with memory references in MIPS assembly 
> instructions.
> 
>   Maciej
> 
Hi,

What ADDU macro?

-- 
markos

Received: from mailapp01.imgtec.com ([195.59.15.196]:9809 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011361AbbAZMEWn9njT (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Jan 2015 13:04:22 +0100
Message-ID: <54C62D40.3040906@imgtec.com>
Date: Mon, 26 Jan 2015 12:04:16 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] MIPS: HTW: Prevent accidental HTW start due to nested
 htw_{start,stop}
References: <1422265236-29290-1-git-send-email-markos.chandras@imgtec.com> <1422265236-29290-3-git-send-email-markos.chandras@imgtec.com> <54C626CC.2070104@imgtec.com> <54C62941.6060604@imgtec.com> <54C62D26.80907@imgtec.com>
In-Reply-To: <54C62D26.80907@imgtec.com>
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
To: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Cc: stable@vger.kernel.org
Message-ID: <20150126120416.stl2a_tDlWSeG2yWVAUUd7tSvHI_tnUs4LgrC_cc-S0@z>

On 01/26/2015 12:03 PM, James Hogan wrote:
> On 26/01/15 11:47, Markos Chandras wrote:
>> On 01/26/2015 11:36 AM, James Hogan wrote:
>>
>>>
>>>> +		raw_current_cpu_data.htw_seq++;				\
>>>
>>> not "if (!raw_current_cpu_data.htw_seq++)) {"?
>> Why?
>>
>> on _stop() calls you just increment it. The _start() will do the right
>> thing then.
>>
>> I think what you suggest it to move the if() condition from the _start()
>> to _stop().
> 
> I just mean you only need to disable htw the first time its called. I
> guess the extra branch every time could be worse than the extra disable
> and ehb when nesting does occur, so its probably premature optimisation.
> 
> Up to you.
> 
> Cheers
> James
> 
good idea i will change it.

-- 
markos

Received: from mailapp01.imgtec.com ([195.89.28.114]:50825 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6817913AbaDKKSfLx9ki (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 11 Apr 2014 12:18:35 +0200
Message-ID: <5347C173.30902@imgtec.com>
Date: Fri, 11 Apr 2014 11:18:27 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: use current instead of task in syscall_get_arch
References: <1397183132-16528-1-git-send-email-eparis@redhat.com> <20140411024334.GD24821@madcap2.tricolour.ca>
In-Reply-To: <20140411024334.GD24821@madcap2.tricolour.ca>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
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
To: Richard Guy Briggs <rgb@redhat.com>, Eric Paris <eparis@redhat.com>
Cc: linux-audit@redhat.com, Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20140411101827.7B5HL83D2HElElV7f7VhiHvM6MmDDUDUwDvXNUda0ZI@z>

On 04/11/2014 03:43 AM, Richard Guy Briggs wrote:
> On 14/04/10, Eric Paris wrote:
>> In commit 6e345746 Markos started using task to determine 64bit vs
>> 32bit instead of it being completely CONFIG based.
>>
>> In commit 5e937a9a we dropped the 'task' argument to syscall_get_arch()
>> across the entire system.
>>
>> This obviously results in a build failure when Linus's and the audit
>> tree were merged.  This patch should be applied as part of the merge
>> conflict, as both sides of the merge are correct and the failure happens
>> AT the merge.
>>
>> The fix is simple.  The task is always current.  Use current.
>>
>> Signed-off-by: Eric Paris <eparis@redhat.com>
>> Cc: markos.chandras@imgtec.com
>> Cc: Paul Burton <paul.burton@imgtec.com>
>> Cc: James Hogan <james.hogan@imgtec.com>
>> Cc: linux-mips@linux-mips.org
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>

Looks good to me. Thanks for taking care of that.

Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>

-- 
markos

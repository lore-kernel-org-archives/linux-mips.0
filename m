Received: from resqmta-po-12v.sys.comcast.net ([IPv6:2001:558:fe16:19:96:114:154:171]:43178
        "EHLO resqmta-po-12v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990394AbdJKNSdDCwyK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 11 Oct 2017 15:18:33 +0200
Subject: Re: Question regarding atomic ops
References: <eb17f62d-c347-e470-f9cf-06b18a55481e@gentoo.org>
 <4f77107c-18ba-d549-c5f2-d52d0460377b@gentoo.org>
 <20171010142306.GA24194@linux-mips.org>
From: Joshua Kinard <kumba@gentoo.org>
Message-ID: <5b5db1f6-c00b-6b84-6d94-7776457f8678@gentoo.org>
Date: Wed, 11 Oct 2017 09:15:21 -0400
MIME-Version: 1.0
In-Reply-To: <20171010142306.GA24194@linux-mips.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <kumba@gentoo.org>
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
Cc: linux-mips@linux-mips.org
Message-ID: <20171011131521.gFCbsv2t4M9hMy1GC53atzdCpUoxQ52D_GJZfbfUFS0@z>

On 10/10/2017 10:23, Ralf Baechle wrote:
> On Mon, Oct 09, 2017 at 10:34:43PM -0400, Joshua Kinard wrote:
> 
>> On 10/09/2017 22:24, Joshua Kinard wrote:
>>
>> [snip]
>>
>>> This raises the question of why was the standard "kernel_uses_llsc" case
>>> changed but not the R10000_LLSC_WAR case?  The changes seem like they would be
>>> applicable to the older R10K CPUs regardless, since this is before a lot of the
>>> code for the newer ISAs (R2+) was added.  I am getting a funny feeling that a
>>> lot of these templates need to be re-written (maybe even in plain C, given
>>> newer gcc's better intelligence) and other useful cleanups done.  I am not
>>> fluent in MIPS asm enough, though, to know what to change.
>>
>> Answered one of my own questions via this buried commit from ~2006/2007 that
>> has a commit message, but no changed files:
>>
>> https://git.linux-mips.org/cgit/ralf/linux.git/commit/arch/mips/include/asm/atomic.h?id=5999eca25c1fd4b9b9aca7833b04d10fe4bc877d
>>
>>> [MIPS] Improve branch prediction in ll/sc atomic operations.
>>> Now that finally all supported versions of binutils have functioning
>>> support for .subsection use .subsection to tweak the branch prediction
>>>
>>> I did not modify the R10000 errata variants because it seems unclear if
>>> this will invalidate the workaround which actually relies on the cheesy
>>> prediction of branch likely to cause a misspredict if the sc was
>>> successful.
>>>
>>> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
>>
>> Seems like that second paragraph is a ripe candidate for a comment block so
>> this is better documented :)
> 
> Btw, I reasonably certain applying the change to the R10000 LL/SC workaround
> versions as well would work.  But testing is difficult, even with hardware
> at hand - and the other option asing a R10000 RTL designer is tricky about
> 20 years later!

Okay, I'll see about playing with that file and collapsing that it down in size
somewhat by merging the standard and R10000_LLSC_WAR cases in a similar way
that arch/mips/include/asm/cmpxchg.h was done uses the '__scbeqz' macro.  I
don't have any older R10000 CPUs affected by the errata to test with, but I can
at least test the code path under R12K+ to make sure things still work.

---

For the RCU stalls, I found this tidbit of information:
o	Booting Linux using a console connection that is too slow to
	keep up with the boot-time console-message rate.  For example,
	a 115Kbaud serial console can be -way- too slow to keep up
	with boot-time message rates, and will frequently result in
	RCU CPU stall warning messages.  Especially if you have added
	debug printk()s.

Received: from mailapp01.imgtec.com ([195.59.15.196]:17227 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011346AbaJ1NYySQd0b (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Oct 2014 14:24:54 +0100
Message-ID: <544F991E.3070500@imgtec.com>
Date: Tue, 28 Oct 2014 13:24:46 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: Boot problems on Malta with EVA (bisected to 12220dea07f1 "mm/slab:
 support slab merge")
References: <544F73CD.1010409@imgtec.com> <CAAmzW4NdBNhsPtx1yw+drN+J=a23SS3yLkgQdvQx-Giokwxu-Q@mail.gmail.com> <544F97D4.4030408@imgtec.com>
In-Reply-To: <544F97D4.4030408@imgtec.com>
Content-Type: text/plain; charset="utf-8"
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
To: Joonsoo Kim <js1304@gmail.com>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-mips@linux-mips.org
Message-ID: <20141028132446.srlkPxMEMLq7U0NC8_krnAFEUffLwE1pcGzXkjzvc6E@z>

On 10/28/2014 01:19 PM, Markos Chandras wrote:
> On 10/28/2014 01:01 PM, Joonsoo Kim wrote:
>> 2014-10-28 19:45 GMT+09:00 Markos Chandras <Markos.Chandras@imgtec.com>:
>>> Hi,
>>>
>>> It seems I am unable to boot my Malta with EVA. The problem appeared in
>>> the 3.18 merge window. I bisected the problem (between v3.17 and
>>> v3.18-rc1) and I found the following commit responsible for the broken boot.
>>
>> Hello,
>>
>> Did you start to bisect from v3.18-rc1?
>> I'd like to be sure that this is another bug which is fixed by following commit.
>>
>> commit 85c9f4b04a08f6bc770b77530c22d04103468b8f
>> Author: Joonsoo Kim <iamjoonsoo.kim@lge.com>
>> Date:   Mon Oct 13 15:51:01 2014 -0700
>>
>>     mm/slab: fix unaligned access on sparc64
>>
>> This fix is merged into v3.18-rc1 sometime later that
>> 'support slab merge' is merged.
>>
>> Thanks.
>>
> Hi,
> 
> I bisected from v3.17 until 3.18-rc1. But 3.18-rc2 and the latest
> mainline (f7e87a44ef60ad379e39b45437604141453bf0ec) still have the same
> problem
> 
> btw i did more tests and this is not EVA specific. A maltaup_defconfig
> fails in the same way. I suspect all malta*_defconfigs will fail in a
> similar way which makes it probably easier for you to reproduce it on a
> QEMU.
> 

sorry maltaup_defconfig does not fail. maltasmvp_defconfig does. So it
might be a similar problem like the one fixed in
85c9f4b04a08f6bc770b77530c22d04103468b8f

-- 
markos

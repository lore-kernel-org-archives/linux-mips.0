Received: from [119.145.14.66] ([119.145.14.66]:47715 "EHLO
        szxga03-in.huawei.com" rhost-flags-FAIL-FAIL-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6819446AbaE2I5oo0Zl1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 May 2014 10:57:44 +0200
Message-ID: <5386F663.4010401@huawei.com>
Date: Thu, 29 May 2014 16:57:07 +0800
From: Li Zefan <lizefan@huawei.com>
MIME-Version: 1.0
Subject: Re: [PATCH V2] MIPS: change type of asid_cache to unsigned long
References: <1400650563-1033-1-git-send-email-yong.zhang@windriver.com> <5384119E.7010606@huawei.com> <20140528200929.GA30528@drone.musicnaut.iki.fi>
In-Reply-To: <20140528200929.GA30528@drone.musicnaut.iki.fi>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <lizefan@huawei.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Yong Zhang <yong.zhang@windriver.com>, ralf@linux-mips.org, huawei.libin@huawei.com, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Xinwei Hu <huxinwei@huawei.com>
Message-ID: <20140529085707.5qLUJPMbdyg3G5NQ8vqfJkDgdvsE4I_ua5qF2pmIIKc@z>

On 2014/5/29 4:09, Aaro Koskinen wrote:
> Hi,
> 
> On Tue, May 27, 2014 at 12:16:30PM +0800, Li Zefan wrote:
>> On 2014/5/21 13:36, Yong Zhang wrote:
>>> asid_cache must be unsigned long otherwise on 64bit system
>>> it will become 0 if the value in get_new_mmu_context()
>>> reaches 0xffffffff and in the end the assumption of
>>> ASID_FIRST_VERSION is not true anymore thus leads to
>>> more dangerous things.
>>
>> We should describe what problem this bug can lead to, which
>> will help people who encounter the same problem and google it.
> 
> Please describe it, then. Even if the patch is already committed,
> googling would probably still find this e-mail thread.
> 

I don't think Ralf has committed it, so we'll send out a fix
with detailed changelog.

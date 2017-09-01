Received: from mail.cn.fujitsu.com ([183.91.158.132]:35702 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23991826AbdIAIyMy401N (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 1 Sep 2017 10:54:12 +0200
Subject: Re: [PATCH v2 2/7] MIPS: numa: Remove the unused parent_node() macro
References: <1504234599-29533-1-git-send-email-douly.fnst@cn.fujitsu.com>
 <1504234599-29533-3-git-send-email-douly.fnst@cn.fujitsu.com>
 <20170901084255.GA19890@linux-mips.org>
From: Dou Liyang <douly.fnst@cn.fujitsu.com>
Message-ID: <8d57c5de-9965-3423-6325-89db6c798a51@cn.fujitsu.com>
Date: Fri, 1 Sep 2017 16:54:01 +0800
MIME-Version: 1.0
In-Reply-To: <20170901084255.GA19890@linux-mips.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <douly.fnst@cn.fujitsu.com>
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
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20170901085401.2pTjjd0LOIu45LL5nzJlHYrFOQdjhISpXJ6H-hNmPW0@z>

Hi Ralf,

At 09/01/2017 04:42 PM, Ralf Baechle wrote:
> On Fri, Sep 01, 2017 at 10:56:34AM +0800, Dou Liyang wrote:
>
>> Commit a7be6e5a7f8d ("mm: drop useless local parameters of
>> __register_one_node()") removes the last user of parent_node().
>>
>> The parent_node() macros in both IP27 and Loongson64 are unnecessary.
>>
>> Remove it for cleanup.
>
> I already applied v1.
>

Thank you very much. :-)

Maybe I missed some message, so I thought it was not yet accepted.

please ignore this patch.

Thanks,
	dou
> Thanks,
>
>   Ralf
>
>
>

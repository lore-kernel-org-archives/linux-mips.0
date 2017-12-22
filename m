Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:54978 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990407AbdLVHTwLzo6X (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Dec 2017 08:19:52 +0100
Subject: Re: [RFC] MIPS memblock: Remove bootmem code and switch to NO_BOOTMEM
References: <20171219201400.GA10185@mobilestation>
From: Marcin Nowakowski <marcin.nowakowski@mips.com>
Message-ID: <eace1075-4e3f-1f0c-50ed-73a566ecd39b@mips.com>
Date: Fri, 22 Dec 2017 08:18:09 +0100
MIME-Version: 1.0
In-Reply-To: <20171219201400.GA10185@mobilestation>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <Marcin.Nowakowski@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Serge Semin <fancer.lancer@gmail.com>, ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, matt.redfearn@imgtec.com, james.hogan@imgtec.com, alexander.sverdlin@nokia.com, marcin.nowakowski@imgtec.com, f.fainelli@gmail.com, kumba@gentoo.org
Cc: Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20171222071809.2SMqiWq-zh03wDRKiw-ziC0_3vCrvpmej1xAAoboIvg@z>

Hi Serge,

On 19.12.2017 21:14, Serge Semin wrote:
> Hello folks,
> 
> Almost a year ago I sent a patchset to the Linux MIPS community. The main target of the patchset
> was to get rid from the old bootmem allocator usage at the MIPS architecture. Additionally I had
> a problem with CMA usage on my MIPS machine due to some struct page-related issue. Moving to the
> memblock allocator fixed the problem and gave us benefits like smaller memory consumption,
> powerful memblock API to be used within the arch code.
> 
> @marcin.nowakowski@imgtec.com. Could you confirm if you are still interested in the patchset and
> ready to update the Loongson64 platform code so one would be compatible with it?

I am currently working on different projects, but I will try to do my 
best to help with this (but just might require more time than I would 
otherwise need).
Given the scale of the task and the amount of testing required, I expect 
that it will take a while to get a complete set of patches reviewed and 
tested which should hopefully be enough to fix support for all platforms 
affected.

Marcin

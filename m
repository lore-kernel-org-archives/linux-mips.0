Received: from mailapp01.imgtec.com ([195.59.15.196]:25711 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992213AbdEVMTRDSL2Y (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 22 May 2017 14:19:17 +0200
Subject: Re: [PATCH 00/21] MIPS memblock: Remove bootmem code and switch to
 NO_BOOTMEM
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
 <be0b6614-708d-a32a-029d-7e606a673e5b@imgtec.com>
 <20170522102643.GA17763@mobilestation>
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <eeb52dd6-3fdd-01b9-6774-236ab50e3f4d@imgtec.com>
Date: Mon, 22 May 2017 14:19:09 +0200
MIME-Version: 1.0
In-Reply-To: <20170522102643.GA17763@mobilestation>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Marcin.Nowakowski@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, matt.redfearn@imgtec.com, james.hogan@imgtec.com, alexander.sverdlin@nokia.com, robh+dt@kernel.org, frowand.list@gmail.com, Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20170522121909.-VfzvCpr1tvfwgDb8Lx1v1MZVa1FSZQgW2Db08ZV6CA@z>

Hi Serge,

On 22.05.2017 12:26, Serge Semin wrote:

> Regarding the patchset. I'm still pretty much eager to make it being
> part of kernel MIPS arch. But there was a problem I outlined
> in the patchset header message, which I can't fix by myself.
> Particulary It's connected with Loonson3 or SGI IP27 code alteration,
> so to make it free of ancient boot_mem_map dependencies (see the
> patchset header message). Without a help from someone, who has
> Loonson64 and SGI IP27 hardware and strong desire to make it free of
> old bootmem allocator, it is useless to make any progress from my
> side. That's why Ralf moved this email-thread into RFC actually.
> Anyway If either you or someone else has got such hardware and is
> interested in the cooperation, I'll be more than happy to push
> my efforts forward with this patchset contribution. But only after
> I got a bit less busy with my work. As I said it will happen within
> next 1-2 months. So do you have the hardware and desire to be part
> of this?

I should be able to update/test the changes on a Loongson64 platform.


Marcin

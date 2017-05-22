Received: from mailapp01.imgtec.com ([195.59.15.196]:22332 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992517AbdEVJsns3U-X (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 22 May 2017 11:48:43 +0200
Subject: Re: [PATCH 00/21] MIPS memblock: Remove bootmem code and switch to
 NO_BOOTMEM
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <be0b6614-708d-a32a-029d-7e606a673e5b@imgtec.com>
Date: Mon, 22 May 2017 11:48:36 +0200
MIME-Version: 1.0
In-Reply-To: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
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
To: Serge Semin <fancer.lancer@gmail.com>, ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, matt.redfearn@imgtec.com, james.hogan@imgtec.com, alexander.sverdlin@nokia.com, robh+dt@kernel.org, frowand.list@gmail.com
Cc: Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20170522094836.GzolKfNxA4Fd2dAaxnayxcUHqiaHYHJuJIGZ1wfQP8o@z>

Hi Serge,

On 19.12.2016 03:07, Serge Semin wrote:
> Most of the modern platforms supported by linux kernel have already
> been cleaned up of old bootmem allocator by moving to nobootmem
> interface wrapping up the memblock. This patchset is the first
> attempt to do the similar improvement for MIPS for UMA systems
> only.
>
> Even though the porting was performed as much careful as possible
> there still might be problem with support of some platforms,
> especially Loonson3 or SGI IP27, which perform early memory manager
> initialization by their self.
>
> The patchset is split so individual patch being consistent in
> functional and buildable ways. But the MIPS early memory manager
> will work correctly only either with or without the whole set being
> applied. For the same reason a reviewer should not pay much attention
> to methods bootmem_init(), arch_mem_init(), paging_init() and
> mem_init() until they are fully refactored.
>
> The patchset is applied on top of kernel v4.9.

Have you progressed any further with these patches?
They would definitely be useful to include for MIPS arch, so can you let 
us know if you are planning to send any updated version?

thanks,
Marcin

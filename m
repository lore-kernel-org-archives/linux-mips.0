Received: from dns0.mips.com ([12.201.5.70]:37039 "EHLO dns0.mips.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1903709Ab2DJSDt (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 10 Apr 2012 20:03:49 +0200
Message-ID: <4F8475F7.9060809@mips.com>
Date: Tue, 10 Apr 2012 11:03:35 -0700
From: Leonid Yegoshin <yegoshin@mips.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "MIPS: cache: Provide cache flush operations for
 XFS"
References: <1333987989-1178-1-git-send-email-sjhill@mips.com> <CAJiQ=7AjtSB8KQ9+edUOvW+70nAWzh6c8B26ehnEpuud6QeMJA@mail.gmail.com>
In-Reply-To: <CAJiQ=7AjtSB8KQ9+edUOvW+70nAWzh6c8B26ehnEpuud6QeMJA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Kevin Cernekee <cernekee@gmail.com>
Cc: "Steven J. Hill" <sjhill@mips.com>, linux-mips@linux-mips.org, ralf@linux-mips.org
Message-ID: <20120410180335.rIlSdI460FSKcZPTXfzEOPXQNFeto0W3r2tHIw3SSuE@z>

On 04/09/2012 07:44 PM, Kevin Cernekee wrote:
> On Mon,Is there a reason why Ralf's original approach was not workable?

It doesn't work with HIGHMEM + cache aliasing. It also uses cache flush 
(blast_dcache) to buffer instead of cache invalidate after read I/O is 
completed.


> I suspect that reimplementing the *_kernel_vmap_range functions using
> _dma_cache_* would result in a double L2 flush on the same memory
> regions on systems with cache aliases, and an unnecessary L1+L2 flush
> on systems without aliases.

Good point. I put that to set it working. Now, after your comment, I 
think it has sense to try with L1 only.

- Leonid.

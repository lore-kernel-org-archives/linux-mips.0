Received: from mailapp02.imgtec.com ([217.156.133.132]:41269 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992168AbcIVW1tlYQfo (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 23 Sep 2016 00:27:49 +0200
Message-ID: <57E45ADD.6000202@imgtec.com>
Date: Thu, 22 Sep 2016 15:27:41 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 7/9] MIPS: uprobes: Flush icache via kernel address
References: <cover.d93e43428f3c573bdd18d7c874830705b39c3a8a.1472747205.git-series.james.hogan@imgtec.com> <0d915756776de050b8a92b5bb5d4e7ffbe784d66.1472747205.git-series.james.hogan@imgtec.com> <20160921132656.GF14137@linux-mips.org> <57E2CE5B.8020406@imgtec.com> <20160922211527.GB7352@jhogan-linux.le.imgtec.org> <57E44F59.5050600@imgtec.com> <7C466D41-C786-48E0-9BFB-1024D6F9AFFC@imgtec.com>
In-Reply-To: <7C466D41-C786-48E0-9BFB-1024D6F9AFFC@imgtec.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20160922222741.NZc9MSWFZ1QvYwLyP0EyebAvBfir6IhGmV6GKY-NieA@z>

On 09/22/2016 03:13 PM, James Hogan wrote:
> well it'll do a protected dcache flush (i.e. using CACHEE with EVA). Would kmap/kunmap or variants (fixed to work with aliasing dcache) be able to take care of colouring / further flushing?

We should flush kernel D-cache and user I-cache in any cache aliasing 
system. I was wrong - a fixed HIGHMEM doesn't do any difference 
actually, because page may be located in directly addressed memory (all 
HIGHMEM stuff is irrelevant in this case, kmap returns a lowmem address).

>
> In any case, simply changing to the user_ one is a no-op compared to leaving as is where patch 9 would probably break it on EVA by making it operate only on kernel addresses.

EVA or not has no difference here - kernel address can still be a 
different color to user address.

And keeping kernel I-cache flush does break it really, not EVA.

- Leonid.

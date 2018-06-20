Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:52569 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990395AbeFTCrkJHLVB (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 20 Jun 2018 04:47:40 +0200
Date: Tue, 19 Jun 2018 19:47:34 -0700
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v5] MIPS: Fix ejtag handler on SMP
Message-ID: <20180620024734.eeuqrm7tg2y2i5mw@pburton-laptop>
References: <20180611090110.27978-1-r@hev.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180611090110.27978-1-r@hev.cc>
Return-Path: <Paul.Burton@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: r@hev.cc
Cc: linux-mips@linux-mips.org, jhogan@kernel.org, ralf@linux-mips.org
Message-ID: <20180620024734.vz_GgeMWSg-VIPHu2axtUnrcno7hIRmb7W5jib5kpJs@z>

Hi Heiher,

On Mon, Jun 11, 2018 at 05:01:10PM +0800, r@hev.cc wrote:
> From: Heiher <r@hev.cc>
> 
> On SMP systems, the shared ejtag debug buffer may be overwritten by
> other cores, because every cores can generate ejtag exception at
> same time.
> 
> Unfortunately, in that context, it's difficult to relax more registers
> to access per cpu buffers. so use ll/sc to serialize the access.
> 
> Signed-off-by: Heiher <r@hev.cc>
> ---
>  arch/mips/kernel/genex.S | 46 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)

Thanks, applied to mips-next for 4.19.

Paul

Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:47525 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990486AbdLUWPGKsfLy (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 21 Dec 2017 23:15:06 +0100
Date: Thu, 21 Dec 2017 14:12:43 -0800
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v2 0/2] MIPS: Augment CPC support
Message-ID: <20171221221242.w2kcgob3e2of75cr@pburton-laptop>
References: <1513869627-15391-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1513869627-15391-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Cc: linux-mips@linux-mips.org, Aleksandar Markovic <aleksandar.markovic@mips.com>, Dengcheng Zhu <dengcheng.zhu@mips.com>, Douglas Leung <douglas.leung@mips.com>, Goran Ferenc <goran.ferenc@mips.com>, James Hogan <james.hogan@mips.com>, linux-kernel@vger.kernel.org, Matt Redfearn <matt.redfearn@mips.com>, Miodrag Dinic <miodrag.dinic@mips.com>, Petar Jovanovic <petar.jovanovic@mips.com>, Raghu Gandham <raghu.gandham@mips.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20171221221243.08wmKHPBgxbhMN0tNJRv54CFtdjGxtH7OCCA5N-vQl8@z>

Hi Aleksandar,

On Thu, Dec 21, 2017 at 04:20:22PM +0100, Aleksandar Markovic wrote:
> From: Aleksandar Markovic <aleksandar.markovic@mips.com>
> 
> v1->v2:
> 
>     - corrected wording in commit messages and documentation text
>     - expanded cover letter to better explain the context of proposed
>         changes
>     - rebased to the latest code
> 
> This series is based on two patches from the larger series submitted
> some time ago (30 Aug 2016):
> 
> https://www.linux-mips.org/archives/linux-mips/2016-08/msg00456.html
> 
> Both patches deal with MIPS Cluster Power Controller (CPC) support.
> More specifically, they add device tree related functionalities to
> that support.
> 
> This functionality is needed for further development of kernel support
> for generic-based MIPS platforms that must be DT-based and will at the
> same time make more extensive use of CPC.

FWIW:

    Reviewed-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

> Paul Burton (2):
>   dt-bindings: Document mti,mips-cpc binding
>   MIPS: CPC: Map registers using DT in mips_cpc_default_phys_base()
> 
>  Documentation/devicetree/bindings/misc/mti,mips-cpc.txt |  8 ++++++++
>  arch/mips/kernel/mips-cpc.c                             | 13 +++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/mti,mips-cpc.txt
> 
> -- 
> 2.7.4
> 

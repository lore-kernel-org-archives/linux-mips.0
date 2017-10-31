Received: from 19pmail.ess.barracuda.com ([64.235.154.230]:45946 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991726AbdJaWAj50wzl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 31 Oct 2017 23:00:39 +0100
Date: Tue, 31 Oct 2017 22:00:11 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH] MIPS: microMIPS: Fix incorrect mask in insn_table_MM
Message-ID: <20171031220011.GC15260@jhogan-linux>
References: <20171031053503.GA5164@embeddedor.com>
 <20171031070804.GB15260@jhogan-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20171031070804.GB15260@jhogan-linux>
Return-Path: <James.Hogan@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Julia Lawal <julia.lawall@lip6.fr>
Message-ID: <20171031220011.6TUpsn12gMG-FB98oTUkMn0g-ADMphR8bxOpuxyMk_o@z>

On Tue, Oct 31, 2017 at 07:08:04AM +0000, James Hogan wrote:
> On Tue, Oct 31, 2017 at 12:35:03AM -0500, Gustavo A. R. Silva wrote:
> > Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
> 
> Reviewed-by: James Hogan <jhogan@@kernel.org>

That should of course be:

Reviewed-by: James Hogan <jhogan@kernel.org>

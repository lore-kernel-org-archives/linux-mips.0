Received: from mailapp01.imgtec.com ([195.59.15.196]:9158 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993869AbdGCRWrhrh-p (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 3 Jul 2017 19:22:47 +0200
Date: Mon, 3 Jul 2017 18:22:31 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PING][PATCH 0/4] MIPS16e2 ASE support
In-Reply-To: <alpine.DEB.2.00.1705180145220.2590@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1707031819490.3339@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1705180145220.2590@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20170703172231.bvJAF6Bnk6PbFDV9VAvq4xiFPSjADD84EAzOMq0ARIc@z>

On Tue, 23 May 2017, Maciej W. Rozycki wrote:

>  This patch series adds MIPS16e2 ASE support as per the architecture 
> specification[1].  Included there's feature identification, reporting and 
> necessary instruction emulation.  These patches have been checked with 
> interAptiv MR2 hardware to verify that new MIPS16e2 functions operate 
> correctly and with 74Kf hardware to verify that no regression has been 
> casued with original MIPS16e support.  See individual descriptions for the 
> details of each change made.

 These patches:

<https://patchwork.linux-mips.org/patch/16094/>
<https://patchwork.linux-mips.org/patch/16095/>
<https://patchwork.linux-mips.org/patch/16096/>
<https://patchwork.linux-mips.org/patch/16097/>

are pending review, please help.

  Maciej

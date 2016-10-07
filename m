Received: from mailapp02.imgtec.com ([217.156.133.132]:17659 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992226AbcJGPXOBayAE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 7 Oct 2016 17:23:14 +0200
Date: Fri, 7 Oct 2016 16:22:59 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] MIPS: VDSO: Drop duplicated -I*/-E* aflags
In-Reply-To: <21016db2fc628c73bc6efa1530ebeb866a30d6ae.1475832139.git-series.james.hogan@imgtec.com>
Message-ID: <alpine.DEB.2.00.1610071622400.31859@tp.orcam.me.uk>
References: <21016db2fc628c73bc6efa1530ebeb866a30d6ae.1475832139.git-series.james.hogan@imgtec.com>
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
To: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20161007152259.MlEKIVtnfJb2YGAv8oIbeWyOWtCufclcUGK52d6DhG8@z>

On Fri, 7 Oct 2016, James Hogan wrote:

> The aflags-vdso is based on ccflags-vdso, which already contains the -I*
> and -EL/-EB flags from KBUILD_CFLAGS, but those flags are needlessly
> added again to aflags-vdso.
> 
> Drop the duplication.
> 
> Reported-by: Maciej W. Rozycki <macro@imgtec.com>
> Signed-off-by: James Hogan <james.hogan@imgtec.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-mips@linux-mips.org
> ---

Reviewed-by: Maciej W. Rozycki <macro@imgtec.com>

  Maciej

Received: from mailapp01.imgtec.com ([195.59.15.196]:36174 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993331AbdBIR24nzesl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Feb 2017 18:28:56 +0100
Date: Thu, 9 Feb 2017 17:28:39 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH v2] MIPS: Fix protected_cache(e)_op() for microMIPS
In-Reply-To: <20170209140453.26188-1-james.hogan@imgtec.com>
Message-ID: <alpine.DEB.2.00.1702091724300.26999@tp.orcam.me.uk>
References: <20170209140453.26188-1-james.hogan@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20170209172839.3IDGO1s9iElBq4EyvmZFPAjS-mDqfqqO1kTudtOI16E@z>

On Thu, 9 Feb 2017, James Hogan wrote:

> Ralf: This fixes microMIPS build since a patch that is already merged
> into kvm/next. I was going to send you a pull request for those patches
> anyway, so it probably makes sense if I just append to that branch first
> and let the fix get upstream via the MIPS tree.
> 
> Changes in v2:
> - Correct description, its the .section, not any following assembly
>   which triggers the issue (Maciej)

Reviewed-by: Maciej W. Rozycki <macro@imgtec.com>

  Maciej

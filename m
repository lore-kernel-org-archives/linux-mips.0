Received: from mailapp01.imgtec.com ([195.59.15.196]:45983 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026713AbcDOVTtkASMb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 15 Apr 2016 23:19:49 +0200
Date: Fri, 15 Apr 2016 22:19:42 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH 03/12] MIPS: Remove redundant asm/pgtable-bits.h
 inclusions
Message-ID: <20160415211942.GA21163@NP-P-BURTON>
References: <1460716620-13382-1-git-send-email-paul.burton@imgtec.com>
 <1460716620-13382-4-git-send-email-paul.burton@imgtec.com>
 <20160415191640.GE7859@jhogan-linux.le.imgtec.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20160415191640.GE7859@jhogan-linux.le.imgtec.org>
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-kernel@vger.kernel.org, Jonas Gorski <jogo@openwrt.org>, Markos Chandras <markos.chandras@imgtec.com>, Alex Smith <alex.smith@imgtec.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20160415211942.0Rbl3ZMCCzGQSy82Zu6NB2VcrUOh2zj1N1Qu9zl01LI@z>

On Fri, Apr 15, 2016 at 08:16:40PM +0100, James Hogan wrote:
> On Fri, Apr 15, 2016 at 11:36:51AM +0100, Paul Burton wrote:
> > asm/pgtable-bits.h is included in 2 assembly files and thus has to
> > in either of the assembly files that include it.
> 
> That could do with rewording :-)

Oops, it appears that I accidentally some words.

Originally there was an extra line in the middle so that it read
something like:

  asm/pgtable-bits.h is included in 2 assembly files and thus has to
  #ifdef around C code, however nothing defined by the header is used
  in either of the assembly files that include it.

Ralf: Would you be ok with adding back that line to the commit message
      if this gets merged without needing a v2?

> Otherwise
> Reviewed-by: James Hogan <james.hogan@imgtec.com>

Thanks James :)

Paul

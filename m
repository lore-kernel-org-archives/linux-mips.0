Received: from mailapp01.imgtec.com ([195.59.15.196]:13541 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992388AbdI2P3pKRvoi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 29 Sep 2017 17:29:45 +0200
Date: Fri, 29 Sep 2017 16:29:25 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] MIPS: Fix input modify in __write_64bit_c0_split()
In-Reply-To: <20170919131122.23926-1-james.hogan@imgtec.com>
Message-ID: <alpine.DEB.2.00.1709282351210.12020@tp.orcam.me.uk>
References: <20170919131122.23926-1-james.hogan@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170929152925.DDagtbgfzQTPnAf5l9_cJQHQ8_XiEs6volu69q1bSwg@z>

On Tue, 19 Sep 2017, James Hogan wrote:

> Avoid modifying the input by using a temporary variable as an output
> which is modified instead of the input and not otherwise used. The asm
> is always __volatile__ so GCC shouldn't optimise it out. The low
> register of the temporary output is written before the high register of
> the input is read, so we have two constraint alternatives, one where
> both use the same registers (for when the input value isn't subsequently
> used), and one with an early clobber on the output in case the low
> output uses the same register as the high input. This allows the
> resulting assembly to remain mostly unchanged.

 Clever and well-spotted!

Reviewed-by: Maciej W. Rozycki <macro@imgtec.com>

 NB you could use DINS on MIPS64r2+ (and `__read_64bit_c0_split' could 
use one instruction less; patch posted separately).

  Maciej

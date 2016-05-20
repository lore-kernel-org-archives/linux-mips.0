Received: from mailapp01.imgtec.com ([195.59.15.196]:63425 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27031437AbcETIBy3oDfR (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 20 May 2016 10:01:54 +0200
Date: Fri, 20 May 2016 09:01:33 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] MIPS: Fix write_gc0_* macros when writing zero
In-Reply-To: <1463587478-5815-1-git-send-email-james.hogan@imgtec.com>
Message-ID: <alpine.DEB.2.00.1605200848410.6794@tp.orcam.me.uk>
References: <1463587478-5815-1-git-send-email-james.hogan@imgtec.com>
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
Message-ID: <20160520080133.z1pV6mDi3qPM2y92LgnasUo-ozkFT51Aj3S9riW9jJE@z>

On Wed, 18 May 2016, James Hogan wrote:

> The versions of the __write_{32,64}bit_gc0_register() macros for when
> there is no virt support in the assembler use the "J" inline asm
> constraint to allow integer zero, but this needs to be accompanied by
> the "z" formatting string so that it turns into $0. Fix both macros to
> do this.

 NB `z' here is an "operand code" in GCC-speak.  There's a list of the 
MIPS-specific ones in gcc/config/mips/mips.c above `mips_print_operand'.  
There are a few generic operand codes as well, most notably `a' to print 
an address, matching the `p' constraint.  I think it would be good to have 
this all documented in the GCC manual sometime.

> Fixes: bad50d79255a ("MIPS: Fix VZ probe gas errors with binutils <2.24")
> Signed-off-by: James Hogan <james.hogan@imgtec.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-mips@linux-mips.org
> ---

Reviewed-by: Maciej W. Rozycki <macro@imgtec.com>

  Maciej

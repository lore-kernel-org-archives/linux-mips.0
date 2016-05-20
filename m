Received: from mailapp01.imgtec.com ([195.59.15.196]:37787 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27031489AbcETIbbb4Two (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 20 May 2016 10:31:31 +0200
Date: Fri, 20 May 2016 09:31:15 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] MIPS: Fix write_gc0_* macros when writing zero
In-Reply-To: <20160520081313.GX1124@jhogan-linux.le.imgtec.org>
Message-ID: <alpine.DEB.2.00.1605200920370.6794@tp.orcam.me.uk>
References: <1463587478-5815-1-git-send-email-james.hogan@imgtec.com> <alpine.DEB.2.00.1605200848410.6794@tp.orcam.me.uk> <20160520081313.GX1124@jhogan-linux.le.imgtec.org>
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
Message-ID: <20160520083115.P0-3iWGcjZqk8iNAhB3kF4PztUtmHXd0Mlc2trxn_zk@z>

On Fri, 20 May 2016, James Hogan wrote:

> >  NB `z' here is an "operand code" in GCC-speak.  There's a list of the 
> > MIPS-specific ones in gcc/config/mips/mips.c above `mips_print_operand'.  
> > There are a few generic operand codes as well, most notably `a' to print 
> > an address, matching the `p' constraint.  I think it would be good to have 
> > this all documented in the GCC manual sometime.
> 
> Thanks Maciej! To be honest I pretty much guessed at what they were
> called. Good to see 'z' does do what I thought. I couldn't find any
> documentation online for the MIPS specific operand codes, so having them
> documented with GCC would be an excellent idea!

 Yeah, this stuff is a bit obscure (the other one being %-sequences for 
the specs) and I always find myself chasing sources when I need any of 
this.  Frankly by now I have already remembered roughly where to look for.

 Once tracked down however the description within sources is pretty good 
actually, so please refer there for the time being.

  Maciej

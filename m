Received: from mail-by2on0141.outbound.protection.outlook.com ([207.46.100.141]:65349
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6817664AbaELKqlhSOsv (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 12 May 2014 12:46:41 +0200
Date: Mon, 12 May 2014 12:46:20 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: Re: [PATCH 06/11] kvm tools, mips: Enable build of mips support
Message-ID: <20140512104620.GB15623@alberich>
References: <1399391491-5021-1-git-send-email-andreas.herrmann@caviumnetworks.com>
 <1399391491-5021-7-git-send-email-andreas.herrmann@caviumnetworks.com>
 <536D4707.5090207@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <536D4707.5090207@imgtec.com>
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
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
Cc: Pekka Enberg <penberg@kernel.org>, David Daney <ddaney.cavm@gmail.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20140512104620.uDV0Bkh-DeREAmK8hl20zY0oqLRzj2wMobblra3s6ow@z>

On Fri, May 09, 2014 at 10:22:15PM +0100, James Hogan wrote:
> Hi Andreas,
> 
> On 06/05/14 16:51, Andreas Herrmann wrote:
> > From: David Daney <david.daney@cavium.com>
> > 
> > Signed-off-by: David Daney <david.daney@cavium.com>
> > Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
> > ---
> >  tools/kvm/Makefile |   11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/kvm/Makefile b/tools/kvm/Makefile
> > index b872651..91286ad 100644
> > --- a/tools/kvm/Makefile
> > +++ b/tools/kvm/Makefile
> > @@ -105,7 +105,7 @@ OBJS	+= virtio/mmio.o
> >  
> >  # Translate uname -m into ARCH string
> >  ARCH ?= $(shell uname -m | sed -e s/i.86/i386/ -e s/ppc.*/powerpc/ \
> > -	  -e s/armv7.*/arm/ -e s/aarch64.*/arm64/)
> > +	  -e s/armv7.*/arm/ -e s/aarch64.*/arm64/ -e s/mips64/mips/)
> >  
> >  ifeq ($(ARCH),i386)
> >  	ARCH         := x86
> > @@ -184,6 +184,15 @@ ifeq ($(ARCH), arm64)
> >  	ARCH_WANT_LIBFDT := y
> >  endif
> >  
> > +ifeq ($(ARCH),mips)
> > +	DEFINES		+= -DCONFIG_MIPS
> > +	ARCH_INCLUDE	:= mips/include
> > +	CFLAGS		+= -I../../arch/mips/include/asm/mach-cavium-octeon
> > +	CFLAGS		+= -I../../arch/mips/include/asm/mach-generic
> 
> I can't see any obvious includes from these two directories in the
> previous patch. Are there any?

No, there aren't.
Both lines should be removed.

> > +	OBJS		+= mips/kvm.o
> > +	OBJS		+= mips/kvm-cpu.o
> > +	OBJS		+= mips/irq.o
> > +endif
> >  ###
> >  
> >  ifeq (,$(ARCH_INCLUDE))
> > 
> 
> Cheers
> James


Thanks,
Andreas

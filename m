Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:57855 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990395AbeFTCfOaNhHB (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 20 Jun 2018 04:35:14 +0200
Date: Tue, 19 Jun 2018 19:35:02 -0700
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 2/2] mips: generic: allow not building DTB in
Message-ID: <20180620023502.r5e6j222qml2bb47@pburton-laptop>
References: <20180425211607.2645-1-alexandre.belloni@bootlin.com>
 <20180425211607.2645-2-alexandre.belloni@bootlin.com>
 <20180425220149.GI4813@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180425220149.GI4813@piout.net>
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
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Allan Nielsen <Allan.Nielsen@microsemi.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180620023502.auRWcIDvpiaPFbT1assd5tjgXsuctOWRVGDbalb56N8@z>

Hi Alexandre,

On Thu, Apr 26, 2018 at 12:01:49AM +0200, Alexandre Belloni wrote:
> > diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> > index 5e9fce076ab6..3d3554c13710 100644
> > --- a/arch/mips/Makefile
> > +++ b/arch/mips/Makefile
> > @@ -404,7 +404,7 @@ endif
> >  CLEAN_FILES += vmlinux.32 vmlinux.64
> >  
> >  # device-trees
> > -core-$(CONFIG_BUILTIN_DTB) += arch/mips/boot/dts/
> > +core-y += arch/mips/boot/dts/
> >  
> >  %.dtb %.dtb.S %.dtb.o: | scripts
> >  	$(Q)$(MAKE) $(build)=arch/mips/boot/dts arch/mips/boot/dts/$@
> > diff --git a/arch/mips/boot/dts/mscc/Makefile b/arch/mips/boot/dts/mscc/Makefile
> > index 8982b19504a3..437ec65ec14a 100644
> > --- a/arch/mips/boot/dts/mscc/Makefile
> > +++ b/arch/mips/boot/dts/mscc/Makefile
> > @@ -1,3 +1,3 @@
> >  dtb-$(CONFIG_MSCC_OCELOT)	+= ocelot_pcb123.dtb
> >  
> > -obj-y				+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
> > +obj-($CONFIG_BUILTIN_DTB)	+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
> 
> I made a typo here, I'll resend after waiting for a few comments.

Are you happy with this series apart from fixing up the above?

If so I'm happy to s/(\$/$(/ whilst applying this.

Thanks,
    Paul

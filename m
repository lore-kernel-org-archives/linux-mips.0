Received: from mail.kernel.org ([198.145.29.99]:44796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23990439AbeGQRkjo0E1l (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 17 Jul 2018 19:40:39 +0200
MIME-Version: 1.0
References: <20180703123214.23090-1-paul@crapouillou.net> <20180703123214.23090-6-paul@crapouillou.net>
 <20180709171226.GK22377@vkoul-mobl> <20180716213339.GA19161@rob-hp-laptop> <20180717153407.GF3219@vkoul-mobl>
In-Reply-To: <20180717153407.GF3219@vkoul-mobl>
From: Rob Herring <robh@kernel.org>
Date: Tue, 17 Jul 2018 11:40:20 -0600
Message-ID: <CAL_JsqJBw9vBURZQxa4RkDAfiinnNRK6CVTBmpnC3TaSukZLRA@mail.gmail.com>
Subject: Re: [PATCH 05/14] dmaengine: dma-jz4780: Add support for the JZ4740 SoC
Content-Type: text/plain; charset="UTF-8"
Return-Path: <robh@kernel.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Vinod <vkoul@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>
Message-ID: <20180717174020.EjKnG8jKkzkzW3ynyrorBl50z8Cvoz_wto3y6EWZG6c@z>

On Tue, Jul 17, 2018 at 9:34 AM Vinod <vkoul@kernel.org> wrote:
>
> On 16-07-18, 15:33, Rob Herring wrote:
> > On Mon, Jul 09, 2018 at 10:42:26PM +0530, Vinod wrote:
> > > On 03-07-18, 14:32, Paul Cercueil wrote:
> > >
> > > >  enum jz_version {
> > > > + ID_JZ4740,
> > > >   ID_JZ4770,
> > > >   ID_JZ4780,
> > > >  };
> > > > @@ -247,6 +248,7 @@ static void jz4780_dma_desc_free(struct virt_dma_desc *vdesc)
> > > >  }
> > > >
> > > >  static const unsigned int jz4780_dma_ord_max[] = {
> > > > + [ID_JZ4740] = 5,
> > > >   [ID_JZ4770] = 6,
> > > >   [ID_JZ4780] = 7,
> > > >  };
> > > > @@ -801,11 +803,13 @@ static struct dma_chan *jz4780_of_dma_xlate(struct of_phandle_args *dma_spec,
> > > >  }
> > > >
> > > >  static const unsigned int jz4780_dma_nb_channels[] = {
> > > > + [ID_JZ4740] = 6,
> > > >   [ID_JZ4770] = 6,
> > > >   [ID_JZ4780] = 32,
> > > >  };
> > >
> > > I feel these should be done away with if we describe hardware in DT
> >
> > The compatible property can imply things like this.
>
> So what is the general recommendation, let DT describe hardware
> including version delta or use compatible to code that in driver?

Compatible is the version. Looking at the above, the version or ID
isn't even stable.

> Is it documented anywhere?

Not really. It's a judgment call generally. Maybe # of DMA channels
should be a property because that is something most controllers have.
But you really have to define the property up front, not when the 2nd
version of h/w shows up with different properties.

To start defining guidelines, a couple of things come to mind:

- Define properties for parameters that vary from board to board (for one SoC).
- You can't add new required properties to existing bindings, so the
not present default must work for all existing compatibles (or you
need per compatible driver data).
- Bugs/quirks/errata should be handled by compatible, not adding a
property. Because bugs should be fixable without a dtb update and only
a kernel update.

Rob

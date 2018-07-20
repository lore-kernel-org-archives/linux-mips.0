Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:54562 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23993256AbeGTNXeHjwPG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 20 Jul 2018 15:23:34 +0200
Date: Fri, 20 Jul 2018 14:22:58 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm9712: fix replace codec to component
Message-ID: <20180720132258.GD18740@imbe.wolfsonmicro.main>
References: <20180720075148.14648-1-marcel@ziswiler.com>
 <87effy48lz.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87effy48lz.wl-kuninori.morimoto.gx@renesas.com>
Return-Path: <ckeepax@opensource.cirrus.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Marcel Ziswiler <marcel@ziswiler.com>, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, Mark Brown <broonie@kernel.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-mips@linux-mips.org, Gregory CLEMENT <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, James Hogan <jhogan@kernel.org>, Philippe Ombredanne <pombredanne@nexb.com>, Bhumika Goyal <bhumirks@gmail.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ralf Baechle <ralf@linux-mips.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Takashi Iwai <tiwai@suse.com>, Paul Burton <paul.burton@mips.com>, Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee.jones@linaro.org>, Daniel Mack <daniel@zonque.org>, Manuel Lauss <manuel.lauss@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, Robert Jarzmik <robert.jarzmik@free.fr>, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, Han Xu <han.xu@nxp.com>, Donglin Peng <dolinux.peng@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, Boris Brezillon <boris.brezillon@bootlin.com>
Message-ID: <20180720132258.BiDDHoH3IvldNJXx68otvBV_CslVDD2ES2PrnbNYVy8@z>

On Fri, Jul 20, 2018 at 08:30:41AM +0000, Kuninori Morimoto wrote:
> 
> Hi Marcel
> 
> > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > 
> > Since commit 143b44845d87 ("ASoC: wm9712: replace codec to component")
> > "wm9712-codec" got renamed to "wm9712-component", however, this change
> > never got propagated down to the actual board/platform drivers. E.g. on
> > Colibri T20 this lead to the following spew upon boot with sound/touch
> > being broken:
> 
> Oops, my bad...
> The platform_driver name is not important,
> how about simply rename back it to "wm9712-codec" ?
> 

Yeah I would agree here wm9712-component isn't great as a name
for board files etc. Lets rename back to wm9712-codec for these
specific bits.

Thanks,
Charles

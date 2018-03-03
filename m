Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:36450 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992368AbeCCKUKw6DRm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 3 Mar 2018 11:20:10 +0100
Date: Sat, 3 Mar 2018 09:38:18 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH V2 1/2] MIPS: Loongson64: Select
 ARCH_MIGHT_HAVE_PC_PARPORT
In-Reply-To: <1520060919.13983.3.camel@flygoat.com>
Message-ID: <alpine.DEB.2.00.1803030935510.10166@tp.orcam.me.uk>
References: <1519871862-14624-1-git-send-email-chenhc@lemote.com>  <alpine.DEB.2.00.1803021204250.10166@tp.orcam.me.uk> <1520060919.13983.3.camel@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Huacai Chen <chenhc@lemote.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@mips.com>, "Steven J . Hill" <Steven.Hill@cavium.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>
Message-ID: <20180303093818.6Fv45NdV1dkMMZ3wtWjfyBYkqmbKUBCyl_tRnUQe2a4@z>

On Fri, 2 Mar 2018, Jiaxun Yang wrote:

> >  Hmm, I don't think the Fuloong(2e) machine has a parallel port
> > connector.  
> > The chipset may support the port, but with no external connection I
> > think 
> > there's no point in enabling it.  Or am I missing something?
> Thanks for your advice.
> Some other Loongson-2E devices share the same kernel entry with
> Fuloong-2E.
> And the 2E desktop PC has a parallel port. So we enable it for these
> devices.

 Ah, OK then, thanks for the clarification.  Would you mind updating the 
Kconfig description for LEMOTE_FULOONG2E to actually list the systems it 
covers then?

  Maciej

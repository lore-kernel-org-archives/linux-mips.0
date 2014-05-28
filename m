Received: from mail-bl2lp0203.outbound.protection.outlook.com ([207.46.163.203]:9464
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-FAIL-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6854811AbaE1WM309muo (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 29 May 2014 00:12:29 +0200
Date: Thu, 29 May 2014 00:10:40 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: Re: [PATCH 11/15] MIPS: paravirt: Add pci controller for virtio
Message-ID: <20140528221040.GB6335@alberich>
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
 <1400597236-11352-12-git-send-email-andreas.herrmann@caviumnetworks.com>
 <537C913C.1060903@imgtec.com>
 <20140522201707.GK11800@alberich>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20140522201707.GK11800@alberich>
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
Cc: linux-mips@linux-mips.org, David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140528221040.OFtBY5PHetDMQdP-2YhBahjeLKStQiLK-e5Qqfngojk@z>

On Thu, May 22, 2014 at 10:17:07PM +0200, Andreas Herrmann wrote:
> On Wed, May 21, 2014 at 12:42:52PM +0100, James Hogan wrote:
> > On 20/05/14 15:47, Andreas Herrmann wrote:
> > > From: David Daney <david.daney@cavium.com>
> > > 
> > > Signed-off-by: David Daney <david.daney@cavium.com>
> > > Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
> > > ---
> > >  arch/mips/Kconfig                |    1 +
> > >  arch/mips/paravirt/Kconfig       |    6 ++
> > >  arch/mips/pci/Makefile           |    2 +-
> > >  arch/mips/pci/pci-virtio-guest.c |  140 ++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 148 insertions(+), 1 deletion(-)
> > >  create mode 100644 arch/mips/paravirt/Kconfig
> > >  create mode 100644 arch/mips/pci/pci-virtio-guest.c
> > 
> > If I understand correctly this just drives a simple PCI controller for a
> > PCI bus that a virtio device happens to be usually plugged in to, yeh?
> 
> Yes.
> 
> > It sounds like it would make sense to take advantage of Will Deacon's
> > recent efforts to make a generic pci controller driver for this sort of
> > thing which specifically mentions emulation by kvmtool? Is it
> > effectively the same PCI controller that is being emulated?
> 
> I think, it's very similar. But it depends on OF.
>  
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2014-February/thread.html#233491
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2014-February/233491.html
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2014-February/233490.html
> 
> Currently we are at v6:
> http://marc.info/?i=1399478839-3564-1-git-send-email-will.deacon@arm.com
> 
> Will take a closer look (trying to get it running for mips_paravirt).

FYI, I've dismissed this (for v2) after taking a closer look and after
I've seen https://lkml.org/lkml/2014/5/18/54.


Andreas

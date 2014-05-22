Received: from mail-by2lp0236.outbound.protection.outlook.com ([207.46.163.236]:43163
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6855125AbaEVUSGoR71b (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 22 May 2014 22:18:06 +0200
Date: Thu, 22 May 2014 22:17:07 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: Re: [PATCH 11/15] MIPS: paravirt: Add pci controller for virtio
Message-ID: <20140522201707.GK11800@alberich>
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
 <1400597236-11352-12-git-send-email-andreas.herrmann@caviumnetworks.com>
 <537C913C.1060903@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <537C913C.1060903@imgtec.com>
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
Message-ID: <20140522201707.PFFHHpGIQyxoM_O4qAZ7_lbA0oEKT6Eoi-wiBvARF5w@z>

On Wed, May 21, 2014 at 12:42:52PM +0100, James Hogan wrote:
> On 20/05/14 15:47, Andreas Herrmann wrote:
> > From: David Daney <david.daney@cavium.com>
> > 
> > Signed-off-by: David Daney <david.daney@cavium.com>
> > Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
> > ---
> >  arch/mips/Kconfig                |    1 +
> >  arch/mips/paravirt/Kconfig       |    6 ++
> >  arch/mips/pci/Makefile           |    2 +-
> >  arch/mips/pci/pci-virtio-guest.c |  140 ++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 148 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/mips/paravirt/Kconfig
> >  create mode 100644 arch/mips/pci/pci-virtio-guest.c
> 
> If I understand correctly this just drives a simple PCI controller for a
> PCI bus that a virtio device happens to be usually plugged in to, yeh?

Yes.

> It sounds like it would make sense to take advantage of Will Deacon's
> recent efforts to make a generic pci controller driver for this sort of
> thing which specifically mentions emulation by kvmtool? Is it
> effectively the same PCI controller that is being emulated?

I think, it's very similar. But it depends on OF.
 
> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-February/thread.html#233491
> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-February/233491.html
> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-February/233490.html

Currently we are at v6:
http://marc.info/?i=1399478839-3564-1-git-send-email-will.deacon@arm.com

Will take a closer look (trying to get it running for mips_paravirt).


Andreas

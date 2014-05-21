Received: from mailapp01.imgtec.com ([195.59.15.196]:43469 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6837162AbaEULqTZYEGX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 May 2014 13:46:19 +0200
Message-ID: <537C913C.1060903@imgtec.com>
Date: Wed, 21 May 2014 12:42:52 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 11/15] MIPS: paravirt: Add pci controller for virtio
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com> <1400597236-11352-12-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1400597236-11352-12-git-send-email-andreas.herrmann@caviumnetworks.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, linux-mips@linux-mips.org
Cc: David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140521114252.-dRJtwRjwpu5pT_0ZWWbtYhCMhSUQzQXcp7u41AeohA@z>

On 20/05/14 15:47, Andreas Herrmann wrote:
> From: David Daney <david.daney@cavium.com>
> 
> Signed-off-by: David Daney <david.daney@cavium.com>
> Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
> ---
>  arch/mips/Kconfig                |    1 +
>  arch/mips/paravirt/Kconfig       |    6 ++
>  arch/mips/pci/Makefile           |    2 +-
>  arch/mips/pci/pci-virtio-guest.c |  140 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 148 insertions(+), 1 deletion(-)
>  create mode 100644 arch/mips/paravirt/Kconfig
>  create mode 100644 arch/mips/pci/pci-virtio-guest.c

If I understand correctly this just drives a simple PCI controller for a
PCI bus that a virtio device happens to be usually plugged in to, yeh?

It sounds like it would make sense to take advantage of Will Deacon's
recent efforts to make a generic pci controller driver for this sort of
thing which specifically mentions emulation by kvmtool? Is it
effectively the same PCI controller that is being emulated?

http://lists.infradead.org/pipermail/linux-arm-kernel/2014-February/thread.html#233491

http://lists.infradead.org/pipermail/linux-arm-kernel/2014-February/233491.html

http://lists.infradead.org/pipermail/linux-arm-kernel/2014-February/233490.html

Cheers
James

Received: from mail-eopbgr810098.outbound.protection.outlook.com ([40.107.81.98]:41214
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23991965AbeKSVNfVpXSg convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 19 Nov 2018 22:13:35 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 4/9] PCI: consolidate PCI config entry in drivers/pci
Date: Mon, 19 Nov 2018 21:13:29 +0000
Message-ID: <20181119211327.h2lugf2ttuiz3fp6@pburton-laptop>
References: <20181115190538.17016-1-hch@lst.de>
 <20181115190538.17016-5-hch@lst.de>
In-Reply-To: <20181115190538.17016-5-hch@lst.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3555B391B5C5094C84F54A5D1FC10A55@namprd22.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <pburton@wavecomp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Christoph Hellwig <hch@lst.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Porter <mporter@kernel.crashing.org>, Alexandre Bounine <alex.bou9@gmail.com>, Dominik Brodowski <linux@dominikbrodowski.net>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181119211329.eyzY_A_Y8eKUZ1SX1Es9NpsP53sewfTyf5r7Iphczww@z>

Hi Christoph,

On Thu, Nov 15, 2018 at 08:05:32PM +0100, Christoph Hellwig wrote:
> There is no good reason to duplicate the PCI menu in every architecture.
> Instead provide a selectable HAVE_PCI symbol that indicates availability
> of PCI support, and a FORCE_PCI symbol to for PCI on and the handle the
> rest in drivers/pci.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> Acked-by: Max Filippov <jcmvbkbc@gmail.com>
> Acked-by: Thomas Gleixner <tglx@linutronix.de>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

For patches 4, 5, 7, 8 & 9:

    Acked-by: Paul Burton <paul.burton@mips.com> # MIPS parts

Thanks,
    Paul

Received: from iolanthe.rowland.org ([192.131.102.54]:41271 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with SMTP id S6825663Ab2KAOePgnN5X (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 1 Nov 2012 15:34:15 +0100
Date: Thu, 1 Nov 2012 10:34:12 -0400 (EDT)
From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/6] arch: Change defconfigs to point to g_mass_storage.
In-Reply-To: <46dde680f525562e9fd19567deb5247f0bf26842.1351715302.git.mina86@mina86.com>
Message-ID: <Pine.LNX.4.44L0.1211011033170.1762-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Michal Nazarewicz <mpn@google.com>
Cc: Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, Mike Frysinger <vapier@gentoo.org>, uclinux-dist-devel@blackfin.uclinux.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Paul Mundt <lethal@linux-sh.org>, linux-sh@vger.kernel.org
Message-ID: <20121101143412.GWkMdovJwh3jYuLxAOq6LZv8lBIzb7UGndfXXwfJomY@z>

On Wed, 31 Oct 2012, Michal Nazarewicz wrote:

> From: Michal Nazarewicz <mina86@mina86.com>
> 
> The File-backed Storage Gadget (g_file_storage) is being removed, since
> it has been replaced by Mass Storage Gadget (g_mass_storage).  This commit
> changes defconfigs point to the new gadget.

...

> --- a/arch/arm/configs/qil-a9260_defconfig
> +++ b/arch/arm/configs/qil-a9260_defconfig
> @@ -108,7 +108,6 @@ CONFIG_ROOT_NFS=y
>  CONFIG_NLS_CODEPAGE_437=y
>  CONFIG_NLS_CODEPAGE_850=y
>  CONFIG_NLS_ISO8859_1=y
> -CONFIG_DEBUG_KERNEL=y
>  CONFIG_DEBUG_USER=y
>  CONFIG_DEBUG_LL=y
>  # CONFIG_CRYPTO_HW is not set

This seems to have crept in by mistake.

Alan Stern

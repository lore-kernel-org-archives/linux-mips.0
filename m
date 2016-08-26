Received: from iolanthe.rowland.org ([192.131.102.54]:56360 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with SMTP id S23992495AbcHZPzYPjX6I (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 26 Aug 2016 17:55:24 +0200
Date: Fri, 26 Aug 2016 11:55:22 -0400 (EDT)
From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v2 07/19] usb: host: ehci-sead3: Remove SEAD-3 EHCI code
In-Reply-To: <20160826141751.13121-8-paul.burton@imgtec.com>
Message-ID: <Pine.LNX.4.44L0.1608261154090.1794-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <stern+57de2712@rowland.harvard.edu>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Message-ID: <20160826155522.Yj5_t3heLlR14iDQ_XBzrLg3_5e0BsWDgcfiGe2JFZA@z>

On Fri, 26 Aug 2016, Paul Burton wrote:

> The SEAD-3 board is now probing its EHCI controller using the generic
> EHCI driver & its generic-ehci device tree binding. Remove the unused
> SEAD-3 specific EHCI code.
> 
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> 
> ---
> 
> Changes in v2:
> - New patch, removing SEAD-3 EHCI code instead of extending it
> 
>  drivers/usb/host/ehci-hcd.c   |   5 --
>  drivers/usb/host/ehci-sead3.c | 185 ------------------------------------------
>  2 files changed, 190 deletions(-)
>  delete mode 100644 drivers/usb/host/ehci-sead3.c

Acked-by: Alan Stern <stern@rowland.harvard.edu>

I hardly ever object to getting rid of code...  :-)

Alan Stern

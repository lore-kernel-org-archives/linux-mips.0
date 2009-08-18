Received: from mail-ew0-f225.google.com ([209.85.219.225]:49445 "EHLO
	mail-ew0-f225.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S1492963AbZHRQBv convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 18 Aug 2009 18:01:51 +0200
From: Florian Fainelli <florian@openwrt.org>
Subject: Re: [PATCH 1/2] alchemy: add au1000-eth platform device
Date: Tue, 18 Aug 2009 18:01:40 +0200
References: <200908170105.38154.florian@openwrt.org> <4A8AC125.3020602@ru.mvista.com>
In-Reply-To: <4A8AC125.3020602@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Message-ID: <200908181801.41602.florian@openwrt.org>
Return-Path: <f.fainelli@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Manuel Lauss <manuel.lauss@googlemail.com>, David Miller <davem@davemloft.net>, netdev@vger.kernel.org
Message-ID: <20090818160140.Z5DXUA8UckwVzVPI_pBaRMBF-MALns_9mrvyLfpwo7I@z>

Le Tuesday 18 August 2009 16:56:37 Sergei Shtylyov, vous avez écrit :
> Hello.
>
> Florian Fainelli wrote:
> > This patch adds the board code to register a per-board au1000-eth
> > platform device to be used wit the au1000-eth platform driver in a
> > subsequent patch. Note that the au1000-eth driver knows about the
> > default driver settings such that we do not need to pass any
> > platform_data informations in most cases except db1x00.
>
>     Sigh, NAK...
>     Please don't register the SoC device per board, do it in
> alchemy/common/platfrom.c and find a way to pass the board specific
> platform data from the board file there instead -- something like
> arch/arm/mach-davinci/usb.c does.

Ok, like I promised, this was the per-board device registration. Do you prefer something like this:
--

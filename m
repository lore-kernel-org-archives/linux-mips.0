Received: from [81.2.110.250] ([81.2.110.250]:10159 "EHLO the-village.bc.nu")
	by ftp.linux-mips.org with ESMTP id S20032322AbXLDMv7 (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 4 Dec 2007 12:51:59 +0000
Date: Tue, 4 Dec 2007 12:45:16 +0000
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] SC26XX: New serial driver for SC2681 uarts
Message-ID: <20071204124516.0120266a@the-village.bc.nu>
In-Reply-To: <20071204082534.GA5938@alpha.franken.de>
References: <20071202194346.36E3FDE4C4@solo.franken.de>
	<20071203155317.772231f9.akpm@linux-foundation.org>
	<20071203155746.2dc4506d@laptopd505.fenrus.org>
	<20071204082534.GA5938@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <alan@lxorguk.ukuu.org.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Arjan van de Ven <arjan@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Andy Whitcroft <apw@shadowen.org>
Message-ID: <20071204124516.Gqe-H-d3jFQxjsb3lF79F2NNz9hizMrhIiBw-RtOJuA@z>

On Tue, 4 Dec 2007 09:25:35 +0100
tsbogend@alpha.franken.de (Thomas Bogendoerfer) wrote:

> On Mon, Dec 03, 2007 at 03:57:46PM -0800, Arjan van de Ven wrote:
> > > > +#define SC26XX_MAJOR         204
> > > > +#define SC26XX_MINOR_START   205
> > > > +#define SC26XX_NR            2
> > 
> > did lanana assign these numbers officially?
> 
> I tried to numbers several months ago and didn't get any response 

Please raise it with the relevant people. If our LANANA administrator is
not doing their job then the Linuxfoundation need to find a replacement,
or hand control of it over to someone outside.

Received: from mail.baslerweb.com ([145.253.187.130]:4207 "EHLO
	mail.baslerweb.com") by ftp.linux-mips.org with ESMTP
	id S8133569AbWFBJQW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 2 Jun 2006 11:16:22 +0200
Received: (from smtpd@127.0.0.1) by mail.baslerweb.com (8.13.4/8.13.4)
	id k52BFEsZ004337 for <linux-mips@linux-mips.org>; Fri, 2 Jun 2006 13:15:14 +0200
MIME-Version: 1.0
Date: Fri, 2 Jun 2006 11:16:18 +0200
Message-ID: <C5A8FDEFF7647F4C9CB927D7DEB30773C7AE85@AHR075S.basler.corp>
From: "Koeller, T." <Thomas.Koeller@baslerweb.com>
Subject: RE: Location of PCI setup code
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-Path: <Thomas.Koeller@baslerweb.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20060602091618.1UHOJ2WDPTl6t_ijZIvcbVMyMxt7TiJ-ZlkS_Jx5ULA@z>

> From: Ralf Baechle [mailto:ralf@linux-mips.org] 
> 
> On Thu, Jun 01, 2006 at 10:46:17PM +0200, Thomas Koeller wrote:
> 
> > the PCI setup code for a platform is conventionally located 
> in arch/mips/pci. 
> > I fail to see the benefits of separating this particular 
> part of a platform's 
> > setup from the rest. The PCI setup code will in general 
> contain references to 
> > platform-specific information, such as the overall address 
> space layout, of 
> > which the PCI memory and I/O pages are a part. If the PCI 
> setup code were in 
> > the platform subdirectory, sharing this information by means of a 
> > platform-local header file would be easy. But with the PCI code in 
> > arch/mips/pci, this becomes more difficult. The platform 
> header could be 
> > located somewhere outside the platform's directory, maybe under 
> > 'include' (where?), or referenced via an ugly relative path like 
> > '../../vendor/platform/platform.h'. All this seems rather 
> clumsy to me. No 
> > other part of a platform's initialization is separated from 
> the rest in a 
> > similar way, so what is so special about PCI setup that it 
> cannot be in the 
> > platform directory, thereby avoiding all these annoyances? 
> 
> The per-platform PCI code used to live in the per-platform 
> directories.
> It turned into a giant mess, very little code was being shared, it was
> hard to uniformly perform any kind of modification or fixes - and more
> of that kind of changes will be needed before the PCI codes really
> shines.
> 
>   Ralf
> 

So how am I supposed to deal with the issues mentioned?
Should I duplicate the PCI-related platform definitions into
arch/mips/pci? Scattering related information across several places is
generally regarded as poor design, as it will make maintenance more
difficult.
Or should I resort to one of the methods I mentioned, or is there any
other
preferred/recommended way of dealing with this?

tk
----------------------------------------------- 
Thomas Koeller, Software Development 

Basler Vision Technologies 
An der Strusbek 60-62 
22926 Ahrensburg 
Germany 

Tel +49 (4102) 463-390 
Fax +49 (4102) 463-46390

mailto:Thomas.Koeller@baslerweb.com 
http://www.baslerweb.com 

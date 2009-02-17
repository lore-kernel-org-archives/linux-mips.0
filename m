Received: from sj-iport-6.cisco.com ([171.71.176.117]:41680 "EHLO
	sj-iport-6.cisco.com") by ftp.linux-mips.org with ESMTP
	id S21366063AbZBQUvD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 17 Feb 2009 20:51:03 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: cacheflush system call-MIPS
Date: Tue, 17 Feb 2009 15:50:41 -0500
Message-ID: <FF038EB85946AA46B18DFEE6E6F8A2899E30B8@xmb-rtp-218.amer.cisco.com>
In-Reply-To: <20090217194509.GA16134@gate.ebshome.net>
References: <f5a7b3810902100716t2658ce95t2dcc7f85634522@mail.gmail.com> <20090211131649.GA1365@linux-mips.org> <Pine.LNX.4.58.0902140002180.408@Indigo2.Peter> <20090213235603.GA32274@linux-mips.org> <Pine.LNX.4.58.0902150312460.459@Indigo2.Peter> <499AEE98.1010908@caviumnetworks.com> <20090217194509.GA16134@gate.ebshome.net>
From: "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>
Return-Path: <dvomlehn@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Eugene Surovegin <ebs@ebshome.net>, David Daney <ddaney@caviumnetworks.com>
Cc: post@pfrst.de, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20090217205041.tkqplPL-pZljlQrR89JKweOImVn2jS2yCNV-42vmf_c@z>


> From: linux-mips-bounce@linux-mips.org 
> [mailto:linux-mips-bounce@linux-mips.org] On Behalf Of Eugene 
> Surovegin
> Sent: Tuesday, February 17, 2009 11:45 AM
> To: David Daney
> Cc: post@pfrst.de; Ralf Baechle; linux-mips@linux-mips.org
> Subject: Re: cacheflush system call-MIPS
> 
> On Tue, Feb 17, 2009 at 09:06:32AM -0800, David Daney wrote:
> > peter fuerst wrote:
> >>> Why does it need that flush?
> >> To prepare the update-area (in the Shadow-FB) for DMA to RE.
> >
> > And on systems where the root frame buffer is directly 
> manipulated by the 
> > CPU, the video system is continually using DMA to refresh 
> the display.  A 
> > cache flush can be required to eliminate transient visual glitches.
> 
> In this case using uncached fb access is the only way to avoid 
> glitches - you cannot control cache line evictions. And it's usually 
> faster to use uncached mappings for effectively write-only regions.

A far more appropriate caching mode for frame buffers, if your processor
supports it, is to use uncached accelerated
(_CACHED_UNCACHED_ACCELERATED in the kernel source). Unfortunately, at
least as far as I can tell, you'd need to write your own driver to do
the memory mapping so that it can set the cache coherency attributes to
get this behavior. Not especially hard if you are familiar with device
drivers, much harder if you are note.

Subject: Re: Kernel compiler
Date: Sat, 4 Nov 2000 10:40:42 +0000 (GMT)
In-Reply-To: <20001104035326.A29005@bacchus.dhis.org> from "Ralf Baechle" at Nov 04, 2000 03:53:26 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E13s0ke-0004Sa-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: Keith Owens <kaos@melbourne.sgi.com>, linux-mips@oss.sgi.com, linux-mips@fnet.fr
Message-ID: <20001104104042.by9Wj4hyiXsELlKKJjEOTVMuQvcLJxp1O48NzRiyTqE@z>

> The reports regarding egcs 2.96 and newer misscompiling the kernel only
> affect x86 or are other architecture affected as well?  I don't have any
> pending compiler >= 2.96 related bug reports.

The Red Hat 2.96 seems to compile 2.2 correctly when you fix the 2.2 bugs but
does miscompile x86 fs/buffers.c on 2.4 according to reports. I think with mips
you'd have to experiment. Also AFAIK that tree branch hasn't been tested on
mips 

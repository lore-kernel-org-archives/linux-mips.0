Subject: Re: Support for smaller glibc
Date: Sat, 2 Dec 2000 13:06:28 +0000 (GMT)
In-Reply-To: <20001202050306.A12319@bacchus.dhis.org> from "Ralf Baechle" at Dec 02, 2000 05:03:06 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E142CN5-0001Wk-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com, linux-mips@fnet.fr
Message-ID: <20001202130628.155CZZMWSjcr-kbCFS2wI8Y0HP6LjOweviVeBmJk97s@z>

> > solved.  But forking a smaller libc of standard glibc is nothing but the
> > St. Florian's principle ...
> 
> Ulrich is refusing to do anything with it. Do you have any suggestions?
> I will do my best to do it right. But I am afraid I cannot do it alone.

Ulrich is right. Start from a library that is intended to be modular and
embedded. Folks are already looking at using newlib for this. 

Alan

Date: Wed, 7 May 2003 09:31:40 +0300 (EEST)
From: Petko Manolov <petkan@users.sourceforge.net>
Subject: Re: Big endian RTL8150
In-Reply-To: <20030505214003.GB2941@kroah.com>
Message-ID: <Pine.LNX.4.50.0305070926230.2916-100000@tequila.rakia.org>
References: <Pine.GSO.4.21.0305051135140.9126-100000@vervain.sonytel.be>
 <20030505214003.GB2941@kroah.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <petkan@users.sourceforge.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Greg KH <greg@kroah.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>, "linux-usb-devel@lists.sourceforge.net" <linux-usb-devel@lists.sourceforge.net>, Linux/MIPS Development <linux-mips@linux-mips.org>, Dimitri Torfs <Dimitri.Torfs@sonycom.com>
Message-ID: <20030507063140.rU8dOXkiVA4DHbTEy2ndSycAsENANp4NrtwAcTN7khg@z>



On Mon, 5 May 2003, Greg KH wrote:

> On Mon, May 05, 2003 at 11:47:48AM +0200, Geert Uytterhoeven wrote:
> > 	Hi,
> >
> > The RTL8150 USB Ethernet driver doesn't work on big endian machines. Here are
> > patches (for both 2.4.x and 2.5.x) to fix that. The fix was tested on the
> > 2.4.20 and 2.4.21-rc1 version of the driver on big endian MIPS.
>
> Thanks, I've applied this to my 2.4 and 2.5 trees and will forward them
> on up the food chain.

Those changes were living in my official RTL8150 cvs site for some time,
waiting for comments from big-endian machine users.  I guess this should
mean thumbs up. :)


		Petko

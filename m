Message-ID: <082201c1a9be$81198be0$5601010a@prefect>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <Pine.GSO.3.96.1020130193233.8443D-100000@delta.ds2.pg.gda.pl>
Subject: Re: [PATCH] Compiler warnings and remove unused code....
Date: Wed, 30 Jan 2002 13:46:58 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, Geoffrey Espin <espin@idiom.com>
Cc: "Steven J. Hill" <sjhill@cotw.com>, linux-mips@oss.sgi.com
Message-ID: <20020130184658.1nbxFgWLN8ZnyXWd2NbQDZqSkEgrqEJpiPeB57Nx-Kc@z>

I think --noinhibit-exec worked for me as a temporary measure until I
upgraded the kernel.

Regards,
Brad

----- Original Message -----
From: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
To: "Geoffrey Espin" <espin@idiom.com>
Cc: "Steven J. Hill" <sjhill@cotw.com>; <linux-mips@oss.sgi.com>
Sent: Wednesday, January 30, 2002 1:35 PM
Subject: Re: [PATCH] Compiler warnings and remove unused code....


> On Wed, 30 Jan 2002, Geoffrey Espin wrote:
>
> > drivers/char/char.o(.data+0x3958): undefined reference to `local symbols
in discarded section .text.exit'
> > drivers/net/net.o(.data+0x17c): undefined reference to `local symbols in
discarded section .text.exit'
> > drivers/usb/usbdrv.o(.data+0x4b0): undefined reference to `local symbols
in discarded section .text.exit'
> > make: *** [vmlinux] Error 1
> >
> >
> > This is linux.2.4.16 + sourceforge/mipslinux (a few weeks old).
>
>  These errors are not MIPS-specific.  They were introduced by a stricter
> symbol checking in recent binutils.  Many of them (but possibly not all)
> are removed in Linux 2.4.17.  Please try the current version and see if
> they persist.
>
> --
> +  Maciej W. Rozycki, Technical University of Gdansk, Poland   +
> +--------------------------------------------------------------+
> +        e-mail: macro@ds2.pg.gda.pl, PGP key available        +
>

Subject: Re: pcmcia
Date: Fri, 30 Nov 2001 17:54:08 +0000 (GMT)
In-Reply-To: <1007141701.22949.140.camel@zeus> from "Pete Popov" at Nov 30, 2001 09:35:01 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E169rrU-0004GN-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Pete Popov <ppopov@mvista.com>
Cc: "Guillermo A. Loyola" <gmo@broadcom.com>, linux-mips <linux-mips@oss.sgi.com>, sforge <linux-mips-kernel@lists.sourceforge.net>
Message-ID: <20011130175408.z_VdPXdhy4lXrrx4eYRiEzmZQO6QQgYCg0eZ7AH1Fek@z>

> > We need the same here, how about doing this instead:
> > 
> > #ifdef __i386__
> > typedef u_short   ioaddr_t;
> > #else
> > typedef u_int	ioaddr_t;
> > #endif
> 
> That probably makes more sense.  I wasn't sure if it's only x86 that
> needs? ioaddr_t to be a 16 bit type.  

Is there any platform where making it int actually -breaks-. At least for
2.5 it would seem a lot saner to just make it bigger and see

Alan

Message-ID: <056a01c18831$919daf90$5601010a@prefect>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <Pine.GSO.3.96.1011219023325.16267B-100000@delta.ds2.pg.gda.pl>
Subject: Re: ISA
Date: Tue, 18 Dec 2001 21:05:01 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, Jun Sun <jsun@mvista.com>
Cc: jim@jtan.com, linux-mips@oss.sgi.com
Message-ID: <20011219020501.FTcLKyT1gmQ0NMl8xe14L0EtJ3EJTgpCUCLe6fHXZ30@z>

----- Original Message -----
From: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
To: "Jun Sun" <jsun@mvista.com>
Cc: <jim@jtan.com>; <linux-mips@oss.sgi.com>
Sent: Tuesday, December 18, 2001 8:50 PM
Subject: Re: ISA


> On Tue, 18 Dec 2001, Jun Sun wrote:
> > Now when people using ioremap/readb/writeb method to access ISA memory
space,
> > which lives in the lower range of the "bus memory space", it will
collide with
> > system ram under 1:1 mapping assumption.
>
>  Hmm, I believe there should be no such problem.  For systems equipped
> with the PCI bus we may just assume the low 16MB of PCI memory address
> space is reserved for ISA memory addresses (it's hardwired for many
> platforms, so there should be no problem with it), i.e. avoid programming
> BARs to point to that space and make ioremap() (or __ioremap(), actually)
> act accordingly, i.e. assume a 1:1 mapping for addresses above 16MB and
> perform an ISA mapping for ones below 16MB.

That sounds like the simplest and best solution.

Regards,
Brad

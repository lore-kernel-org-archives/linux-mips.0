Message-ID: <010301c254da$892fcc50$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1020905134606.2423G-100000@delta.ds2.pg.gda.pl>
Subject: Re: 64-bit and N32 kernel interfaces
Date: Thu, 5 Sep 2002 14:48:15 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, Tor Arntsen <tor@spacetec.no>
Cc: Carsten Langgaard <carstenl@mips.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20020905124815.50nW4DXyc_5a3a8M3e9d-dAvCksAB8PYDLfFPptcRUw@z>

From: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
>

> On Thu, 5 Sep 2002, Tor Arntsen wrote:
> 
> > > Any reference?  AFAIK, long is 64-bit for n32 and only void * is 32-bit. 
> > >It doesn't make sense otherwise. 
> > 
> > On SGI/Irix n32 long and void* are 32-bit, only long long is 64-bit.
> > On SGI/Irix n64 long and void* are 64-bit too.
> 
>  Hmm, it looks pretty much broken if that's true (especially given long
> long was non-standard untile very recently).  I'll check the docs, yet.

n32 has the same data types as o32, an "ILP32" C integer 
model.  n64 is a pretty normal "LP64" C integer model.

What do you consider to be broken, and how would you
have preferred it to have been done?

            Regards,

            Kevin K.

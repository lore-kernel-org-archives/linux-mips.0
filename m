Message-ID: <008601c1b61e$ff4d88b0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1020215130906.29773C-100000@delta.ds2.pg.gda.pl>
Subject: Re: [patch] linux 2.4.17: The second mb() rework (final)
Date: Fri, 15 Feb 2002 13:47:12 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: Atsushi Nemoto <nemoto@toshiba-tops.co.jp>, mdharm@momenco.com, ralf@uni-koblenz.de, linux-mips@fnet.fr, linux-mips@oss.sgi.com
Message-ID: <20020215124712.JhaqSD6-o-yXxDBhXYznWlqH0CL6PIp8TWb8r0DMlcg@z>

> On Fri, 15 Feb 2002, Kevin D. Kissell wrote:
> 
> > So I think that the Linux code was perfectly correct in considering
> > the TX39 to be without SYNC, just as a Vr4101 must be
> > consdered to be without LL/SC.  They decode the instructions,
> > but they don't actually implement them as specified.
> 
>  The code is not correct if "bc0f" is needed to be sure a write-back
> happened.  If that is the case, the processors need their own wbflush() 
> implementation like R2k/R3k configurations in older DECstations. 

Note that I did not say that "the code is correct", only that it
is correct *in considering the TX39 to be effectively SYNC-less*.
I'm sure that the code is anyway broken six ways from Wednesday,
as usual.  ;-)

            Kevin K.

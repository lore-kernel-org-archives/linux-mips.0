From: "Kjeld Borch Egevang" <kjelde@mips.com>
Subject: RE: Error in gcc version 2.96 20000731
Date: Thu, 13 Sep 2001 22:47:25 +0200
Message-ID: <NFBBKGGKGLLGNBGCEPKIAEHDCAAA.kjelde@mips.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.GSO.3.96.1010913171138.4511A-100000@delta.ds2.pg.gda.pl>
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010913204725.90eurt9vrAHTOPp6Yv345b3RHOix4AkOV5aNv1WqPMw@z>

Thanks for your reply.

I was trying to port SPEC CPU 2000 (benchmarks), and one of the tests
failed. I boiled it down to the attached program. For performance reasons it
could be perfectly valid not to use memset(), but I agree that the code
looks a bit odd.


/Kjeld

-----Original Message-----
From: Maciej W. Rozycki [mailto:macro@ds2.pg.gda.pl]
Sent: 13. september 2001 17:15
To: Kjeld Borch Egevang
Cc: linux-mips@oss.sgi.com
Subject: Re: Error in gcc version 2.96 20000731


On Thu, 13 Sep 2001, Kjeld Borch Egevang wrote:

> I discovered an optimization error in the current gcc for MIPS.

 Is 2.96 20000731 current?  I thought 3.0.1 is.

> When I compile the code below with -O2 it clears the code-field just
> after setting it. The instructions are mixed up. It works fine with -O1
> and -O0.

 Use "-fno-strict-aliasing"?

> If the "//" is removed in front of the first printf, it works too.

 Why don't you use memset() to clear the struct in the first place?

--
+  Maciej W. Rozycki, Technical University of Gdansk, Poland   +
+--------------------------------------------------------------+
+        e-mail: macro@ds2.pg.gda.pl, PGP key available        +

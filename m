Message-ID: <04c901c1d20d$bfb061e0$5601010a@prefect>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <1016845916.24217.298.camel@zeus>
Subject: Re: [Linux-mips-kernel]io.h patch
Date: Fri, 22 Mar 2002 20:55:02 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Pete Popov <ppopov@mvista.com>, linux-mips@oss.sgi.com
Message-ID: <20020323015502.ENZ5iNPy9F8_BSlYkucuPaKtIXPuIkht3f-uHJKZ058@z>


----- Original Message -----
From: "Pete Popov" <ppopov@mvista.com>
To: "sforge" <linux-mips-kernel@lists.sourceforge.net>
Sent: Friday, March 22, 2002 8:11 PM
Subject: [Linux-mips-kernel]io.h patch


> Some of the macros in io.h cause compile problems in some of the drivers
> because of the do while syntax.  I don't see any good reason why we
> can't make those macros inline functions.  Any objections to this patch?

I pester Ralf about this from time to time.  The standing objection is that
some older gccs don't do inline well.

Regards,
Brad

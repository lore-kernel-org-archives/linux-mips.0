Message-ID: <002301c1d569$4af46ea0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3CA10449.F0088B95@redhat.com>
Subject: Re: PCI ethernet cards
Date: Wed, 27 Mar 2002 09:26:50 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: David Milburn <dmilburn@redhat.com>, linux-mips@oss.sgi.com
Message-ID: <20020327082650.UbwPpFgjsGlLEUC9JLD3-GBWoopoxFZ3-gRii10IsK4@z>

> Can anyone recommend some PCI 100 Mbit ethernet cards/drivers
> that work well with the 2.4 linux-mips kernel?

At MIPS, we use AMD PCnet32 cards pretty exclusively,
and with good success under both 2.2 and 2.4.  For 2.2,
we did a pretty thorough reworking of the driver to deal with 
MIPS endianness and (especially) cache issues, but I believe
we use the 2.4 driver "out of the box".  YMMV, of course.

            Kevin K.

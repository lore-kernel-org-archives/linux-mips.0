Message-ID: <010e01c26ba8$2c9400d0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3D9D484B.4C149BD8@mips.com><200210041153.MAA12052@mudchute.algor.co.uk> <3D9D855B.12128FA2@mips.com><1033734968.31839.5.camel@irongate.swansea.linux.org.uk> <00fe01c26ba6$04943480$10eca8c0@grendel> <1033737330.31861.30.camel@irongate.swansea.linux.org.uk>
Subject: Re: Promblem with PREF (prefetching) in memcpy
Date: Fri, 4 Oct 2002 15:15:41 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Carsten Langgaard <carstenl@mips.com>, Dominic Sweetman <dom@algor.co.uk>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20021004131541.AtYUIKXkJcUQbNNd2QeftMhOmdTIIpiaWzPetO9mGYg@z>

From: "Alan Cox" <alan@lxorguk.ukuu.org.uk>
> On Fri, 2002-10-04 at 14:00, Kevin D. Kissell wrote:
> > The issue isn't that anyone would deliberately use memcpy() in I/O
> > space.  Rather, it's that memcpy() prefetches quite a ways ahead,
> > and if one has I/O space assigned just after the end of physical
> > memory, Bad Things might happen on a perfectly legal memcpy()
> > that references the last couple hundred bytes of memory in a 
> > way that not even a clever and well-informed bus error handler 
> > could undo.
> 
> Then your memcpy function is IMHO broken. Fix it to note prefetch beyond
> the end of the area you actually will copy and life should be a lot
> better

Which is excatly the point that Carsten was raising when he started this thread!

The question is how, i.e. throttle memcpy or thow away a "guard band" of RAM?

            Regards,

            Kevin K. 

Date: Fri, 22 Mar 2002 11:08:27 +0000 (GMT)
From: Dave Airlie <airlied@csn.ul.ie>
Subject: Re: [patch] linux: declance multicast filter fixes
In-Reply-To: <Pine.GSO.3.96.1020321185116.22279D-100000@delta.ds2.pg.gda.pl>
Message-ID: <Pine.LNX.4.32.0203221107170.1949-100000@skynet>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: Ralf Baechle <ralf@uni-koblenz.de>, linux-mips@fnet.fr, linux-mips@oss.sgi.com
Message-ID: <20020322110827.686SiNS6tesgxhqe7nKXUrjjyQATO9Da1APwYUshe9I@z>


I've created declance_2_4.c on http://www.csn.ul.ie/~airlied/mips

for the DS5000/200 series of DecStations..

it only required the BE -> LE and the additional zeroing of the filter, it
already did the mcast_table access correctly... (by luck rather than
design :-)

un-compiled and untested but it should work ..

Dave.

On Thu, 21 Mar 2002, Maciej W. Rozycki wrote:

> Hello,
>
>  Following are a few trivial fixes for the DECstation's LANCE driver
> needed for the chip's multicast filter to be set up correctly.  The patch
> is needed for multicast reception to work, in particular for the IPv6's
> neighbor discovery.  The CRC generation was verified using the AMD's
> reference code and it was checked at the run time for selected multicast
> addresses as well.  Please apply.
>
>  Maciej
>
>

-- 
David Airlie, Software Engineer
http://www.skynet.ie/~airlied / airlied@skynet.ie
pam_smb / Linux DecStation / Linux VAX / ILUG person

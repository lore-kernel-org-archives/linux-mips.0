Message-ID: <00ce01c229a4$a7d4ed40$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Mipsel libc with LL/SC online anywhere?
Date: Fri, 12 Jul 2002 15:04:07 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20020712130407.PAz2xnOEyt2JYqVlB7nNrGkUuulRlLxpRmwXy4YrVjI@z>

I'm benchmarking some code that does lots of
semaphores, and with the libc from the "standard"
MIPS/SGI RH 7.1 distribution, those are done using
sysmips, in the interest of universality.  Regardles of
whether and how the ongoing argument of How Things
Should Be is settled, is there a copy of an up-to-date
glibc package built to use ll/sc out there on anyone's
FTP or web server?  I suppose I could extract and
replace the necessary routines by hand, but that would
be slow and fraught with the risk of error...

            Regards,

            Kevin K.

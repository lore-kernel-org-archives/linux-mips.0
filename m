Message-ID: <089d01c11f4b$449b4800$3501010a@ltc.com>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <Pine.GSO.3.96.1010807160731.3289D-100000@delta.ds2.pg.gda.pl>
Subject: Re: cross-mipsel-linux-ld --prefix library path
Date: Tue, 7 Aug 2001 10:14:27 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010807141427.8G-lcJqTDyYPP996qgScxJW8bOmqaanHsZVejTeUSC4@z>

----- Original Message -----
From: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
To: "Bradley D. LaRonde" <brad@ltc.com>
Cc: <linux-mips@oss.sgi.com>
Sent: Tuesday, August 07, 2001 10:10 AM
Subject: Re: cross-mipsel-linux-ld --prefix library path


>  You don't need to specify "--prefix=/usr/mipsel-linux" for building
> cross-binutils.  The scripts will add the target alias automatically for
> files that need it -- if you look at the scripts,
> "${prefix}/${target_alias}" is the so called "tooldir".

Oh...  The mysteries of cross-toolchain building.  Thanks.

So if I leave out --prefix alogether, will "make install" overwrite any x86
stuff, like that libbfd.la file I mentioned?

Regards,
Brad

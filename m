Message-ID: <094d01c11f55$31969d40$3501010a@ltc.com>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <Pine.LNX.4.30.0108070939230.32641-100000@tennyson.netexpress.net>
Subject: Re: cross-mipsel-linux-ld --prefix library path
Date: Tue, 7 Aug 2001 11:25:30 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Steve Langasek <vorlon@netexpress.net>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010807152530.qtspQPAryedCSu2XS74znW1pI6HG4yZd0plrnsRkojU@z>

OK, so say I leave off --prefix entirely, and the binutils get installed in
/usr/bin and /usr/mipsel-linux/bin.  Now, I suppose that mipsel-linux-ld
will look for libs in /usr/mipsel-linux/lib, which is cool.  But, how to I
convince the cross-built glibc that's where his libraries belong?
 Just --prefix=/usr/mipsel-linux to glibc's configure?

Regards,
Brad

----- Original Message -----
From: "Steve Langasek" <vorlon@netexpress.net>
To: "Bradley D. LaRonde" <brad@ltc.com>
Cc: <linux-mips@oss.sgi.com>
Sent: Tuesday, August 07, 2001 10:42 AM
Subject: Re: cross-mipsel-linux-ld --prefix library path


> On Mon, 6 Aug 2001, Bradley D. LaRonde wrote:
>
> > Another odd thing is that binutils installs:
>
> >     /usr/mipsel-linux/bin/mipsel-linux-ld
>
> > and an identical copy at:
>
> >     /usr/mipsel-linux/mipsel-linux/bin/ld
>
> The places you /want/ these to show up are /usr/mipsel-linux/bin/ld and
> /usr/bin/mipsel-linux-ld.  The reason for having two copies is that when
> you're calling these tools directly (or from a make script), you want them
to
> be in your path, so you want them to have a unique name
> (/usr/bin/mipsel-linux-ld); but internally, I believe the tools prefer
/not/
> to have to mess with the name mangling used there, so instead they look
for a
> tool with the normal name (ld) in an architecture-specific directory
> (/usr/mipsel-linux/bin).
>
> Steve Langasek
> postmodern programmer
>
>

Date: Tue, 7 Aug 2001 09:42:14 -0500 (CDT)
From: Steve Langasek <vorlon@netexpress.net>
Subject: Re: cross-mipsel-linux-ld --prefix library path
In-Reply-To: <074001c11ef4$fdbd7530$3501010a@ltc.com>
Message-ID: <Pine.LNX.4.30.0108070939230.32641-100000@tennyson.netexpress.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: "Bradley D. LaRonde" <brad@ltc.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010807144214.pIcq9WJow4ObC8yIsqKzdohrJ1VDc4nKWSsnSClv4aY@z>

On Mon, 6 Aug 2001, Bradley D. LaRonde wrote:

> Another odd thing is that binutils installs:

>     /usr/mipsel-linux/bin/mipsel-linux-ld

> and an identical copy at:

>     /usr/mipsel-linux/mipsel-linux/bin/ld

The places you /want/ these to show up are /usr/mipsel-linux/bin/ld and
/usr/bin/mipsel-linux-ld.  The reason for having two copies is that when
you're calling these tools directly (or from a make script), you want them to
be in your path, so you want them to have a unique name
(/usr/bin/mipsel-linux-ld); but internally, I believe the tools prefer /not/
to have to mess with the name mangling used there, so instead they look for a
tool with the normal name (ld) in an architecture-specific directory
(/usr/mipsel-linux/bin).

Steve Langasek
postmodern programmer

From: "Jay Carlson" <nop@nop.com>
Subject: RE: Dumb Question on Cross-Development
Date: Wed, 4 Apr 2001 11:17:39 -0400
Message-ID: <KEEOIBGCMINLAHMMNDJNIEHHCAAA.nop@nop.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3AC93C0B.5020102@redhat.com>
Sender: owner-linux-mips@oss.sgi.com
To: Joe deBlaquiere <jadb@redhat.com>, Florian Lohoff <flo@rfc822.org>
Cc: "Kevin D. Kissell" <kevink@mips.com>, "MIPS/Linux List (SGI)" <linux-mips@oss.sgi.com>
Message-ID: <20010404151739.8DMobed5WH5ODaYaYpMwi0jBNeoc5O_D_gr1YSKysrU@z>

> Perfect it is not, but it's not nearly _that_ bad either. I would
> say 40% of the RPMs I've tried will configure out of the box for
> a cross build. Another 40% or so require a few "export
> ac_cv_sizeof_long=4" kind of settings to configure for a cross
> build. The remaining 20% are painful.

Yeah, and it's not so bad once you start building up a config.site file you
can reuse across builds.  I got this idea from the debian dpkg-cross
package.  For people who aren't debian-y, the idea is that you set
CONFIG_SITE to point at a file like
http://www.csee.umbc.edu/~acedil1/agenda/files/agenda-config.site and run
configure as normal.  (I don't think I like that particular file but it
should give you ideas.)

BTW dpkg-cross comes with a tool that does ldd via grepping through objdump
output.

Jay

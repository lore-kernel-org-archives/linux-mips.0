Date: Mon, 18 Feb 2002 14:50:30 -0500 (EST)
From: Stephen L Moshier <moshier@moshier.net>
Reply-To: moshier@moshier.net
Subject: Re: math broken on mips
Message-ID: <Pine.LNX.4.44.0202181419220.25604-100000@moshier.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Zhang Fuxin <fxzhang@ict.ac.cn>
Cc: linux-mips@oss.sgi.com, libc-alpha@sources.redhat.com
Message-ID: <20020218195030.3AAgGoQC0fuSwTmJnC3u_vwaQaBzq0cjRy_KIjd7omY@z>


> pow(2,7) = 128.0 when rounding = TONEAREST or UPWARD
>                = 64.1547.. when rounding = DOWNWARD or TOWARDZERO

The libm functions from IBM that were recently installed in glibc come
with this remark in sysdeps/ieee754/dbl-64/MathLib.h:

  /* Assumption: Machine arithmetic operations are performed in       */
  /* round nearest mode of IEEE 754 standard.                         */

These math functions use a doubled-precision Dekker arithmetic which is
very sensitive to rounding rules and arithetic flaws.  Fixing the
routines to give reasonable answers with other rounding modes would not
be practical.

It is customary for a system math library to expect default environment
conditions, and I do not think this design actually violates any
standards. If you want to use non-default arithmetic settings and have
them work portably on various systems, you will have to take defensive steps
to protect your program from damage by the operating system and the system
library.

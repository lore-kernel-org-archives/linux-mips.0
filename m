From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
Subject: RE: [uClibc] Re: uclibc mips ld.so and undefined symbols with nonzerosymbol table entry st_value
Date: Mon, 10 May 2004 14:21:13 +0200
Message-ID: <JPEALJAFNGDDLOPNDIEEIEEICIAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <012701c43607$83aa65f0$8d01010a@prefect>
Return-Path: <joakim.tjernlund@lumentis.se>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Bradley D. LaRonde" <brad@laronde.org>, Richard Sandiford <rsandifo@redhat.com>
Cc: uclibc@uclibc.org, linux-mips@linux-mips.org
Message-ID: <20040510122113.3No6zG6LHoEEC8ytHRhrskzL1cyRxva1eEF3Cro6hlY@z>

> > The x86 and MIPS ABIs are very different though.
> 
> I notice that the debian mipsel libpthread.so.0 in
> http://ftp.debian.org/pool/main/g/glibc/libc6_2.2.5-11.5_mipsel.deb has
> st_value == 0 for every UND FUNC, just like my x86 debian libraries.  This
> is very different than the uClibc libpthread.so where every UND FUNC has
> st_value != 0.  Interestingly if I link glibc's libpthread with uClibc's
> libc.so I see that most UND FUNCs then have st_value != 0.
> 
> I would like to see how uClibc ld.so behaves I could somehow get ld to not
> generate any stubs in  libpthread.  Any idea why libpthread gets full stubs
> when linked with uClibc libc.so but no stubs when linked with glibc libc.so?

This looks like the problem we had with dlopen() and friends when introducing
the new WEAK symbol handling.

in libc/misc/pthread/weaks.c you have stuff like:
weak_alias(__phtread_return_0, __phtread_once);

where __phtread_return_0 is non NULL:
int __phtread_return_0(void)
{
 return 0;
}

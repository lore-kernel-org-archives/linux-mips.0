From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
Subject: RE: [uClibc] Re: uclibc mips ld.so and undefined symbols with nonzerosymbol table entry st_value
Date: Mon, 10 May 2004 16:23:18 +0200
Message-ID: <JPEALJAFNGDDLOPNDIEEMEELCIAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <JPEALJAFNGDDLOPNDIEEEEEJCIAA.joakim.tjernlund@lumentis.se>
Return-Path: <joakim.tjernlund@lumentis.se>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Bradley D. LaRonde" <brad@laronde.org>, Richard Sandiford <rsandifo@redhat.com>
Cc: uclibc@uclibc.org, linux-mips@linux-mips.org
Message-ID: <20040510142318.76OxYTzewDHSg5f4QWqh_RhgcRUIKq6edJWYQg0x0k0@z>

> Changing the alias for __phtread_once to
> extern int __phtread_once(void) __attribute__ ((weak));
> makes st_value=0 in libc, making the entry
> look the same as in glibc.

hmm, this is not quite true. The binding in glibc is WEAK, but
the above trick makes the binding GLOBAL in uClibc.

  Jocke
PS

 I am on PPC, so I may be way off here w.r.t MIPS:(

From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
Subject: RE: [uClibc] Re: uclibc mips ld.so and undefined symbols with nonzerosymbol table entry st_value
Date: Mon, 10 May 2004 14:36:20 +0200
Message-ID: <JPEALJAFNGDDLOPNDIEEEEEJCIAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <JPEALJAFNGDDLOPNDIEEIEEICIAA.joakim.tjernlund@lumentis.se>
Return-Path: <joakim.tjernlund@lumentis.se>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Bradley D. LaRonde" <brad@laronde.org>, Richard Sandiford <rsandifo@redhat.com>
Cc: uclibc@uclibc.org, linux-mips@linux-mips.org
Message-ID: <20040510123620._fkaNQDnzAm67_PHTx3Qhk7V8PtCOfHor8Ay9j_U5Xc@z>

> 
> This looks like the problem we had with dlopen() and friends when introducing
> the new WEAK symbol handling.
> 
> in libc/misc/pthread/weaks.c you have stuff like:
> weak_alias(__phtread_return_0, __phtread_once);
> 
> where __phtread_return_0 is non NULL:
> int __phtread_return_0(void)
> {
>  return 0;
> }
> 

Changing the alias for __phtread_once to
extern int __phtread_once(void) __attribute__ ((weak));
makes st_value=0 in libc, making the entry
look the same as in glibc.

 Jocke

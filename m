Date: Thu, 14 Nov 2002 16:43:25 -0800 (PST)
From: Bradley Bozarth <bbozarth@cisco.com>
Subject: Re: SEGEV defines
In-Reply-To: <20021114055156.C24744@linux-mips.org>
Message-ID: <Pine.LNX.4.44.0211141518530.13664-100000@bbozarth-lnx.cisco.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <bbozarth@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: george anzinger <george@mvista.com>, linux-mips@linux-mips.org
Message-ID: <20021115004325.vt7bak2GZXIqBAWxN3Vw58dJavRArpWyOC0Bvknx6d4@z>

Along the same lines, the struct sigevent in the kernel says that it isn't 
IRIX compatible.. but it isn't glibc compatible either.  What is it 
compatible with?  The new posix timer code copies this struct from the 
user and kaboom, so again either glibc or the kernel needs to sync up.

relevant sections:

========= glibc/sysdeps/unix/sysv/linux/mips/bits:
/* XXX This one might need to change!!!  */
typedef struct sigevent
  {
    sigval_t sigev_value;
    int sigev_signo;
    int sigev_notify;

========= linux/include/asm-mips:
/* XXX This one isn't yet IRIX / ABI compatible.  */
typedef struct sigevent {
	int sigev_notify;
	sigval_t sigev_value;
	int sigev_signo;







On Thu, 14 Nov 2002, Ralf Baechle wrote:

> On Wed, Nov 13, 2002 at 08:23:10PM -0800, george anzinger wrote:
> 
> > I MUCH prefer a change to the kernel if one or the other
> > needs to change.  The issue is, of course, IRIX
> > compatability and what that means.  This comes up because I
> > want to use the definitions in combination and the common
> > bit makes a mess of things.  Still, it would be NICE if it
> > matched the rest of the platforms.
> 
> The IRIX compatibility code seems unused and the constants aren't even
> part of the ABI at all.  So in this case it indeed seems preferable to
> change the kernel side.
> 
> Anybody disagrees?
> 
>   Ralf
> 

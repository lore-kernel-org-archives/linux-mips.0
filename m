Date: Tue, 1 Jul 2003 08:39:02 -0400 (EDT)
From: <ik@cyberspace.org>
Subject: Re: is there any docs/manuals for linker scripts symbols
In-Reply-To: <20030625121801.GA11496@linux-mips.org>
Message-ID: <Pine.SUN.3.96.1030701083213.315A-100000@grex.cyberspace.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <ik@grex.cyberspace.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: ralf@linux-mips.org
Cc: linux-mips@linux-mips.org
Message-ID: <20030701123902.HibGMf8t05Zrwes8Q9AT9Yl6WrK6Ifd57KW55AjVxKs@z>

Hi Ralf,

On Wed, 25 Jun 2003 ralf@linux-mips.org wrote:

> On Wed, Jun 25, 2003 at 08:01:24AM -0400, ik@cyberspace.org wrote:
> 
> > My board has a boot loader (rom) that enforce/restricts the sections in
> > the elf header, hence I cannot use the default linker script that comes
> > wit the kernel(arch/mips/). 
> 
> Are you sure the loader actually looks at the sections?  That seems plain
> wrong.  Normally a loader should only look at all the PT_LOAD entries in
> the ELF program header table for loading.

I use the device available in my company (which is proprietary), 
I know my point here would be abstract for u...sorry abt that !

Thanks for the reply !
Indu
> 
> > I think your reply could be put as a howto/faqs in
> > http://www.linux-mips.org (for the global symbols
> > used in linux kernel).
> 
> So many things that deserve some well written documentation - yet so little
> exists ...
> 
>   Ralf
> 

Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199708161415.KAA31361@neon.ingenia.ca>
Subject: Re: boot linux - wish
In-Reply-To: <m0wzheO-0005FiC@lightning.swansea.linux.org.uk> from Alan Cox at "Aug 16, 97 01:08:12 pm"
Date: Sat, 16 Aug 1997 10:15:48 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: miguel@nuclecu.unam.mx, ariel@sgi.com, linux@cthulhu.engr.sgi.com
Message-ID: <19970816141548.4W-PdNRWcKIRBIgoq3KOp0XYjWlhaPUTdq-jQku50fU@z>

Thus spake Alan Cox:
> > If I stick all the RH stuff in an initrd and then they do FTP install,
> > then they should be able to use it via boot /vmlinux or boot -f
> > bootp()..., no?
> 
> 2.1.4x blows up with an initrd - hopefully fixed in 2.1.50/soon but that
> means the SGI one will corrupt and explode atm

I thought Ijust saw something from Bill Hawes cross the list that
addressed that, actually.  Regardless, they've got at least a week to
get 2.1.x playing nicely with initrds before I'll get a chance to use
it on the Indy. The initrd stuff is the trivial part, and should
operate identically to having it mounted via NFS-root.

Thanks for the warning, though.

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>      Chief System Architect -- will tame sendmail(8) for food       
#>                                                                     
#> "You are a very perverse individual, and I think I'd like to get to 
#>  know you better." --- eric@reference.com                           

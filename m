Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0ymnOa-000aOnC@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: Stuff that needs to be done.
Date: Thu, 18 Jun 1998 23:43:04 +0100 (BST)
In-Reply-To: <Pine.LNX.3.95.980617141204.8736C-100000@lager.engsoc.carleton.ca> from "Alex deVries" at Jun 17, 98 02:19:02 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980618224304.ggikATakLeteQBvx25Abu0Z8h6wYWc2Qn4xKxDo9pFE@z>

> modutils
>      Easy, just need to package the functional modutils that's in
>      the CVS on linus.

What happened there. My 4.9.1 modutils built fine

> mawk
>     This dies on compile with floating point errors.

Those look like kernel problems

> mars-nwe
>      Architecture specific.

Forget it - its very very non portable.

> aout-libs
>      I'm not sure.

Not needed

> bin86
>      Too difficult to do.

The Red Hat supplied bin86 isnt portable. It'll build on mips and write
invalid code. Get the Dev86 kit for ELKS. That one is portable

> xdosemu
> dosemu
>       Emulate DOS on a MIPS?  Not right away.

0.99 has CPU emulation in progress. So "soon"

alan

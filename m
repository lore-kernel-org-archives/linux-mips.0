Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199707181846.OAA20686@neon.ingenia.ca>
Subject: Re: Pointers on how to get started
In-Reply-To: <Pine.LNX.3.95.970718142505.27101O-100000@lager.engsoc.carleton.ca> from Alex deVries at "Jul 18, 97 02:43:30 pm"
Date: Fri, 18 Jul 1997 14:46:39 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970718184639.EENR04B7ERAWYh0gux_4QRRup7lFs_BXO8sEvFaoLKo@z>

Thus spake Alex deVries:
> 1. What's a good kernel to use for this, and can someone tell me where I
> can find a pre-compiled version of it? I suspect until the problems on
> 2.1.45 are fixed, newbies should be using something older.

I use a slightly-out-of-date version of 2.1.43 from the CVS tree.

> 2. Could someone either produce an RPM for an xcompiling gcc host=i386
> target=mips-linux, or send me a tarball?  I'd be happy to make it into an
> RPM.  Same goes for binutils.

Grab the stuff off of neon or linus from the crossdev directory.

> 3. Exactly what hardware will this run on?  All I've heard thus far is
> work on SGI Indy's.

I think that's it.  Whatever Ariel ships you should work, though.

> 4. Can someone tell me about how to configure an Indy to boot via bootp? I
> don't yet have access to manuals.

Configure your bootp server (see the config on neon for details)
correctly, and then:
Hit ESC for maintenance (heh)
5 for boot prompt.

boot -f bootp()blahblah

("blahblah" can be any string...it figures everything out from the
bootp server)

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#> Paranoid for money.                            Sarcastic for kicks. 
#>                                                                     
#> "They already *KNOW* I am a whacko, Karen.                          
#>                  That doesn't mean I am *WRONG*." -- mjr@clark.net  

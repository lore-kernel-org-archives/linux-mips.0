Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0yLByA-000aNnC@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: VCE exceptions
Date: Fri, 3 Apr 1998 20:17:41 +0100 (BST)
In-Reply-To: <199804031911.LAA21028@fir.engr.sgi.com> from "William J. Earl" at Apr 3, 98 11:11:15 am
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: "William J. Earl" <wje@fir.engr.sgi.com>
Cc: ralf@uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19980403191741.LnzorpQiBnBs5HySrw4cfqynGhpa1m_ZvIAkR2pN6gM@z>

>      As soon as I get a chance, I will look at the relevant linux
> code.  Note that physical color allocation can also make a big
> performance difference on direct mapped secondary caches, as on all of

Colouring in Linux isnt going to work without ripping the godawful buddy
allocator out of it. Unfortunately Linus seems quite attached to it at
the moment. Bamboo under the finger nails at Linux Expo perhaps Ralph ?

Whenever we try and do any colouring it fragments the buddy stuff up 
sufficiently badly that we basically break the box. 

Alan

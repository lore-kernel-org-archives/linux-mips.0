Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0yqRFN-000aOnC@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: hmmmm.... nice job!!
Date: Mon, 29 Jun 1998 00:52:37 +0100 (BST)
In-Reply-To: <Pine.LNX.3.95.980628145721.10146B-100000@lager.engsoc.carleton.ca> from "Alex deVries" at Jun 28, 98 02:58:20 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: mjhsieh@life.nthu.edu.tw, linux@cthulhu.engr.sgi.com
Message-ID: <19980628235237.LjFxgNUuxYY5besn2195Ul62Nn86QcPsYBtSRpyScRk@z>

> >  - (sometimes) a strange garbage image, about 1 character size in the
> >    lowerleft corner of the screen
> 
> Yup, that's a console bug, I get that too.

And a few other artifacts. They look like a race on how we handle scrolling,
cursors and other related items. Perhaps its time to go plug into abscon ?

Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: alambie@wellington.sgi.com (Alistair Lambie)
Message-ID: <199704182235.KAA13888@soyuz.wellington.sgi.com>
Subject: Re: init=/bin/sh and serial devices
Date: Sat, 19 Apr 1997 10:35:30 +1200 (NZT)
In-Reply-To: <199704150209.WAA00938@jenolan.caipgeneral> from "David S. Miller" at Apr 14, 97 10:09:11 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "David S. Miller" <davem@jenolan.rutgers.edu>
Cc: wje@fir.engr.sgi.com, knobi@munich.sgi.com, shaver@neon.ingenia.ca, linux@cthulhu.engr.sgi.com
Message-ID: <19970418223530.uRgYSSVfnWMBsVPtnOZaFXBNvOtClPs7fm4lxLDpIjo@z>

> 
>    Date: Mon, 14 Apr 1997 11:05:52 -0700
>    From: "William J. Earl" <wje@fir.engr.sgi.com>
> 
> 	Does the textport driver run in color-index mode?  If so, it
>    will probably work on the 8-bit card.  The cards are largely
>    identical, except for the depth of the frame buffer.
> 
> If memory serves, I left the chip in the exact mode the firmware has
> set it to.  So if the firmware sets up the card to use color-index
> mode, then I do as well in the driver.  (I think I did this so I did
> not have to deal with monitor frequencies, and resolutions, and that
> sort of thing)
> 
> But my text rendering code may make assumptions about frame buffer
> depth, I draw them using the various simpler raster operation commands
> the Newport has, so someone who knows would have to look at my code.
> 
I've been away for a few days, so sorry about the late reply :-)

It definitely works on an 8 bit machine.  That is what I have used in the past.

Cheers, Alistair

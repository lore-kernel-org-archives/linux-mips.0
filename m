Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Alan Cox <alan@cymru.net>
Message-ID: <199605300946.KAA24198@snowcrash.cymru.net>
Subject: Re: linux needs bsd networking stack
Date: Thu, 30 May 1996 10:46:46 +0100 (BST)
In-Reply-To: <199605292250.PAA03268@neteng.engr.sgi.com> from "David S. Miller" at May 29, 96 03:50:23 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "David S. Miller" <dm@neteng.engr.sgi.com>
Cc: nn@lanta.engr.sgi.com, torvalds@cs.helsinki.fi, alan@cymru.net, sparclinux-cvs@caipfs.rutgers.edu, lmlinux@neteng.engr.sgi.com
Message-ID: <19960530094646.Z5dhAoPc3S1VRLZFpB5X2eQtja-Jr1c3mB2Wb2-LJyI@z>

> It has a well defined architecture, I will agree with lm when he
> mentions that it is a jungle of code to sift through in certain
> respects.  It need a mallet to smooth certain aspects and interfaces
> out.

I hope to be working full time on this eventually (like when people are paying me
for it). I've also started documentation at the driver and skbuff level and will
work over it bit by bit - see forthcoming Linux Journal articles then going into the
KHG.

> their entire heart and soul into the Linux networking code.  I believe
> at the very least that the Linux networking stack is superior
> performance wise without any question, and as everyone knows I have
> numbers to prove it ;-)

Before you admire the performance numbers get the pre2.1 code off Pedro Roque. Now he
has added really neat header prediction code it kicks pre2.0's butt even though its
doing a surplus memory alloc we need to tidy up

Alan

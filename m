Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199812212133.NAA08955@oz.engr.sgi.com>
Subject: Re: bootp on IRIX server
Date: Mon, 21 Dec 1998 13:33:48 -0800 (PST)
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19981221213348.vuIwETvn71vKt0PXKXGMyLKJ2EtFbNbYEbovjWeHx1I@z>

[Forwarding bounced message.
 Please subscribe with an explicit general-domain (no machine)
 to avoid anti-spam subscriber-only bounces.
 Majordomo is picky about this -- Ariel]

Date: Mon, 21 Dec 1998 13:23:19 -0800
From: Shrijeet Mukherjee <shm@engr.sgi.com>
To: Al Aumenta <aumenta@albany.sgi.com>
cc: "linux@cthulhu.engr.sgi.com" <linux@cthulhu.engr.sgi.com>
Subject: Re: bootp on IRIX server
In-Reply-To: <367EB96A.AB060206@albany.sgi.com>
Message-ID: <Pine.SGI.4.05.9812211321150.14389-100000@tantrik.engr.sgi.com>


I had the same problem .. and I really do not remember what I did to make
it go away ..

but here are 2 things to try ..

1> run snoop on your SGI box .. and see what exactly is happening ..
2> try and bootp the unix kernel (IRIX) and see if bootp is setup and
running right ..


another thing I gathered is that there is some NFS incompatibility and we
need to serve the bootp of an intel linux box .. and thus I resorted to
that ..

hope this helps ..


On Mon, 21 Dec 1998, Al Aumenta wrote:

->I am attempting to install Linux on an Indy but I am running into a
->problem



-- 
Peace, Ariel

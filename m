Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <199807150900.LAA00705@aisa.fi.muni.cz>
Subject: Re: The pre-release of Hard Hat Linux for SGI...
In-Reply-To: <Pine.LNX.3.95.980715015327.30234B-100000@lager.engsoc.carleton.ca> from Alex deVries at "Jul 15, 98 02:05:15 am"
Date: Wed, 15 Jul 1998 11:00:47 +0200 (MET DST)
From: Honza Pazdziora <adelton@informatics.muni.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: ralf@uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19980715090047.XMCP0FZ1mY8c2F9WFWtjSsRPG3vFoPUAx7llZq34jqI@z>

> 
> > Time to put up a webpage and register users :-)
> 
> Yup.  I updated the WWW and FTP site a bit.  It'd be really good if we

OK, I've updated other links to manhattan/. Is the name Hard Hat 5.1
official?

> could maybe put a direct link from the main page to the Manhattan page.
> Also, it'd be good to have some sort of hardware compatibility page.  I
> know there will be people wondering about CPU compatibility, something I'm
> a bit confused about. Honza, could you help us out with that?

Yes, I'll try to create the page. Basically R4400, R4600, R5000,
PC and SC, anyrate are OK? How about R4000? Other hardware: XGE, XZ
(for consoles), 10BaseT, any reasonable SCSI? How about the Challenge S?

> I know it's a bitch to download 270MB, but I'd really like it if someone
> would give this dsitribution a shot.  Red Hat's going to press this on a
> CD later this week, and we need to make sure that we get it right.
> Actually, even Linux/SGI coasters would be pretty cool...

I have question about the ftp part (some of them based on the fact
that we are little bit short of space on our mirror, but I'd like to
mirror as much as possible). How about the RPM's in the
/src/ftp/pub/redhat/old directory? Shouldn't the be in some
subdirectory or gone? Also, I suggest renaming
/src/ftp/pub/redhat/old/redhat-5.1 to something like
redhat-5.1-alpha1 to be consistent with the name reflect the name of
redhat-5.1alpha1.tgz.

Also, /src/ftp/pub/test/vml.tar.gz could be renamed to something like
vmlinux-indy-2.1.99.tar.gz (is it 2.1.99?), and perhaps we could even
put the kernels to some directory other than test (maybe kernel?) and
also have a link there from software.html.

Anyway, our mirror already has 56 MB of that 270, let's hope it will
go on ;-)

------------------------------------------------------------------------
 Honza Pazdziora | adelton@fi.muni.cz | http://www.fi.muni.cz/~adelton/
                   I can take or leave it if I please
------------------------------------------------------------------------

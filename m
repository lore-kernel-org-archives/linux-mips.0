Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <199807161439.QAA10960@aisa.fi.muni.cz>
Subject: Re: The pre-release of Hard Hat Linux for SGI...
In-Reply-To: <Pine.LNX.3.95.980716101110.6127A-100000@lager.engsoc.carleton.ca> from Alex deVries at "Jul 16, 98 10:12:06 am"
Date: Thu, 16 Jul 1998 16:39:53 +0200 (MET DST)
From: Honza Pazdziora <adelton@informatics.muni.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: adelton@informatics.muni.cz, linux@cthulhu.engr.sgi.com
Message-ID: <19980716143953.M0-DkScHBU9olx4Qa-Ay4vUcIETMQbta8wovjgbgzos@z>

> 
> Okay, this queston is simple:
> 
> are you 100% sure that you're not installing with old packages, and that
> the huge .tar.gz has the same md5sum ?

I might be doing some stupid mistake somewhere but I just checked the
checksum and it's the same, the installer says Hard Hat, it installs
kernel 2.1.100 and there are 458 packages in the mipseb/RedHat/RPMS
directory that came from the tar. And my nfsroot argument to
$installinux point to tftpboot and from there the link goes to this
mipseb subdirectory (you can actually check the unpacked tar at our
mirror ftp://ftp.fi.muni.cz/pub/linux/sgi/redhat/mipseb, I install
from that machine). So I'm like at 98 % that it's not the old
version ;-)

------------------------------------------------------------------------
 Honza Pazdziora | adelton@fi.muni.cz | http://www.fi.muni.cz/~adelton/
                   I can take or leave it if I please
------------------------------------------------------------------------

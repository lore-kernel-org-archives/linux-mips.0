Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <199807170716.JAA24626@aisa.fi.muni.cz>
Subject: Re: Installing noarch packages
In-Reply-To: <Pine.LNX.3.95.980716140918.6127E-100000@lager.engsoc.carleton.ca> from Alex deVries at "Jul 16, 98 02:10:59 pm"
Date: Fri, 17 Jul 1998 09:16:10 +0200 (MET DST)
From: Honza Pazdziora <adelton@informatics.muni.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: adelton@informatics.muni.cz, linux@cthulhu.engr.sgi.com
Message-ID: <19980717071610.rud7Zrv0wIWTbU6lkNTNku9hG9sgUeIHe9GOw3CXsaY@z>

> 
> there's a problem with /usr/lib/rpmrc then.  It should have a line like:
> arch_compat: mipseb: noarch

This was there already.

> If that doesn't work, try adding:
> arch_compat: mips: noarch

This fixed the problem. Thanks,

------------------------------------------------------------------------
 Honza Pazdziora | adelton@fi.muni.cz | http://www.fi.muni.cz/~adelton/
                   I can take or leave it if I please
------------------------------------------------------------------------

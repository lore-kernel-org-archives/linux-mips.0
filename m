Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <199807170750.JAA25556@aisa.fi.muni.cz>
Subject: Re: Message while mounting NFS
In-Reply-To: <Pine.LNX.3.95.980717012619.5792C-100000@lager.engsoc.carleton.ca> from Alex deVries at "Jul 17, 98 01:28:19 am"
Date: Fri, 17 Jul 1998 09:50:24 +0200 (MET DST)
From: Honza Pazdziora <adelton@informatics.muni.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: dliu@npiww.com, adelton@informatics.muni.cz, linux@cthulhu.engr.sgi.com
Message-ID: <19980717075024.q2ilZrbS3VRXxcH3DorzmSHAxtTn9po08SSIrP3OYjw@z>

> 
> On Thu, 16 Jul 1998, Dong Liu wrote:
> > I think this is a bug of red hat system (BTW, where I can send them this bug
> > report?), portmapper is started after nfsfs, it should be started before
> > nfsfs.
> 
> Does starting portmapper before nfsfs actually work for you?  I still had

Thanks to all. Yes, installing portmap-4.0-11.mipseb.rpm and moving
S40portmap do S14portmap fixes the problem.

------------------------------------------------------------------------
 Honza Pazdziora | adelton@fi.muni.cz | http://www.fi.muni.cz/~adelton/
                   I can take or leave it if I please
------------------------------------------------------------------------

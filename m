Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0xcAil-0005FsC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: A report from the battle field...
Date: Sun, 30 Nov 1997 14:51:43 +0000 (GMT)
In-Reply-To: <Pine.LNX.3.95.971129193017.26978E-100000@lager.engsoc.carleton.ca> from "Alex deVries" at Nov 29, 97 07:44:47 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19971130145143.hVzx2pmxLqo8PycoDb0bM5XHVv5905uLu4M_GuNOOFk@z>

> 1. When I try to FTP a lot of files to it, it complains about "eth0: ".  I
> guess it's just going too quick.  The file then becomes corrupt.  The

Yep. Part of that however might be the ftp binary - ncftp I get
the eth0: errors but dont seem to get file corruption.

> 2. Execution errors on various programs:
> - bash: 
> do_page_fault() #2: sending SIGSEGV to bash for illegal readaccess
> from 000000d0 (epc ==0fb676c0, ra == 0fb676a0)
> - pico (part of pine):
> do_page_fault() #2: sending SIGSEGV to pico for illegal readaccess from
> from 000000d0 (epc ==0fb676c0, ra == 0fb676a0)

Link these static possibly. The bash stuff is working fine on my box however
the RPM maybe the one with readline in not the one I used. oops

> - mingetty: 
> unix_gc: deferred due to low memory

Miguel's kernel has this fixed (its a vmalloc thing)

> - when I try and do a control-alt-delete, it says that it's flushing the
> cache, and that's it.

I get a reboot about 1 in 3 times

Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199706031823.UAA01401@informatik.uni-koblenz.de>
Subject: Re: The Plan For Userland(tm)
Date: Tue, 3 Jun 1997 20:23:42 +0200 (MET DST)
In-Reply-To: <199706021821.OAA12315@neon.ingenia.ca> from "Mike Shaver" at Jun 2, 97 02:21:47 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@neon.ingenia.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970603182342.J6DNitkq8yPDlufBaQU0YVViSos2hfGtgfymlhersG4@z>

> Here's my plan for getting the userland stuff to critical mass:
> - kernel and glibc sync'd.  Shouldn't be too hard, once I get the new
> kernel from Ralf.

Sorry, it's taking a bit longer.  In the meantime I synced with .42;
still need to fix some more bugs.

>                   (At the very least, I need the SOCK_{STREAM,DGRAM}
> stuff sorted out, and I'd like to figure out a good strategy for
> asm/atomic.h.)

Whith what package again did you have the problems with atomic.h?

> - rpm built
> - native gcc built as an rpm
> - start building rpms natively, and installing them on a fresh
> partition
> 
> I think the SCSI driver is dodgy (this may be a known problem), and I
> need to get glibc installed on neon to ease the configuration issue,
> but I think we're well on our way.
> 
> I'm _definitely_ going to need more disk space on neon, but I can
> steal the ext2 one from bogomips in the short-term.

Yeah, and if there won't be xfs for linux I'd really like to see ext2
support for IRIX ...

> Oh, BTW:
> [shaver@neon shaver]$ telnet bogomips

ssh works also pretty good.  The only problem it has is that my X
pseudo port has still a "couple" of bugs.

  Ralf

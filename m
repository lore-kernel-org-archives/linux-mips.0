Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@Julia.DE>
Message-ID: <199706041440.QAA14054@kernel.panic.julia.de>
Subject: Re: The Plan For Userland(tm)
Date: Wed, 4 Jun 1997 16:40:19 +0200 (MET DST)
In-Reply-To: <9706041004.ZM2604@akira.tampa.sgi.com> from "Liam Irish" at Jun 4, 97 10:04:56 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Liam Irish <irish@akira.tampa.sgi.com>
Cc: ralf@mailhost.uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19970604144019.gKM2fMTaXxuqte1PRzeXKhSd3V8HEagQ2lc1ahJNQ-Y@z>

> > Yeah, and if there won't be xfs for linux I'd really like to see ext2
> > support for IRIX ...
> 
> >   Ralf
> >-- End of excerpt from Ralf Baechle
> 
> 
> I'd like to do that.  I've already been talking to some engineers about it.  I
> was trying to determine if it already been done.  Guess not.  I think it'd be
> easier to put ext2 on irix than xfs on linux, esp considering the other options
> involved with xfs.  Would it be 32-bit xfs?
> 
> Anyway.  They both interface a VFS, so it should be _too_ bad.  Unfortunately,
> I haven't seen to much documentation for VFS on irix.  Well, see if the Mtn
> View engineers will help out in that regard.

The other fun thing is that right now David and some other people are
rewriting the Linux VFS which also has impact on the ext2 code.

  Ralf

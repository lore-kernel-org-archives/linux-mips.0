Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199710242114.XAA11858@informatik.uni-koblenz.de>
Subject: Re: Step by step of my experience
Date: Fri, 24 Oct 1997 23:12:30 +0200 (MEST)
In-Reply-To: <60222E63C9F4D011915F00A02435011C011A5F@bart.hgeng.com> from "Mike Hill" at Oct 24, 97 01:07:43 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Hill <mikehill@hgeng.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19971024211230.qLo5IvVL5Fb6t3pJC4_YKMLIbl_BOWumerNCl9UssvQ@z>

Hi,

> Thus spake Mike Shaver:
> > I'll clean up my current support tomorrow or Friday, and then I'll
> > check it in and coerce Miguel or Ralf into making a new test
> > kernel available. 
> 
> Is it possible to download the latest development work on the kernel,
> for instance what's in the CVS repository?  Or, to quote the FAQ:
> 
> 	14.  Where can I find up-to-the-second releases?

We'll setup anonymous CVS access and a cronjob that will create diffs
between kernel releases such that people can stay uptodate.  Right now
you should go for the testing kernels in /pub/src/kernel/testing/, they
are the newest and most reliable onces released.  I've got tons of
bugfixes but I won't have the time to merge them in the near future ...

  Ralf

Message-ID: <004201c30af7$524fb0a0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.LNX.4.44.0304241839110.19067-100000@frank.harvard.edu>
Subject: Re: NCD900 port?
Date: Fri, 25 Apr 2003 08:53:02 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Chip Coldwell <coldwell@frank.harvard.edu>
Cc: linux-mips@linux-mips.org
Message-ID: <20030425065302.QgCEpm193h60gr2YXk4mMP2zTKoAlOHtMYCCtZhCqIs@z>

> On Thu, 24 Apr 2003, Chip Coldwell wrote:
> 
> > On Thu, 24 Apr 2003, Kevin D. Kissell wrote:
> > > 
> > > What PCI bridge is being used?  Galileo?
> > 
> > Good question.  Short answer: I don't know.  I'll pry off the hood
> > and take a peek at what's on the board, unless this is something that
> > shares a die with the CPU.
> 
> It was easy to identify once I took off the cover.  The PCI bridge is
> made by V3 Semiconductor (now a part of QuickLogic?), part number
> V32OUSC-75LP (Rev. B1):
> 
> http://www.quicklogic.com/home.asp?PageID=235&sMenuID=126
> 
> Is this the one called "Galileo"?

No, Galileo is/was a different company.  So you may not be able
to recycle as much existing code as you might have otherwise, but 
at least you've got some documentation for it.

            Kevin K.

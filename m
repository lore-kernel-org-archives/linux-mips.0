Message-ID: <009d01c29c40$85ccd9b0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20021203224504.B13437@mvista.com> <007501c29b78$f34680e0$10eca8c0@grendel> <3DEDD414.3854664F@mips.com> <20021204141900.U4363@mvista.com>
Subject: Re: possible Malta 4Kc cache problem ...
Date: Thu, 5 Dec 2002 10:27:10 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Jun Sun <jsun@mvista.com>, Carsten Langgaard <carstenl@mips.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20021205092710.CgnmKI_U2squbk4jIo9BFPgtp1EdWjSCh7MonrRB9LI@z>

> On Wed, Dec 04, 2002 at 11:08:20AM +0100, Carsten Langgaard wrote:
> > I have just tried your test on a 4Kc and I see no problems.
> > However I'm running on our internal kernel sources, and as Kevin mention we have
> > changed a fixed a few things in this area.
> > As Kevin also mention it sure look more like a I-cache invalidation problem,
> > rather than a D-cache flush problem, as the 4Kc has a write-through cache.
> > One think you could try, is our latest kernel release. You can find it here:
> > ftp://ftp.mips.com/pub/linux/mips/kernel/2.4/images/
> >
> 
> Yes, the problem still exists with this kernel.
> 
> Try to move the source tree to /root/, rename top dir to "try18", 
> re-make the binary, and try again.
> 
> This problem is tricky to reproduce.  The location of the tree
> definitely matters.  I am testing 32bit LE version.  Have not
> tried BE.
> 
> I think I have pinned down the problem.  See my other follow-up posting.

Your results are certainly interesting and suspicious.
Before I take it up with the designers as a possible
hardware bug, I would really like to know if there
is more than one chip which exhibits this behavior.
In principle, it *could* be a manufacturing defect.
And while I acknowledge that your trace info
would seem to argue on the face of it that the
hardware didn't do what it should have done,
there is a remarkable similarity between what
you report and something that Carsten saw on
a couple of completely different CPUs a week
or two ago, which makes me wonder if there isn't
still some subtle software failure behind all this.
Thank you very, very, much for digging into
this as deeply as you have.

            Kevin K.

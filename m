Message-ID: <00e801c1a371$65c92ec0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.LNX.3.96.1020122110419.20690A-100000@wakko.deltatee.com>
Subject: Re: patches for test-and-set without ll/sc (Re: thread-ready ABIs)
Date: Tue, 22 Jan 2002 19:19:55 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Jason Gunthorpe <jgg@debian.org>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020122181955.OTDtGj_9Hl9LhVI0T-sMyqGO3Eeoepua7apG-HfAn0M@z>

> On Tue, 22 Jan 2002, Kevin D. Kissell wrote:
> 
> > The idea leverages off the fact that a branch likely
> > instruction performs a kind of conditional execution.
> > The instruction in the delay slot is executed only if
> > the branch is taken.  This can be used to synthesize
> > a conditional store.  The user level code for a simple
> > atomic increment, for example, would look something
> > like this:
> 
> Hmm, could you use this to take the race out of the kernel wait loop 
> too? Ie use current->need_resched as the test and 'wait' as the
> conditional operation.

It's quite possible.  But remember that it won't work on
an R3000.  R39xx yes, but not an R3K "classic".

            Kevin K.

From: Dominic Sweetman <dom@mips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <16456.21112.570245.1011@arsenal.mips.com>
Date: Fri, 5 Mar 2004 10:12:08 +0000
Subject: Re: gcc support of mips32 release 2
In-Reply-To: <1078478086.4308.14.camel@dzur.sfbay.redhat.com>
References: <20040305075517.42647.qmail@web40404.mail.yahoo.com>
	<1078478086.4308.14.camel@dzur.sfbay.redhat.com>
Return-Path: <dom@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Eric Christopher <echristo@redhat.com>
Cc: Long Li <long21st@yahoo.com>, linux-mips@linux-mips.org, David Ung <davidu@mips.com>, Nigel Stephens <nigel@mips.com>
Message-ID: <20040305101208.qUz3o1vHWDwiMGMgtNbjkGhoTBznRLt24RvZeDR9Pyg@z>


> > Seems to me, this mips32 release 2 is an extension of
> > mips32, added some new instructions, eg. EHB, etc. So
> > would it be necessary that gcc be updated, like what
> > gnu as has done, in the future to reflect this
> > extension?
> 
> It will be in the soon to be released 3.4. Contributed by Chris
> Demetriou of Broadcom.

We added patterns to let our (old) GCC use the new rotates and
bit-insert/extracts, at least in simple cases.  I'm not sure whether
we've put those in our 3.4 evolution tree yet, but if we have we
should push those out.

--
Dominic Sweetman
MIPS Technologies.

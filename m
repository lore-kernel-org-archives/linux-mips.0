Date: Fri, 20 Apr 2001 16:21:20 -0400 (EDT)
From: George Gensure <werkt@csh.rit.edu>
Subject: Re: glibc build
In-Reply-To: <3AE096DC.ECB49D19@ayrnetworks.com>
Message-ID: <Pine.SOL.4.31.0104201612540.3449-100000@fury.csh.rit.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Bryan Chua <chua@ayrnetworks.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010420202120.IsurNmzsC3LS29wvV0Apb97qk0SIGPM9InUcT_npVKA@z>

I went throught and deleted all of those entries in assembly files which
caused problems, but I end up with similar problems later, only the
assembler seems to have been running from standard input..

George
werkt@csh.rit.edu

On Fri, 20 Apr 2001, Bryan Chua wrote:

> CFLAGS=-D__PIC__ make all [check] install
>
> the target "check" will not work if you are cross compiling, so you
> might as well install...  You end up coming across this in several
> places.
>
> -- bryan
>
> "George Gensure,,," wrote:
>
> > Where is the CFLAGS that I should add to? In the Subdirectories?
> >
> > George
> > werkt@csh.rit.edu
>

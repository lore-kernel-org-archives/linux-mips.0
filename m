From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200212181950.gBIJo4B11893@coplin09.mips.com>
Subject: Re: [PATCH]: fix compiler warnings in the math-emulator
Date: Wed, 18 Dec 2002 20:50:04 +0100 (CET)
In-Reply-To: <20021218114220.A2217@wumpus.internal.keyresearch.com> from "Greg Lindahl" at Dec 18, 2002 11:42:20 
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-Path: <hartvige@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Greg Lindahl <lindahl@keyresearch.com>
Cc: linux mips mailing list <linux-mips@linux-mips.org>
Message-ID: <20021218195004.BgJxX5gbpP7VGuEL7-9_OQft-ENSiaRVeIq-KS-RMV0@z>

Sometimes you don't care whether you do only "half" a macro instruction
if the branch is taken. Usually though, the warning is a good thing - I
remember having spent many hours finding bugs like this with assemblers
that don't issue warnings.

/Hartvig

Greg Lindahl writes:
> 
> On Wed, Dec 18, 2002 at 07:47:31PM +0100, Maciej W. Rozycki wrote:
> 
> >  A few warnings are unavoidable -- e.g. there is no way to shut up gas
> > complaining about macros expanding into multiple instructions in branch
> > delay slots.  Too bad.
> 
> ... why isn't that a bug?
> 
> greg

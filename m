Message-ID: <030801c29bea$e91d76b0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20021203224504.B13437@mvista.com> <007501c29b78$f34680e0$10eca8c0@grendel> <20021204135950.T4363@mvista.com>
Subject: Re: possible Malta 4Kc cache problem ...
Date: Thu, 5 Dec 2002 00:14:18 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Jun Sun <jsun@mvista.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20021204231418.fbhO3stCoSflaZcx8oEiuia0ejivQ_cE2oPXetI59gU@z>

> On Wed, Dec 04, 2002 at 10:38:36AM +0100, Kevin D. Kissell wrote:
> > 
> > Which version of the 4Kc manual are you looking at?  I'm looking
> > at a very recent version of the 4Kc Software User's Manual
> > (version 1.17, dated September 25, 2002), and it only shows
> > Hit_Writeback_D to be invalid for *secondary and teritary*
> > caches, which makes sense, since the 4KSc doesn't have any.
> >
> 
> I was looking at rev 1.12, Jan 3, 2001.
> 
> Good to know that 4K family does have Hit_WRiteback_D.  However,
> since it is "recommanded" instead of "required".  Shouldn't we
> still use "Hit_Writeback_Inv_D" just to be on the safe side?

Pardon me, but I thought that you were talking about 
hit-writeback-invalidates to begin with.  Indeed, I had
thought that we had organized things so that Linux always
did writeback-invalidates and never simple writebacks,
just to be on the safe side, as you say, but tampoline code 
is a special case where I can see no possible multiprocessor 
coherence issues with failing to invalidate the local Dcache 
copy. In any case, it would  be100% correct for a pure 
"hit writeback" to be a no-op on a write-through cache, 
since there is never anything dirty to write back.

            Kevin K.

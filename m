content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: RE: Disabling lwl and lwr instruction generation
Date: Thu, 13 Mar 2003 10:00:47 -0800
Message-ID: <D9F6B9DABA4CAE4B92850252C52383AB07968240@ex-eng-corp.efi.com>
From: "Ranjan Parthasarathy" <ranjanp@efi.com>
Return-Path: <ranjanp@efi.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>, Richard Hodges <rh@matriplex.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20030313180047.LjIatnQgxTukzIMDKMQZGl0nLYOFPpjflgpc3VvKPac@z>

Thanks for all your replies and no I am not working on the chinese processor :-). BTW it would be nice to have a mips option on override cpu options for disabling the lwl,lwr,swl,swr similar to "Cpu has ll/sc".

Thanks

Ranjan

-----Original Message-----
From: Ralf Baechle [mailto:ralf@linux-mips.org]
Sent: Wednesday, March 12, 2003 5:34 PM
To: Richard Hodges
Cc: Ranjan Parthasarathy; 'linux-mips@linux-mips.org'
Subject: Re: Disabling lwl and lwr instruction generation


On Wed, Mar 12, 2003 at 04:50:53PM -0800, Richard Hodges wrote:

> I got lwl and lwr from a memcpy() with two void pointers...
> 
> I quickly changed those to the (aligned) structure pointers instead, and
> then memcpy() changed to ordinary word loads and stores.
> 
> So, is somebody starting a toolchain for that new Chinese CPU? :-)

Wouldn't be the first processor without lwl/lwr instructions.  There have
been a few that didn't implement it for silly bean^Wgate counting issues
others have done it for patent and licensing reasons.

(Afair MIPS's patent is about to expire and IBM's prior art patent in the
same area is even way older but that legalese ...)

  Ralf

Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199810200421.VAA17379@oz.engr.sgi.com>
Subject: Re: get_mmu_context()
Date: Mon, 19 Oct 1998 21:21:28 -0700 (PDT)
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19981020042128.CgihFwgFr_vuDKH467jiO-tSV-zV_9xamxicVj-ssIo@z>

Forwarding message from David, his email probably changed
so it bounced...

----- Forwarded message from owner-linux@cthulhu -----

From: "David S. Miller" <davem@dm.cobaltmicro.com>
To: imp@village.org
CC: ralf@uni-koblenz.de, linux-mips@fnet.fr, linux@cthulhu.engr.sgi.com
In-reply-to: <199810200407.WAA03233@harmony.village.org> (message from Warner
	Losh on Mon, 19 Oct 1998 22:07:26 -0600)
Subject: Re: get_mmu_context()
References: <19981019121804.F387@uni-koblenz.de>  <Pine.SV4.3.91.981016185136.876A-100000@mech.math.msu.su> <XFMail.981018215318.harald.koerfgen@netcologne.de> <199810200407.WAA03233@harmony.village.org>

   Date: Mon, 19 Oct 1998 22:07:26 -0600
   From: Warner Losh <imp@village.org>

   Wouldn't it be easier to have ld to have variant fixup records?
   That way you could patch all instances at run time, much like we do
   when we load stuff now...

See sparc32's btfixup in the kernel sources for the best
implementation I've ever seen.

Later,
David S. Miller
davem@dm.cobaltmicro.com

----- End of forwarded message from owner-linux@cthulhu -----

-- 
Peace, Ariel

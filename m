From: Karel van Houten <karel@kpn.com>
Message-ID: <200207181519.RAA18230@sparta.research.kpn.com>
Subject: Re: DECStation: Support for PMAZ-AA TC SCSI card?
Date: Thu, 18 Jul 2002 17:19:33 +0200 (MET DST)
In-Reply-To: <Pine.GSO.3.96.1020718160853.14993C-100000@delta.ds2.pg.gda.pl> from "Maciej W. Rozycki" at Jul 18, 2002 04:27:31 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: "\"Houten K.H.C. van Karel\"" <vhouten@kpn.com>, linux-mips@oss.sgi.com
Message-ID: <20020718151933.-BkAYkOh51yLl0UNxug35VN83UhjqImqRFgq61teiX0@z>

Hi Maciej,

> 
>  It would be great if you could check if the driver works for the /200's
> onboard PMAZ-A.  If it worked there, I'd suspect a bug in the NCR53C8x
> support core.  But please don't put a second PMAZ-A into your /200 -- for
> an unclear reason the driver only supports a single I/O ASIC-based HBA and
> a single additional PMAZ-A board.  All PMAZ-A boards share operational
> variables with one another, so using more than a single one leads to data
> corruption.

I have a 5000/200 running fine with the same kernel (the one without
your patch). Or did you mean WITH your patch? The only problem
is that delo can't handle the different prom in the /200, so that
system has to boot over the network, but can use the local disks just fine.

Regards,
-- 
Karel van Houten

----------------------------------------------------------
The box said "Requires Windows 95 or better."
I can't understand why it won't work on my Linux computer. 
----------------------------------------------------------

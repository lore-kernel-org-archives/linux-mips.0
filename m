Message-ID: <200301081933.h08JX1F09754@uhler-linux.mips.com>
Reply-To: uhler@mips.com
Subject: Re: [patch] Use XKPHYS for 64-bit TLB flushes 
In-reply-to: Your message of "Wed, 08 Jan 2003 20:18:46 +0100."
             <Pine.GSO.3.96.1030108200826.7872A-100000@delta.ds2.pg.gda.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 08 Jan 2003 11:33:01 -0800
From: "Mike Uhler" <uhler@mips.com>
Return-Path: <uhler@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: Dominic Sweetman <dom@mips.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, uhler@mips.com
Message-ID: <20030108193301.X22jIDJINIt1QTyBdX1zS-_b01gZ_mITLAJYaFwLvFA@z>


> 
>  They do are different: KSEG0+entry*0x2000, likewise for XKPHYS -- see the
> patch. 

This is precisely what we use for our internal testing (which is also
exported to MIPS32 and MIPS64 architecture licensees) to initialize the
TLB.  I have not yet seen a case where this fails, and would be interested
in hearing about any case where it does fail.

/gmu

-- 

  =*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
  Michael Uhler, VP, Systems, Architecture, and Software Products 
  MIPS Technologies, Inc.   Email: uhler@mips.com   Pager: uhler_p@mips.com
  1225 Charleston Road      Voice:  (650)567-5025   FAX:   (650)567-5225
  Mountain View, CA 94043   Mobile: (650)868-6870   Admin: (650)567-5085

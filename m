Message-ID: <00ae01c3035e$d431aba0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1030415161611.13254H-100000@delta.ds2.pg.gda.pl>
Subject: Re: wbflush() abuse for TOSHIBA_RBTX4927
Date: Tue, 15 Apr 2003 16:53:49 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, linux-mips@linux-mips.org
Cc: source@mvista.com
Message-ID: <20030415145349.lQ8ekF0jmZ4xNwMCykhbxwow5kuH8K53TNX9pbGBpyc@z>

I remember that some of the Toshiba parts of the TX39 series
had some interesting quirks relating to the write buffer.  Perhaps
some of these were carried into the TX49 series as well?

----- Original Message ----- 
From: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
To: <linux-mips@linux-mips.org>
Cc: <source@mvista.com>
Sent: Tuesday, April 15, 2003 4:22 PM
Subject: wbflush() abuse for TOSHIBA_RBTX4927


> Hello,
> 
>  I see wbflush() is abused in an interesting and inefficient way for
> TOSHIBA_RBTX4927.  Is there any specific reason for such a setup?
> 
>   Maciej
> 
> -- 
> +  Maciej W. Rozycki, Technical University of Gdansk, Poland   +
> +--------------------------------------------------------------+
> +        e-mail: macro@ds2.pg.gda.pl, PGP key available        +
> 
> 
> 

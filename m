Message-ID: <010601c1b3bd$1da618e0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1020212123901.17858B-100000@delta.ds2.pg.gda.pl>
Subject: Re: [patch] linux 2.4.17: The second mb() rework (final)
Date: Tue, 12 Feb 2002 13:02:13 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, Matthew Dharm <mdharm@momenco.com>
Cc: Ralf Baechle <ralf@uni-koblenz.de>, linux-mips@fnet.fr, linux-mips@oss.sgi.com
Message-ID: <20020212120213.SgiV0R0xbJ6L8-34riJnGJkjJnS8V1c3XmvtCe0Y_Eo@z>

From: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>:
> On Mon, 11 Feb 2002, Matthew Dharm wrote:
> 
> > Aren't there more processors that have sync?  I thought the RM7000
> > (PMC-Sierra) did too...
> 
>  Obviously there are as "sync" is standard for MIPS II and above.  That's
> why only CONFIG_CPU_R3000 and CONFIG_CPU_TX39XX disable "sync".

According to the (rather old) Tx39xx specs at my disposal,
those parts should also support the SYNC instruction.  Does
anyone know for a fact that some of them do not?

            Kevin K.

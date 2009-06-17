Received: from gateway-1237.mvista.com ([63.81.120.158]:59248 "EHLO
	gateway-1237.mvista.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S1492042AbZFQPnv (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 17 Jun 2009 17:43:51 +0200
From: "Tim Anderson" <tanderson@mvista.com>
Subject: RE: [PATCH 4/5] Move gcmp_probe to before the SMP ops
Date: Wed, 17 Jun 2009 08:40:38 -0700
Message-ID: <5E81F192B0A841C3A2DB4BB3CD7882D4@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20090617082118.GC13467@linux-mips.org>
Return-Path: <tanderson@mvista.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Ralf Baechle' <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20090617154038.WfjCwGdlNLV2SsGJxWV-zJkh15-jtZohUNMLNrxy-Tk@z>

 

> -----Original Message-----
> From: Ralf Baechle [mailto:ralf@linux-mips.org] 
> Sent: Wednesday, June 17, 2009 1:21 AM
> To: Tim Anderson
> Cc: linux-mips@linux-mips.org
> Subject: Re: [PATCH 4/5] Move gcmp_probe to before the SMP ops
> 
> On Tue, Jun 16, 2009 at 05:00:35PM -0700, Tim Anderson wrote:
> 
> > @@ -358,10 +361,16 @@ void __init prom_init(void)
> >  #ifdef CONFIG_SERIAL_8250_CONSOLE
> >  	console_config();
> >  #endif
> > +	/* Early detection of CMP support */
> > +	result = gcmp_probe(GCMP_BASE_ADDR, GCMP_ADDRSPACE_SZ);
> > +
> >  #ifdef CONFIG_MIPS_CMP
> > -	register_smp_ops(&cmp_smp_ops);
> > +	if (result) register_smp_ops(&cmp_smp_ops);
> 
> Keep the register_smp_ops on a separate line.
> 
> >  #endif
> >  #ifdef CONFIG_MIPS_MT_SMP
> > +#ifdef CONFIG_MIPS_CMP
> > +	if (!result)
> > +#endif
> >  	register_smp_ops(&vsmp_smp_ops);
> 
> Suggested rewrite for readability and to silence checkpatch:
> 
> #ifdef CONFIG_MIPS_CMP
> 	if (!result)
> 		register_smp_ops(&vsmp_smp_ops);
> #else
> 	register_smp_ops(&vsmp_smp_ops);
> #endif
> 
>   Ralf

Yes that may be better to understand.

I will re-submit.

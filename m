Received: from 20pmail.ess.barracuda.com ([64.235.154.233]:36661 "EHLO
        20pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990406AbdJTUyDTevlL (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 20 Oct 2017 22:54:03 +0200
Date: Fri, 20 Oct 2017 21:52:33 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH] MIPS: kernel: proc: Remove spurious white space in
 cpuinfo
In-Reply-To: <1508512648.30181.1.camel@perches.com>
Message-ID: <alpine.DEB.2.00.1710202148280.3886@tp.orcam.me.uk>
References: <1508509203-30661-1-git-send-email-aleksandar.markovic@rt-rk.com> <1508512648.30181.1.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Joe Perches <joe@perches.com>
Cc: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, linux-mips@linux-mips.org, Dragan Cecavac <dragan.cecavac@mips.com>, Aleksandar Markovic <aleksandar.markovic@mips.com>, Douglas Leung <douglas.leung@mips.com>, Goran Ferenc <goran.ferenc@mips.com>, James Hogan <james.hogan@mips.com>, James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org, "Maciej W. Rozycki" <macro@linux-mips.org>, Miodrag Dinic <miodrag.dinic@mips.com>, Paul Burton <paul.burton@imgtec.com>, Paul Burton <paul.burton@mips.com>, Petar Jovanovic <petar.jovanovic@mips.com>, Raghu Gandham <raghu.gandham@mips.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20171020205233.TezqzQdSrnlie9Y9o6kLRb5FMHynaYZ90PW51G4l_w8@z>

On Fri, 20 Oct 2017, Joe Perches wrote:

> > diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
> > index bd9bf52..99f9aab 100644
> > --- a/arch/mips/kernel/proc.c
> > +++ b/arch/mips/kernel/proc.c
> > @@ -58,7 +58,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
> >  
> >  	seq_printf(m, "processor\t\t: %ld\n", n);
> >  	sprintf(fmt, "cpu model\t\t: %%s V%%d.%%d%s\n",
> > -		      cpu_data[n].options & MIPS_CPU_FPU ? "  FPU V%d.%d" : "");
> > +		      cpu_data[n].options & MIPS_CPU_FPU ? " FPU V%d.%d" : "");
> >  	seq_printf(m, fmt, __cpu_name[n],
> >  		      (version >> 4) & 0x0f, version & 0x0f,
> >  		      (fp_vers >> 4) & 0x0f, fp_vers & 0x0f);
> 
> That's somewhat unpleasant code as it formats a fmt string
> and the compiler can not verify fmt and args.
> 
> Perhaps something like the below is preferable:

 Hmm, what problem exactly are you trying to solve with code that has 
worked just fine for 16 years now?

  Maciej

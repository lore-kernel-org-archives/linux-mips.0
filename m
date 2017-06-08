Received: from mailapp01.imgtec.com ([195.59.15.196]:57332 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993865AbdFHPDa3Sja4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 8 Jun 2017 17:03:30 +0200
Date: Thu, 8 Jun 2017 16:03:14 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 4/9] MIPS: Send SIGILL for BPOSGE32 in
 `__compute_return_epc_for_insn'
In-Reply-To: <20170608131141.GB8108@linux-mips.org>
Message-ID: <alpine.DEB.2.00.1706081548090.21750@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1706040314270.10864@tp.orcam.me.uk> <alpine.DEB.2.00.1706050258410.10864@tp.orcam.me.uk> <20170608131141.GB8108@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20170608150314.zrsgBDw0raOh-gVCloYNtWdR0lmMDWMQwR39wN_2pUI@z>

On Thu, 8 Jun 2017, Ralf Baechle wrote:

> >  sigill_dsp:
> > -	printk("%s: DSP branch but not DSP ASE - sending SIGBUS.\n", current->comm);
> > -	force_sig(SIGBUS, current);
> > +	pr_info("%s: DSP branch but not DSP ASE - sending SIGILL.\n",
> > +		current->comm);
> 
> Shouldn't this then maybe be a pr_debug then?  With pr_info the right
> kind of program can produce lots of useless clutter.

 Sure.  Since I'm going to repost anyway to address Greg's concern, I'll 
append an extra patch to the series, to change these all en masse, for 
consistency.

 Eventually I think they will all go as I suspect they cover an impossible 
condition (so BUG_ON will be more appropriate), i.e. you can't get a 
delay-slot exception for a branch that has not been implemented -- you'll 
get a Reserved Instruction exception for the branch itself instead, and 
then there's nothing to emulate.  But I'll have to investigate execution 
paths carefully first, verify that `delay_slot' is called consistently and 
surely split off R2-on-R6 emulation code, before we can consider such a 
change a safe operation.

 Glad to see you back.

  Maciej

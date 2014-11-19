Received: from relay1.mentorg.com ([192.94.38.131]:58457 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011908AbaKSLhgPhXGs (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 19 Nov 2014 12:37:36 +0100
Date: Wed, 19 Nov 2014 11:37:22 +0000
From: "Maciej W. Rozycki" <macro@codesourcery.com>
Subject: Re: [PATCH 2/2] MIPS: jump_label.c: Handle the microMIPS J instruction
 encoding
In-Reply-To: <20141119092734.GA7358@linux-mips.org>
Message-ID: <alpine.DEB.1.10.1411191135110.2881@tp.orcam.me.uk>
References: <alpine.DEB.1.10.1411170524070.2881@tp.orcam.me.uk> <alpine.DEB.1.10.1411170530220.2881@tp.orcam.me.uk> <20141119092734.GA7358@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej_Rozycki@mentor.com>
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
Cc: linux-mips@linux-mips.org
Message-ID: <20141119113722.017EbODfd4UZaRi4YCOtMqLFL7LbKaFDVrav-L1FPCA@z>

On Wed, 19 Nov 2014, Ralf Baechle wrote:

> > +	if (IS_ENABLED(CONFIG_CPU_MICROMIPS)) {
> > +		insn_p->halfword[0] = insn.word >> 16;
> > +		insn_p->halfword[1] = insn.word;
> > +	} else
> > +		*insn_p = insn;
> 
> I think the IS_ENABLED() should be replaced with cpu_has_mmips?

 Nope, this leg must only execute if the kernel itself has been built as 
microMIPS code -- it's patching itself here.

  Maciej

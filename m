Received: from mailapp01.imgtec.com ([195.59.15.196]:2414 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012187AbcBIUAZ1zLfS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 9 Feb 2016 21:00:25 +0100
Date: Tue, 9 Feb 2016 19:44:08 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH v3 3/3] mips: Differentiate between 32 and 64 bit ELF
 header
In-Reply-To: <56B9DDCA.3000700@bmw-carit.de>
Message-ID: <alpine.DEB.2.00.1602091941400.15885@tp.orcam.me.uk>
References: <201602090033.mukhdG4N%fengguang.wu@intel.com> <56B99D55.2020301@bmw-carit.de> <alpine.DEB.2.00.1602091148570.15885@tp.orcam.me.uk> <56B9DDCA.3000700@bmw-carit.de>
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
To: Daniel Wagner <daniel.wagner@bmw-carit.de>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@01.org, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20160209194408.xFUkdfKlFK3H-fmZkObeVp_0wDg54WIMF8H-WFC-LDY@z>

On Tue, 9 Feb 2016, Daniel Wagner wrote:

> >  FWIW I think all the MIPS ABI flags stuff also needs to go outside the 
> > conditional, because it's ABI agnostic.  I'll make the right change myself 
> > on top of your fixes.  It'll remove a little bit of code duplication, 
> > which is always welcome.
> 
> Great, thanks for taking care of it.

 My ABI flags change has passed testing and I'm ready to post it, will you 
be respinning your patch soon?

  Maciej

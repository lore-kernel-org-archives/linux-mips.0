Received: from mailapp01.imgtec.com ([195.59.15.196]:64969 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993906AbdGDPgLqAHz7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 4 Jul 2017 17:36:11 +0200
Date: Tue, 4 Jul 2017 16:35:51 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 3/4] MIPS16e2: Report ASE presence in /proc/cpuinfo
In-Reply-To: <20170703202323.GM31455@jhogan-linux.le.imgtec.org>
Message-ID: <alpine.DEB.2.00.1707041635000.3339@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1705180145220.2590@tp.orcam.me.uk> <alpine.DEB.2.00.1705230230220.2590@tp.orcam.me.uk> <20170703202323.GM31455@jhogan-linux.le.imgtec.org>
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
To: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20170704153551.vilBMD8v_l-P-BUfSSJyuOYZp9miKBTZh7sBuuMn_eA@z>

On Mon, 3 Jul 2017, James Hogan wrote:

> >  Submitted third in the series so that the presence of "mips16e2" in 
> > /proc/cpuinfo not only indicates the hardware feature, but our correct 
> > unaligned emulation as well.
> 
> This should be mentioned in the commit description (not the 3rd in the
> series bit, the "it indicates both the hw feature and unaligned
> emulation" bit).

 Shall I repost the series with this piece amended?  Or will just 3/4 do?

  Maciej

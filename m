Received: from mailapp01.imgtec.com ([195.59.15.196]:38244 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993976AbdF2QkDCk7hg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 Jun 2017 18:40:03 +0200
Date: Thu, 29 Jun 2017 17:39:44 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 5/6] MIPS: tlbex: Use ErrorEPC as scratch when KScratch
 isn't available
In-Reply-To: <20170628152535.GA2698@linux-mips.org>
Message-ID: <alpine.DEB.2.00.1706291729220.31404@tp.orcam.me.uk>
References: <20170602223806.5078-1-paul.burton@imgtec.com> <20170602223806.5078-6-paul.burton@imgtec.com> <alpine.DEB.2.00.1706151806310.23046@tp.orcam.me.uk> <20170628152535.GA2698@linux-mips.org>
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
Cc: Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20170629163944.Z-_YUNPsNqDl3N7M3IetFWZRVvMEPk6pBB3hIoMQFWI@z>

On Wed, 28 Jun 2017, Ralf Baechle wrote:

> So I think while it's a nice hack I think this patch should be reserved
> for system that don't support parity or ECC or where generally a tiny bit
> of performance is more important that reliability.

 One problem I can see here is that AFAICT we use this somewhat costly 
scratch setup even in cases where it is not needed (i.e. the scratch 
remains unused throughout the handler), defeating the intent of the TLB 
handler generator, which was created for the very purpose of avoiding any 
wasted cycles that static universal handlers necessarily incurred.

 I think this is what has to be addressed instead, removing the penalty 
from configurations that do not need it, i.e. no RIXI, no HTW, etc.  Then 
chances are the more complex configurations will often have the required 
scratch resources available such as KScratch or SRS registers, which can 
then be used appropriately (and if some don't then it'll be them only 
that'll take the penalty they deserve).

  Maciej

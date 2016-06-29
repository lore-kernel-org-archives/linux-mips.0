Received: from mailapp01.imgtec.com ([195.59.15.196]:28762 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006833AbcF2PrLRqUwE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 29 Jun 2016 17:47:11 +0200
Date: Wed, 29 Jun 2016 16:46:57 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [committed] MIPS/GAS: Fix an ISA override not lifting ABI
 restrictions
In-Reply-To: <alpine.DEB.2.00.1604220223310.21846@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1606291638060.4103@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1604212314170.21846@tp.orcam.me.uk> <20160422011230.GL24051@linux-mips.org> <alpine.DEB.2.00.1604220223310.21846@tp.orcam.me.uk>
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
Cc: linux-mips@linux-mips.org
Message-ID: <20160629154657.X3Ai8P92HhOVCMTOZkXJshDdM6HzcjqXSIH2KvX1utM@z>

On Fri, 22 Apr 2016, Maciej W. Rozycki wrote:

> On Fri, 22 Apr 2016, Ralf Baechle wrote:
> 
> > Will the patch also work for 2.25 and 2.26?
> 
>  I expect it to -- it applies to both versions with a small fuzz in 
> gas/testsuite/gas/mips/mips.exp only.

 FYI, I have now backported the fix to both 2.26 and 2.25, and it'll be 
included in 2.26.1 currently being released.  No further maintenance 
release is planned for 2.25, however you can still build binutils from the 
Git tree or pick the patch and apply it on top of 2.25.1 if needed.

  Maciej

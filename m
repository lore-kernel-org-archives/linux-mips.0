Received: from mailapp01.imgtec.com ([195.59.15.196]:3887 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011628AbcBILrmZgIwg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 9 Feb 2016 12:47:42 +0100
Date: Tue, 9 Feb 2016 11:46:33 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH v3 1/3] mips: Use arch specific auxvec.h instead of
 generic-asm version
In-Reply-To: <56B98EAE.9080505@bmw-carit.de>
Message-ID: <alpine.DEB.2.00.1602091129020.15885@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1602061624460.15885@tp.orcam.me.uk> <1454946278-13859-1-git-send-email-daniel.wagner@bmw-carit.de> <1454946278-13859-2-git-send-email-daniel.wagner@bmw-carit.de> <alpine.DEB.2.00.1602081705470.15885@tp.orcam.me.uk>
 <56B98EAE.9080505@bmw-carit.de>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20160209114633.qIsjf1NulH3--pNP7VYLSzqaQvb6-bqfav59Mwhtcmg@z>

On Tue, 9 Feb 2016, Daniel Wagner wrote:

> Also I looked at the cpp output and saw that there was no uapi/asm/auxvec.h
> included instead it pulls arch/mips/include/generated/uapi/asm/auxvec.h

 Hmm, did you update your source in an old build tree and reuse it for a 
new build?  The rule to make arch/mips/include/generated/uapi/asm/auxvec.h 
was removed with commit ebb5e78cc634 ("MIPS: Initial implementation of a 
VDSO") as arch/mips/include/uapi/asm/auxvec.h was added, in the 4.4-rc1 
timeframe.  So the generated version is not supposed to be there anymore.

 Can you try `make mrproper' (stash away your .config) and see if the 
problem goes away?

  Maciej

Received: from mail.bmw-carit.de ([62.245.222.98]:59392 "EHLO
        mail.bmw-carit.de" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011118AbcBIMhuq4PPb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 9 Feb 2016 13:37:50 +0100
Subject: Re: [PATCH v3 1/3] mips: Use arch specific auxvec.h instead of
 generic-asm version
References: <alpine.DEB.2.00.1602061624460.15885@tp.orcam.me.uk>
 <1454946278-13859-1-git-send-email-daniel.wagner@bmw-carit.de>
 <1454946278-13859-2-git-send-email-daniel.wagner@bmw-carit.de>
 <alpine.DEB.2.00.1602081705470.15885@tp.orcam.me.uk>
 <56B98EAE.9080505@bmw-carit.de>
 <alpine.DEB.2.00.1602091129020.15885@tp.orcam.me.uk>
From: Daniel Wagner <daniel.wagner@bmw-carit.de>
Message-ID: <56B9DD98.7090809@bmw-carit.de>
Date: Tue, 9 Feb 2016 13:37:44 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1602091129020.15885@tp.orcam.me.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <daniel.wagner@bmw-carit.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Maciej W. Rozycki" <macro@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20160209123744.kNmuFVY5YYYMIuIo53s_oDqkz9F8Y00ozHitFL-pStQ@z>

On 02/09/2016 12:46 PM, Maciej W. Rozycki wrote:
> On Tue, 9 Feb 2016, Daniel Wagner wrote:
> 
>> Also I looked at the cpp output and saw that there was no uapi/asm/auxvec.h
>> included instead it pulls arch/mips/include/generated/uapi/asm/auxvec.h
> 
>  Hmm, did you update your source in an old build tree and reuse it for a 
> new build?  The rule to make arch/mips/include/generated/uapi/asm/auxvec.h 
> was removed with commit ebb5e78cc634 ("MIPS: Initial implementation of a 
> VDSO") as arch/mips/include/uapi/asm/auxvec.h was added, in the 4.4-rc1 
> timeframe.  So the generated version is not supposed to be there anymore.
> 
>  Can you try `make mrproper' (stash away your .config) and see if the 
> problem goes away?

Indeed, 'make mrproper' did the trick. I am sorry for the noise. Until
now I never had to use mrproper before and therefore didn't think of it.

Thanks a lot!
Daniel

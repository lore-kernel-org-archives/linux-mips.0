Received: from mail.bmw-carit.de ([62.245.222.98]:34143 "EHLO
        mail.bmw-carit.de" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010846AbcBJIvbAB8K6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 10 Feb 2016 09:51:31 +0100
Subject: Re: [PATCH v3 1/3] mips: Use arch specific auxvec.h instead of
 generic-asm version
References: <alpine.DEB.2.00.1602061624460.15885@tp.orcam.me.uk>
 <1454946278-13859-1-git-send-email-daniel.wagner@bmw-carit.de>
 <1454946278-13859-2-git-send-email-daniel.wagner@bmw-carit.de>
 <alpine.DEB.2.00.1602081705470.15885@tp.orcam.me.uk>
 <56B98EAE.9080505@bmw-carit.de>
 <alpine.DEB.2.00.1602091129020.15885@tp.orcam.me.uk>
 <56B9DD98.7090809@bmw-carit.de>
 <alpine.DEB.2.00.1602091435340.15885@tp.orcam.me.uk>
From: Daniel Wagner <daniel.wagner@bmw-carit.de>
Message-ID: <56BAFA10.3090808@bmw-carit.de>
Date: Wed, 10 Feb 2016 09:51:28 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1602091435340.15885@tp.orcam.me.uk>
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
Message-ID: <20160210085128.ivZxdNxYBLJ9rLkhEpdmPe09pkaiBCROzOqiOcAirjE@z>

On 02/09/2016 03:51 PM, Maciej W. Rozycki wrote:
> On Tue, 9 Feb 2016, Daniel Wagner wrote:
> 
>>>  Can you try `make mrproper' (stash away your .config) and see if the 
>>> problem goes away?
>>
>> Indeed, 'make mrproper' did the trick. I am sorry for the noise. Until
>> now I never had to use mrproper before and therefore didn't think of it.
> 
>  People have been being hit by stale generated files recently and I reckon 
> effort has been taken to address the issue by removing them automagically 
> somehow on rebuilds.  Until that has been complete you're advised to clean 
> your build tree after an update, or maybe rebuild speculatively and then 
> clean only if something actually breaks.

FWIW, I just found out that running mrproper before building
fuloong2e_defconfig is fixing the problem reported kbuild robot too.

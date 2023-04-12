Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21AB1C77B6E
	for <linux-mips@archiver.kernel.org>; Wed, 12 Apr 2023 15:31:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjDLPbP (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 12 Apr 2023 11:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbjDLPbO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Apr 2023 11:31:14 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7E1E19746
        for <linux-mips@vger.kernel.org>; Wed, 12 Apr 2023 08:30:47 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pmcQk-0001sa-00; Wed, 12 Apr 2023 17:30:42 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id DAE5EC2458; Wed, 12 Apr 2023 17:29:58 +0200 (CEST)
Date:   Wed, 12 Apr 2023 17:29:58 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] MIPS: Set better default CPU model and kernel code model
Message-ID: <20230412152958.GA14727@alpha.franken.de>
References: <20230408115936.6631-1-jiaxun.yang@flygoat.com>
 <20230412133113.GB11717@alpha.franken.de>
 <DD69060A-9D15-4610-8AD3-59A8CEE69D0C@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DD69060A-9D15-4610-8AD3-59A8CEE69D0C@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 12, 2023 at 03:42:21PM +0100, Jiaxun Yang wrote:
> 
> 
> > 2023年4月12日 14:31，Thomas Bogendoerfer <tsbogend@alpha.franken.de> 写道：
> > 
> > On Sat, Apr 08, 2023 at 12:59:36PM +0100, Jiaxun Yang wrote:
> >> Set default CPU model to Release 2 CPUs (MIPS64R2 if 64 bit CPU
> >> is present, otherwise MIPS32R2) to get better feature coverage
> >> on various default configs.
> >> 
> >> Also set default kernel code model to 64 bit since nowadays it
> >> doesn't make much sense to run 32 bit kernel on a 64 bit system.
> >> 
> >> Reported-by: Guenter Roeck <linux@roeck-us.net>
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> ---
> >> arch/mips/Kconfig | 3 +++
> >> 1 file changed, 3 insertions(+)
> >> 
> >> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> >> index ecc7a755fae6..1d681dd87bb0 100644
> >> --- a/arch/mips/Kconfig
> >> +++ b/arch/mips/Kconfig
> >> @@ -1260,6 +1260,8 @@ menu "CPU selection"
> >> 
> >> choice
> >> prompt "CPU type"
> >> + default CPU_MIPS64_R2 if SYS_HAS_CPU_MIPS64_R2
> >> + default CPU_MIPS32_R2 if SYS_HAS_CPU_MIPS32_R2
> >> default CPU_R4X00
> > 
> > I don't think this makes things better. For systems with multiple
> > possible CPU choices it's quite easy to get a kernel compiled for
> > the wrong ISA.
> 
> Well this is only for best allmodconfig coverage.
> 
> Or at least:
> default CPU_MIPS32_R2 if MIPS_GENERIC_KERNEL
> 
> Can make things better.

not if there is the option SYS_HAS_CPU_R4X00 for MIPS_GENERIC_KERNEL
selected. I've reverted the commit doing this, but still this is
IMHO the wrong way forward.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

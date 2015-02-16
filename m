Received: from mailapp01.imgtec.com ([195.59.15.196]:62434 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012242AbbBPIpFoZXy6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 16 Feb 2015 09:45:05 +0100
Date: Mon, 16 Feb 2015 08:44:38 +0000
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: Re: MIPS: FP32XX_HYBRID_FPRS
Message-ID: <20150216084438.GA27931@mchandras-linux.le.imgtec.org>
References: <1423933022.9418.8.camel@x220>
 <1423935239.9418.25.camel@x220>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1423935239.9418.25.camel@x220>
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Valentin Rothberg <valentinrothberg@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20150216084438.GhV6XCnoH-2GrXemXj-EMbcqmXzFmq8C449gXpO7-FE@z>

On Sat, Feb 14, 2015 at 06:33:59PM +0100, Paul Bolle wrote:
> On Sat, 2015-02-14 at 17:57 +0100, Paul Bolle wrote:
> > Your d8fb6537f1d4 ("MIPS: kernel: elf: Improve the overall ABI and FPU
> > mode checks") is included in yesterday's linux-next (ie, next-20150213).
> > I noticed because a script I use to check linux-next spotted a minor
> > problem with it.
> > 
> > That commit removed the only user of Kconfig symbol FP32XX_HYBRID_FPRS.
> > Setting FP32XX_HYBRID_FPRS is now pointless in linux-next. Is the
> > trivial commit to its entry form arch/mips/Kconfig.debug queued
>            [....] to remove its entry from [...] 
> 
> > somewhere?
> 
> 
> Paul Bolle
> 

Hi Paul,

Thanks I will fix the original patch to drop this symbol

-- 
markos

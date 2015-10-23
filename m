Received: from mailapp01.imgtec.com ([195.59.15.196]:53082 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010703AbbJWBljVoUiB (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 23 Oct 2015 03:41:39 +0200
Message-ID: <5629904A.2070400@imgtec.com>
Date: Thu, 22 Oct 2015 18:41:30 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [v3, 3/3] MIPS: VDSO: Add implementations of gettimeofday() and
 clock_gettime()
References: <1445417864-31453-1-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1445417864-31453-1-git-send-email-markos.chandras@imgtec.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Markos Chandras <markos.chandras@imgtec.com>, linux-mips@linux-mips.org
Cc: Alex Smith <alex.smith@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20151023014130.HRjgYi7x2GJbf6FbCi36tcMrlULcdDcfnOEndUGR8Jg@z>

You can not use R4K CP0_count in SMP (multicore) without core-specific 
adjustment.
After first power-saving with core clock off or core down the values in 
CP0_count
in different cores are absolutely different.

Until you include in system a patch like 
http://patchwork.linux-mips.org/patch/10871/

     "MIPS: Setup an instruction emulation in VDSO protected page 
instead of user stack"

which creates a per-thread memory and put into that memory an adjustment 
value
(which can be changed during re-schedule to another core), the use of 
R4K counter is incorrect
in SMP environment.

Note: It is also possible to setup and maintain a per-core page with 
that value too as
an alternative variant for adjustment.

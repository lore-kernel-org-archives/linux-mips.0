Received: from mailapp01.imgtec.com ([195.59.15.196]:11919 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6838513AbaHRIwfPgb2L (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 18 Aug 2014 10:52:35 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id A51E1452CFADF
        for <linux-mips@linux-mips.org>; Mon, 18 Aug 2014 09:52:26 +0100 (IST)
Date: Mon, 18 Aug 2014 09:52:27 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: Re: [PATCH 0/3] EVA/CPS fixes
Message-ID: <20140818085227.GC32372@mchandras-linux.le.imgtec.org>
References: <1405949756-10427-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1405949756-10427-1-git-send-email-markos.chandras@imgtec.com>
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
To: linux-mips@linux-mips.org
Message-ID: <20140818085227.d6IVepdjP0khE9YS4SXFV7eWuuanvqi7pCIVOsSu2a0@z>

On Mon, Jul 21, 2014 at 02:35:53PM +0100, Markos Chandras wrote:
> Hi,
> 
> This patchset contains a few small fixes required for MT cores to
> boot with CPS and EVA.
> 
> It's based on v3.16-rc6
> 
> Markos Chandras (3):
>   MIPS: EVA: Add new EVA header
>   MIPS: Malta: EVA: Rename 'eva_entry' to 'platform_eva_init'
>   MIPS: CPS: Initialize EVA before bringing up VPEs from secondary cores
> 
>  arch/mips/include/asm/eva.h                        | 43 ++++++++++++++++++++++
>  .../include/asm/mach-malta/kernel-entry-init.h     | 22 ++++++++---
>  arch/mips/kernel/cps-vec.S                         |  4 ++
>  3 files changed, 63 insertions(+), 6 deletions(-)
>  create mode 100644 arch/mips/include/asm/eva.h
> 
> -- 
> 2.0.0
> 

Hi Ralf,

ping?

-- 
markos

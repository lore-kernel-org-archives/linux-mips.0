Received: from mailapp01.imgtec.com ([195.59.15.196]:17643 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6822257AbaHRIWYNH2Lb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 18 Aug 2014 10:22:24 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id C4F57985A7337
        for <linux-mips@linux-mips.org>; Mon, 18 Aug 2014 09:22:15 +0100 (IST)
Date: Mon, 18 Aug 2014 09:22:16 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: Re: [PATCH 0/2] MIPS64/O32 seccomp fixes
Message-ID: <20140818082216.GA32372@mchandras-linux.le.imgtec.org>
References: <1406200202-10104-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1406200202-10104-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140818082216.DmfxEGzgGbRZllxkYWbPOisYR94OxOmxxzVWO4ULF0M@z>

On Thu, Jul 24, 2014 at 12:10:00PM +0100, Markos Chandras wrote:
> Hi,
> 
> A few seccomp fixes related to O32 processes on MIPS64 cores.
> 
> It's based on v3.16-rc6
> 
> Markos Chandras (2):
>   MIPS: syscall: Fix AUDIT value for O32 processes on MIPS64
>   MIPS: scall64-o32: Fix indirect syscall detection
> 
>  arch/mips/include/asm/syscall.h |  8 +++++---
>  arch/mips/kernel/scall64-o32.S  | 12 ++++++++----
>  2 files changed, 13 insertions(+), 7 deletions(-)
> 
> -- 
> 2.0.2
> 

Hi Ralf,

ping?

-- 
markos

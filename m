Received: from mailapp01.imgtec.com ([195.59.15.196]:38229 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6822257AbaHRI2jcbBiw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 18 Aug 2014 10:28:39 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id C76DC8F539ABB
        for <linux-mips@linux-mips.org>; Mon, 18 Aug 2014 09:28:30 +0100 (IST)
Date: Mon, 18 Aug 2014 09:28:31 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: Re: [PATCH] MIPS: bpf: Add new emit_long_instr macro
Message-ID: <20140818082831.GB32372@mchandras-linux.le.imgtec.org>
References: <1406106009-6520-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1406106009-6520-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140818082831.dtTmpLsCjJ0sI4gwUrQTlnQYxRvbFQwL4AnLV4ltth8@z>

On Wed, Jul 23, 2014 at 10:00:09AM +0100, Markos Chandras wrote:
> This macro uses the capitalized UASM_* macros to emit 32 or 64-bit
> instructions depending on the kernel configurations. This allows
> us to remove a few CONFIG_64BIT ifdefs from the code.
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
>  arch/mips/net/bpf_jit.c | 51 ++++++++++++++++++-------------------------------
>  1 file changed, 19 insertions(+), 32 deletions(-)
> 
Hi Ralf,

ping?

-- 
markos

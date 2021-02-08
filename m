Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0C1C433DB
	for <linux-mips@archiver.kernel.org>; Mon,  8 Feb 2021 17:05:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFA1264DAE
	for <linux-mips@archiver.kernel.org>; Mon,  8 Feb 2021 17:05:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233701AbhBHRFE (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 8 Feb 2021 12:05:04 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:47302 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234832AbhBHRDz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Feb 2021 12:03:55 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id EBC189200BC; Mon,  8 Feb 2021 18:03:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id E89559200B3;
        Mon,  8 Feb 2021 18:03:08 +0100 (CET)
Date:   Mon, 8 Feb 2021 18:03:08 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Arnd Bergmann <arnd@kernel.org>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        kernel test robot <lkp@intel.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: make kgdb depend on FPU support
In-Reply-To: <20210122110307.934543-2-arnd@kernel.org>
Message-ID: <alpine.DEB.2.21.2102081748280.35623@angie.orcam.me.uk>
References: <20210122110307.934543-1-arnd@kernel.org> <20210122110307.934543-2-arnd@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 22 Jan 2021, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> kgdb fails to build when the FPU support is disabled:
> 
> arch/mips/kernel/kgdb.c: In function 'dbg_set_reg':
> arch/mips/kernel/kgdb.c:147:35: error: 'struct thread_struct' has no member named 'fpu'
>   147 |    memcpy((void *)&current->thread.fpu.fcr31, mem,
>       |                                   ^
> arch/mips/kernel/kgdb.c:155:34: error: 'struct thread_struct' has no member named 'fpu'
>   155 |   memcpy((void *)&current->thread.fpu.fpr[fp_reg], mem,
> 
> This is only relevant for CONFIG_EXPERT=y, so disallowing it
> in Kconfig is an easier workaround than fixing it properly.

 Wrapping the relevant parts of this file into #ifdef MIPS_FP_SUPPORT 
would be as easy though and would qualify as a proper fix given that we 
have no XML description support for the MIPS target (so we need to supply 
the inexistent registers in the protocol; or maybe we can return NULL in 
`dbg_get_reg' to get them padded out in the RSP packet, I haven't checked 
if generic KGDB code supports this feature).

  Maciej

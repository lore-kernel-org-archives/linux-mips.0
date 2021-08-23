Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D10C4338F
	for <linux-mips@archiver.kernel.org>; Mon, 23 Aug 2021 12:55:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8433613B1
	for <linux-mips@archiver.kernel.org>; Mon, 23 Aug 2021 12:55:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236801AbhHWM4K (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 23 Aug 2021 08:56:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:53472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232574AbhHWM4J (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Aug 2021 08:56:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AE7F61368;
        Mon, 23 Aug 2021 12:55:22 +0000 (UTC)
Date:   Mon, 23 Aug 2021 13:55:19 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Frank Rowand <frowand.list@gmail.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        Mike Rapoport <rppt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 7/9] arm64: kdump: Remove custom linux,elfcorehdr
 handling
Message-ID: <20210823125519.GD8603@arm.com>
References: <cover.1628670468.git.geert+renesas@glider.be>
 <3b8f801f9b92066855e87f3079fafc153ab20f69.1628670468.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b8f801f9b92066855e87f3079fafc153ab20f69.1628670468.git.geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 11, 2021 at 10:51:05AM +0200, Geert Uytterhoeven wrote:
> Remove the architecture-specific code for handling the
> "linux,elfcorehdr" property under the "/chosen" node in DT, as the
> platform-agnostic handling in the FDT core code already takes care of
> this.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

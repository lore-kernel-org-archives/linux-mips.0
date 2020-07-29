Return-Path: <SRS0=P6ZB=BI=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0645C433E0
	for <linux-mips@archiver.kernel.org>; Wed, 29 Jul 2020 10:00:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C77D9206D8
	for <linux-mips@archiver.kernel.org>; Wed, 29 Jul 2020 10:00:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgG2KAU (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 29 Jul 2020 06:00:20 -0400
Received: from elvis.franken.de ([193.175.24.41]:53182 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbgG2KAU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Jul 2020 06:00:20 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k0isj-0005MI-00; Wed, 29 Jul 2020 12:00:17 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 7939AC0A9B; Wed, 29 Jul 2020 11:52:48 +0200 (CEST)
Date:   Wed, 29 Jul 2020 11:52:48 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 2/5] dt-bindings: mips: Document Loongson kvm guest board
Message-ID: <20200729095248.GA9234@alpha.franken.de>
References: <1596005919-29365-1-git-send-email-chenhc@lemote.com>
 <1596005919-29365-2-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596005919-29365-2-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 29, 2020 at 02:58:36PM +0800, Huacai Chen wrote:
> Document loongson64v-4core-virtio, a virtio based kvm guest board for
> Loongson-3.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

hmm, I can't remember adding my signed-off to this patch. Could you
give me a reference for this ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

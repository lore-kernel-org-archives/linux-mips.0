Return-Path: <SRS0=Gkct=DV=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD187C433DF
	for <linux-mips@archiver.kernel.org>; Wed, 14 Oct 2020 12:43:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83A0A20878
	for <linux-mips@archiver.kernel.org>; Wed, 14 Oct 2020 12:43:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727172AbgJNMni (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 14 Oct 2020 08:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJNMni (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Oct 2020 08:43:38 -0400
Received: from orcam.me.uk (unknown [IPv6:2001:4190:8020::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8D8FFC061755;
        Wed, 14 Oct 2020 05:43:37 -0700 (PDT)
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 6E3B82BE086;
        Wed, 14 Oct 2020 13:43:36 +0100 (BST)
Date:   Wed, 14 Oct 2020 13:43:32 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: dec: fix section mismatch
In-Reply-To: <20201006140003.10046-1-tsbogend@alpha.franken.de>
Message-ID: <alpine.LFD.2.21.2010141342140.866917@eddie.linux-mips.org>
References: <20201006140003.10046-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 6 Oct 2020, Thomas Bogendoerfer wrote:

> Drop inline for memory setup functions and mark them __init to
> fix section mismatch of pmax_setup_memory_region.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Acked-by: Maciej W. Rozycki <macro@linux-mips.org>

  Maciej

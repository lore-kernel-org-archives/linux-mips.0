Return-Path: <SRS0=wYuH=BB=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A2DC433E1
	for <linux-mips@archiver.kernel.org>; Wed, 22 Jul 2020 10:05:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4A07206D7
	for <linux-mips@archiver.kernel.org>; Wed, 22 Jul 2020 10:05:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgGVKFm (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 22 Jul 2020 06:05:42 -0400
Received: from elvis.franken.de ([193.175.24.41]:45257 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726153AbgGVKFm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Jul 2020 06:05:42 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jyBd6-0000tT-00; Wed, 22 Jul 2020 12:05:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3C902C0878; Wed, 22 Jul 2020 11:36:03 +0200 (CEST)
Date:   Wed, 22 Jul 2020 11:36:03 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lichao Liu <liulichao@loongson.cn>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: Grant pte read permission, even if vma only have
 VM_WRITE permission.
Message-ID: <20200722093603.GA10090@alpha.franken.de>
References: <20200717095536.45011-1-liulichao@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717095536.45011-1-liulichao@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 17, 2020 at 05:55:36PM +0800, Lichao Liu wrote:
> If a page can be written, then it can definitely be read.

IMHO it's exactly the point of RIXI enabled CPUs to support a
writeonly mapping even if most of other archs aren't able to
support it. So if there is no real good reason to change this,
I'm going to leave it this way.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

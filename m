Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B52BC433E0
	for <linux-mips@archiver.kernel.org>; Wed,  3 Feb 2021 12:35:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2C6C64F87
	for <linux-mips@archiver.kernel.org>; Wed,  3 Feb 2021 12:35:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234161AbhBCMfT (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 3 Feb 2021 07:35:19 -0500
Received: from elvis.franken.de ([193.175.24.41]:49652 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234220AbhBCMfR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Feb 2021 07:35:17 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l7HMi-0006rA-00
        for linux-mips@vger.kernel.org; Wed, 03 Feb 2021 13:34:36 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F0449C0D4A; Wed,  3 Feb 2021 13:34:25 +0100 (CET)
Date:   Wed, 3 Feb 2021 13:34:25 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org
Subject: KVM Guest
Message-ID: <20210203123425.GA9574@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Does kvm guest kernel still work ? I'm playing with current mips-next
and starting a kvm guest kernel inside an emulated malta system also
running a mips-next kernel. The kvm guest kernel starts, but hangs
in calibrate_delay (at least that's what info registers in qemu monitor
suggests). Ayn ideas ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

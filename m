Return-Path: <SRS0=FAjd=7L=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D17C433DF
	for <linux-mips@archiver.kernel.org>; Fri, 29 May 2020 17:10:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22AE020707
	for <linux-mips@archiver.kernel.org>; Fri, 29 May 2020 17:10:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b="e/APdZCe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbgE2RKc (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 29 May 2020 13:10:32 -0400
Received: from [115.28.160.31] ([115.28.160.31]:54470 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1725821AbgE2RKc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 May 2020 13:10:32 -0400
Received: from localhost.localdomain (unknown [116.236.177.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 6308B600B5;
        Sat, 30 May 2020 01:10:27 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1590772227; bh=ws7rbod/BuGxMR0lY8uPxlvbp/b4yKJo3tXnGlGADFg=;
        h=From:To:Cc:Subject:Date:From;
        b=e/APdZCe84Z0FKR1201Z0QWxQOp8eWbJBXX0GjFuIT3ITDdAa3tOHGrt50obybTh6
         ZevVvGNyjsjskYRGpC67XoWlP/yueOyzHqNcWXTcR5SVqQBP5kL4l2OPS7lV/W9BtU
         7TuznpfMs/VB+hw8o0mANo33Pa3WPl+poDs+gXTA=
From:   WANG Xuerui <git@xen0n.name>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org
Subject: [PATCH 0/2] CPUCFG emulation future-proofing & HWCAP addition
Date:   Sat, 30 May 2020 01:09:58 +0800
Message-Id: <20200529171000.8905-1-git@xen0n.name>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch series future-proofs the CPUCFG emulation, in light of
possibility of new Loongson cores still lacking native CPUCFG.
Also an HWCAP flag bit is allocated and exposed for userspace's probing
convenience, per the earlier plan shared on the mailing list.

WANG Xuerui (2):
  MIPS: Loongson64: Guard against future cores without CPUCFG
  MIPS: Expose Loongson CPUCFG availability via HWCAP

 .../include/asm/mach-loongson64/cpucfg-emul.h | 11 +++++
 arch/mips/include/uapi/asm/hwcap.h            |  1 +
 arch/mips/kernel/traps.c                      |  4 ++
 arch/mips/loongson64/cpucfg-emul.c            | 46 +++++++++++--------
 4 files changed, 44 insertions(+), 18 deletions(-)

-- 
2.26.2


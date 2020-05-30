Return-Path: <SRS0=YAo+=7M=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4129BC433DF
	for <linux-mips@archiver.kernel.org>; Sat, 30 May 2020 07:33:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E3FC20776
	for <linux-mips@archiver.kernel.org>; Sat, 30 May 2020 07:33:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b="IwQub/H7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728835AbgE3HdI (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 30 May 2020 03:33:08 -0400
Received: from [115.28.160.31] ([115.28.160.31]:33942 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726843AbgE3HdI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 30 May 2020 03:33:08 -0400
Received: from localhost.localdomain (unknown [116.236.177.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B65F7600B5;
        Sat, 30 May 2020 15:32:59 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1590823979; bh=gMBmnk5EuC5nnQSGsjVYaM8IWg/GwZp7Cr0D8+/hDIg=;
        h=From:To:Cc:Subject:Date:From;
        b=IwQub/H708xHkcBVhZXC+Ewz7BzG0d23WGxUzX79mixIfdM5/rX6bULQLJVW0lrRU
         RlrwFfhXDBvPepyh4bJJYC8/ssF9yAGEQV4eGkzjL6+Pjhzh19IOGeBeRKsGZStijs
         vDaiS8J/zZ7Rk+cSViOOx7Xab4d7fbJSVfqRGDeY=
From:   WANG Xuerui <git@xen0n.name>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org
Subject: [PATCH v2 0/3] CPUCFG emulation future-proofing & HWCAP addition
Date:   Sat, 30 May 2020 15:32:40 +0800
Message-Id: <20200530073243.16411-1-git@xen0n.name>
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

Tested on Loongson-3A3000 and Loongson-3A4000. Compile-tested with
64r2_defconfig.

v2:
- unconditionally bump PERF_COUNT_SW_EMULATION_FAULTS even on
  unsupported core models
- reordered model match arms per Huacai's review
- tweaked commit message of 2nd patch

WANG Xuerui (3):
  MIPS: Loongson64: Guard against future cores without CPUCFG
  MIPS: Expose Loongson CPUCFG availability via HWCAP
  MIPS: Loongson64: Reorder CPUCFG model match arms

 .../include/asm/mach-loongson64/cpucfg-emul.h | 11 +++
 arch/mips/include/uapi/asm/hwcap.h            |  1 +
 arch/mips/kernel/traps.c                      |  4 ++
 arch/mips/loongson64/cpucfg-emul.c            | 70 +++++++++++--------
 4 files changed, 56 insertions(+), 30 deletions(-)

-- 
2.26.2


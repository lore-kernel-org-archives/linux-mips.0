Return-Path: <SRS0=VPWm=6R=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EE1C28CBC
	for <linux-mips@archiver.kernel.org>; Sun,  3 May 2020 10:34:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A23F20787
	for <linux-mips@archiver.kernel.org>; Sun,  3 May 2020 10:34:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b="kW+Qmujt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgECKet (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 3 May 2020 06:34:49 -0400
Received: from [115.28.160.31] ([115.28.160.31]:57414 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1727125AbgECKet (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 3 May 2020 06:34:49 -0400
Received: from localhost.localdomain (unknown [116.236.177.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 0A5AA600B4;
        Sun,  3 May 2020 18:34:47 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1588502087; bh=W9kJg9Az9zGJsq0LqS2+ktHIeB+gujBf8ikdj8MKs1k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kW+QmujtxJL9fjsSkgDFFDuMgcfI55Yy/5lmzqr7qwNeBtiSwS211Oul0nVIfmXau
         Eikf89rKkakz4rwDM+wSyhr7KM/PoOsVgSfyVEIFKFv42dS6E+qUmhiWcljKvfqcwK
         AYpAP7D+z/wycGQwPb2lIczTvjPTTnz8IWhKpZzE=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-mips@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>
Subject: [PATCH v2 0/4] CPUCFG emulation on older Loongson64 cores
Date:   Sun,  3 May 2020 18:33:01 +0800
Message-Id: <20200503103304.40678-1-git@xen0n.name>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200502133846.40590-1-git@xen0n.name>
References: <20200502133846.40590-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch series brings the CPUCFG instruction to older Loongson64
cores, enabling a unified way to query processor characteristics on
Loongson64 systems. A detailed explanation may be found in the last
commit.

One unresolved point is how to best introduce machtype-specific bits
into the generic MIPS code, namely the cpu probing and trap handler
parts. I have been struggling over whether to lift this logic into
arch/mips/kernel, but the instruction's encoding (reusing LWC2 opcode)
might be too invasive to be useful to other MIPS platforms. What do
people think is the best way forward?

v2:

- Fixed one more typo in loongson_regs.h
- Merged simulate_loongson3_csr and simulate_loongson3_csr_cpucfg into
  one (simulate_loongson3_cpucfg), per Huacai's suggestion

WANG Xuerui (4):
  MIPS: Loongson64: fix typos in loongson_regs.h
  MIPS: Loongson64: define offsets and known revisions for some CPUCFG
    features
  MIPS: define more Loongson CP0.Config6 and CP0.Diag feature bits
  MIPS: emulate CPUCFG instruction on older Loongson64 cores

 arch/mips/Kconfig                             |  11 ++
 arch/mips/include/asm/cpu-info.h              |   9 ++
 .../include/asm/mach-loongson64/cpucfg-emul.h |  67 +++++++++
 .../asm/mach-loongson64/loongson_regs.h       |  29 +++-
 arch/mips/include/asm/mipsregs.h              |   6 +
 arch/mips/kernel/cpu-probe.c                  | 129 ++++++++++++++++++
 arch/mips/kernel/traps.c                      |  45 ++++++
 arch/mips/loongson64/Makefile                 |   1 +
 arch/mips/loongson64/cpucfg-emul.c            |  80 +++++++++++
 9 files changed, 372 insertions(+), 5 deletions(-)
 create mode 100644 arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
 create mode 100644 arch/mips/loongson64/cpucfg-emul.c

-- 
2.21.0


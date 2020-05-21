Return-Path: <SRS0=kTqc=7D=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F43C433E2
	for <linux-mips@archiver.kernel.org>; Thu, 21 May 2020 18:14:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EBAF20823
	for <linux-mips@archiver.kernel.org>; Thu, 21 May 2020 18:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b="PVIGXGvF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgEUSOh (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 21 May 2020 14:14:37 -0400
Received: from [115.28.160.31] ([115.28.160.31]:37448 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1728067AbgEUSOh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 May 2020 14:14:37 -0400
Received: from localhost.localdomain (unknown [116.236.177.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id CB0896006D;
        Fri, 22 May 2020 02:14:33 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1590084873; bh=lRsIlE1mL0osSVCwq3+/+fWYi40tIaRi/wt3u6dOZMo=;
        h=From:To:Cc:Subject:Date:From;
        b=PVIGXGvF9WRsAHjrTikYYu+H1bluNPqJcNUU2LnjgKxvFHdM8c1o4yL5Wtu82OnWw
         7z/x4I41U8byYG//cJGUhH7rFrz5t45dhlHWbCariinPn2UjdgbO+Yenkh+Y6bxGrE
         mBjCXVdRos/ZgFgm71JSBXW3C5vVt9A8sl995NGc=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-mips@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>
Subject: [PATCH v3 0/1] CPUCFG emulation on older Loongson64 cores
Date:   Fri, 22 May 2020 02:14:02 +0800
Message-Id: <20200521181403.6078-1-git@xen0n.name>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch brings the CPUCFG instruction to older Loongson64 cores,
enabling a unified way to query processor characteristics on Loongson64
systems. Previous question of how to best integrate machtype-specific
and machtype-agnostic cpu probe logic is resolved. (thanks Thomas for
reviewing!)

Tested on Loongson-3A3000.

Also, to aid userspace in determining CPUCFG availability without having
to handle SIGILL or parse /proc/cpuinfo, a new HWCAP flag is to be added
in a later patch. I am waiting for consensus before implementing this,
as it would be part of userspace ABI.

v3:
- Fixed build on !CONFIG_MACH_LOONGSON64
- Refactored to minimize intrusion to machtype-agnostic cpu probe logic
- Minor tweaks to comment and Kconfig wording
- Dropped Reviewed-by and Tested-by from Jiaxun as the code is
  refactored significantly

v2:
- Fixed one more typo in loongson_regs.h
- Merged simulate_loongson3_csr and simulate_loongson3_csr_cpucfg into
  one (simulate_loongson3_cpucfg), per Huacai's suggestion

WANG Xuerui (1):
  MIPS: emulate CPUCFG instruction on older Loongson64 cores

 arch/mips/Kconfig                             |  12 +
 arch/mips/include/asm/cpu-info.h              |   9 +
 .../include/asm/mach-loongson64/cpucfg-emul.h |  65 ++++++
 arch/mips/kernel/cpu-probe.c                  |   9 +
 arch/mips/kernel/traps.c                      |  45 ++++
 arch/mips/loongson64/Makefile                 |   1 +
 arch/mips/loongson64/cpucfg-emul.c            | 217 ++++++++++++++++++
 7 files changed, 358 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
 create mode 100644 arch/mips/loongson64/cpucfg-emul.c

-- 
2.21.0


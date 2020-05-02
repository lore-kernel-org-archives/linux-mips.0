Return-Path: <SRS0=5aZV=6Q=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FE4C47259
	for <linux-mips@archiver.kernel.org>; Sat,  2 May 2020 13:46:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58B252495B
	for <linux-mips@archiver.kernel.org>; Sat,  2 May 2020 13:46:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b="Wt8APCGR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728038AbgEBNqh (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 2 May 2020 09:46:37 -0400
Received: from [115.28.160.31] ([115.28.160.31]:46294 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1727921AbgEBNqg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 2 May 2020 09:46:36 -0400
X-Greylist: delayed 422 seconds by postgrey-1.27 at vger.kernel.org; Sat, 02 May 2020 09:46:34 EDT
Received: from localhost.localdomain (unknown [116.236.177.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 45B5160116;
        Sat,  2 May 2020 21:39:26 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1588426766; bh=P/n1c6JWhEf22XFhND6QqhfwwtBTQs37y5I0h1cKLUM=;
        h=From:To:Cc:Subject:Date:From;
        b=Wt8APCGRuZ0Ckfp3csDAPZR/QLXsGeqiTNGBljoayzoXcJjo4C4vL0LnTPGZuTdo7
         sfCYhSL78mX9xx6bL9o+PKmZRPdV4wVMEgaX2lZ44XpqZ8Jkr3Dp/q9ihdnJcjGn7f
         72IShiagIW+rv3sJuU04KnOnW+CqfyKhpglUZ2FQ=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-mips@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>
Subject: [PATCH 0/4] CPUCFG emulation on older Loongson64 cores
Date:   Sat,  2 May 2020 21:38:42 +0800
Message-Id: <20200502133846.40590-1-git@xen0n.name>
X-Mailer: git-send-email 2.21.0
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

WANG Xuerui (4):
  MIPS: Loongson64: fix typos in loongson_regs.h
  MIPS: Loongson64: define offsets and known revisions for some CPUCFG
    features
  MIPS: define more Loongson CP0.Config6 and CP0.Diag feature bits
  MIPS: emulate CPUCFG instruction on older Loongson64 cores

 arch/mips/Kconfig                             |  11 ++
 arch/mips/include/asm/cpu-info.h              |   9 ++
 .../include/asm/mach-loongson64/cpucfg-emul.h |  67 +++++++++
 .../asm/mach-loongson64/loongson_regs.h       |  27 +++-
 arch/mips/include/asm/mipsregs.h              |   6 +
 arch/mips/kernel/cpu-probe.c                  | 129 ++++++++++++++++++
 arch/mips/kernel/traps.c                      |  57 ++++++++
 arch/mips/loongson64/Makefile                 |   1 +
 arch/mips/loongson64/cpucfg-emul.c            |  80 +++++++++++
 9 files changed, 383 insertions(+), 4 deletions(-)
 create mode 100644 arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
 create mode 100644 arch/mips/loongson64/cpucfg-emul.c

-- 
2.21.0


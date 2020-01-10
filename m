Return-Path: <SRS0=8Ksz=27=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2C8C33CA3
	for <linux-mips@archiver.kernel.org>; Fri, 10 Jan 2020 22:06:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D9B220842
	for <linux-mips@archiver.kernel.org>; Fri, 10 Jan 2020 22:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578694019;
	bh=IeJ6EBQprC0bGfzJZS49TcDe89b6mYMbG0kfwUyY/q4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=uxDmrZUYmu+05Bq6Vl2t3h6mByVVX4oNLpWx1eza3Ci1XF2BpZgAwp8dVjoQnnrM0
	 G+Ia7/bb/qDZRAH6RTBsMArGbiadNF7ywnaNPjO8SLgRe25trCnZFDwMNgkR7N6ezc
	 DpFxxmDXnn1c6xPz5M1xGcJbZI9h0QgKY+EYigj0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbgAJWG4 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 10 Jan 2020 17:06:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:53194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727460AbgAJWGY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 10 Jan 2020 17:06:24 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BA9720842;
        Fri, 10 Jan 2020 22:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578693984;
        bh=IeJ6EBQprC0bGfzJZS49TcDe89b6mYMbG0kfwUyY/q4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FGbr9i9YmSbglq/BfsbBD5U2Bs9aZOjoIBS+Om/Nuqrv+HitITmIWN/WHGXZWADyj
         eGj28Y08WaJgflGIe+DEOcnxsbDYsgOtpK1A6FrOO70m7vO+6/FK38SE47es1D4jlp
         MZZm4g6PzFxjk7XDdqpcyKQkbVy6sB/+dmjEyERs=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jouni Hogander <jouni.hogander@unikie.com>,
        Paul Burton <paulburton@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-mips@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 2/8] MIPS: Prevent link failure with kcov instrumentation
Date:   Fri, 10 Jan 2020 17:06:15 -0500
Message-Id: <20200110220621.28651-2-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200110220621.28651-1-sashal@kernel.org>
References: <20200110220621.28651-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Jouni Hogander <jouni.hogander@unikie.com>

[ Upstream commit a4a3893114a41e365274d5fab5d9ff5acc235ff0 ]

__sanitizer_cov_trace_pc() is not linked in and causing link
failure if KCOV_INSTRUMENT is enabled. Fix this by disabling
instrumentation for compressed image.

Signed-off-by: Jouni Hogander <jouni.hogander@unikie.com>
Signed-off-by: Paul Burton <paulburton@kernel.org>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/boot/compressed/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index 331b9e0a8072..baa34e4deb78 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -29,6 +29,9 @@ KBUILD_AFLAGS := $(KBUILD_AFLAGS) -D__ASSEMBLY__ \
 	-DBOOT_HEAP_SIZE=$(BOOT_HEAP_SIZE) \
 	-DKERNEL_ENTRY=$(VMLINUX_ENTRY_ADDRESS)
 
+# Prevents link failures: __sanitizer_cov_trace_pc() is not linked in.
+KCOV_INSTRUMENT		:= n
+
 # decompressor objects (linked with vmlinuz)
 vmlinuzobjs-y := $(obj)/head.o $(obj)/decompress.o $(obj)/string.o
 
-- 
2.20.1


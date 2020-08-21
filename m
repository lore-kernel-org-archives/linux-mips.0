Return-Path: <SRS0=HWEQ=B7=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F504C433E1
	for <linux-mips@archiver.kernel.org>; Fri, 21 Aug 2020 03:13:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9ABA20855
	for <linux-mips@archiver.kernel.org>; Fri, 21 Aug 2020 03:13:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20150623.gappssmtp.com header.i=@hev-cc.20150623.gappssmtp.com header.b="FHpiV2qP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgHUDNR (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 20 Aug 2020 23:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbgHUDNM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Aug 2020 23:13:12 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CAFC061385
        for <linux-mips@vger.kernel.org>; Thu, 20 Aug 2020 20:13:12 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u20so385661pfn.0
        for <linux-mips@vger.kernel.org>; Thu, 20 Aug 2020 20:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iUqNnU2e55K8U1YU0/E+0wSGyBKU4p5Mam5E6qW6Wk0=;
        b=FHpiV2qPjmiT/ZCC2vMUlCsp88fnyRC+cDsxZqNI64tfAjVCLHEzqWnYqDL2D9RNlF
         N06vEkG2N+6U7QpQIlk5P92D5mq2T5M3oRu/dIcO3AVx55Y0BCUAokV8I0XT1WxT9f3J
         ZqrutPCgxEacOSYhaESHsTZPgOzd6lhNjEbVes59Pemx2gMWn1z+N/ewgFG3UPNYZkkH
         wmZtL7XGaHmSPljU1rVCuXFfGiMKifov1kdptcYuCpLGnXaF/Hy+vvvI7lMd9z6t0iGl
         jO/FX7+WTzQ6sfAGloavLUZG2UYTVotLy3LAZ9HIrAqxkgjuNnRkob+b8i1oHDCpVREb
         DZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iUqNnU2e55K8U1YU0/E+0wSGyBKU4p5Mam5E6qW6Wk0=;
        b=lndawmv6jYECElnPrk6NfPqYb84L3def9+s1EOiBr1IKB8wgzxMKheuwfoTEydHogL
         kBeEtg3F4NpWrgQgpoFuvH1yhITj6VNqdtM54wXhWTphZg4gPGRBJMpmF0ZQcBomixm+
         Rn+yLE3EnhsmcFllgEuQMuAnvjIPjzM2SXuc4olMlrrixiU9Jg70YJgzGj3tIkGs5ido
         3mvE4PVrGLP0EsbquPj9X+tAD0yCOOrpB2K+Hb/4YLYkfgzHrT8+ZEZn+ugft6O5dvTJ
         JZ3Q0EmmjWVUOM90QDyKb6/PYVDNRd7Rs6WKWBpFU/gutFfDgAoB9TmxacgwHbHyxgB5
         1YiQ==
X-Gm-Message-State: AOAM531n8EeoMgGouYzAkbYc9y00yVeUfzYjHi/n+zXWA9O/xlLpjm45
        Yb6Qby4Vms/s25LBt9FguNMqgx4mEFrxJWTawso=
X-Google-Smtp-Source: ABdhPJxqFe4+0iqC0fHM3Ul4+deNIr1mlEIsIGSErQceM6xSlYgtqV46it4l7QuNEh40ZI8m87RzPw==
X-Received: by 2002:a62:6847:: with SMTP id d68mr850991pfc.110.1597979591460;
        Thu, 20 Aug 2020 20:13:11 -0700 (PDT)
Received: from localhost.localdomain (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id s18sm443490pgj.3.2020.08.20.20.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 20:13:10 -0700 (PDT)
From:   Heiher <r@hev.cc>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        "Maciej W . Rozycki" <macro@linux-mips.org>, Heiher <r@hev.cc>
Subject: [PATCH] MIPS: Optional SYNC emulation
Date:   Fri, 21 Aug 2020 11:12:28 +0800
Message-Id: <20200821031228.31231-1-r@hev.cc>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

MIPS ISA defines several types of memory barrier, of which Type-0 (full barrier)
is required, and the others are optional. In some vendor implementation (such as
Loongson), all optional parts are implemented to emit an illegal instruction
exception. Here, emulate to full barrier to ensure the functional semantics.

If an implementation does not support SYNC 0, it should also not support SMP, so
the `smp_mb()` is only a compilation barrier.

Signed-off-by: Heiher <r@hev.cc>
---
 arch/mips/kernel/traps.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 38aa07ccdbcc..d63e8671e9d2 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -501,6 +501,7 @@ asmlinkage void do_be(struct pt_regs *regs)
 #define RD     0x0000f800
 #define FUNC   0x0000003f
 #define SYNC   0x0000000f
+#define STYPE  0x000007c0
 #define RDHWR  0x0000003b
 
 /*  microMIPS definitions   */
@@ -688,6 +689,8 @@ static int simulate_rdhwr_mm(struct pt_regs *regs, unsigned int opcode)
 static int simulate_sync(struct pt_regs *regs, unsigned int opcode)
 {
 	if ((opcode & OPCODE) == SPEC0 && (opcode & FUNC) == SYNC) {
+		if ((opcode & STYPE) != 0)
+			smp_mb();
 		perf_sw_event(PERF_COUNT_SW_EMULATION_FAULTS,
 				1, regs, 0);
 		return 0;
-- 
2.28.0


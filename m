Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5583368A4
	for <linux-mips@vger.kernel.org>; Fri, 18 Sep 2026 02:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700290; cv=none; b=SyjME+eilrdzMuzDypc49jqmawf9BsNivp7dnD7nCS5Atfkb2ohxxc8tSZphpJ2S8FVUUGOSCU4RHr8hCAbi8u2DJYpBanECBoI96ndpKFpkAu/sakJHDzL9t5tIA6GY3As2kGSR0xEhpYAhk8X7caKsr/WMIpvY4XYVQTASHA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700290; c=relaxed/simple;
	bh=KDOmclcli+FIMhiT/H8F2ExL9E5Qi0X8SZDXkzOjbp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dyRRrsF2XG4aTX7A2DoihVIi4RzFZwhEMcE+ShIlfOh9/f/qocloa6F873QXggWzMv1Tj07wYbBDYwsXjpuCOtZtHyc3PE/lmxilpyaANA6WbmBlofJ0WdPAA7acURW/JX1vybCBRiR6kMqgSqvObKh7b9Y1RAKep3eMebEKqlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKwHYEBH; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKwHYEBH"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-39e249c766bso111650a91.0
        for <linux-mips@vger.kernel.org>; Thu, 17 Sep 2026 19:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700282; x=1790305082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8kSB2cuIIxJwGu7fdUThqgSHJbDb70xS3kiq9uD6ddk=;
        b=pKwHYEBHhZiCevsSptRykxp615AkqURbT3T+5PvdX6rdMJQRtaJl+UGMiVQ0tQb7oa
         0n4fa+mcGwV/6gR3FmiaULE0uHFVro7AKZzXHy7kNmNAtspr0wconrA1cmuBP7xabyF+
         QnpGlpVeSMVzi2v8+uOyY2huxTJ+WKMmummvsV6QzlddY7Sat4NLxTKeTH+wLyDQWkf6
         8UZsVIWH5eeg+MG9dI4Wi5FITiO83B2KqKnAUh17GFez+6kZkHs0R4Y994A+GSDAHHTK
         iQGNgnJS00Lf+eUqERqMiYnUuymVtnvRQ40xnck7RXhhnN6ctRSysb6/jh9BIjGYgTuf
         dI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700282; x=1790305082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8kSB2cuIIxJwGu7fdUThqgSHJbDb70xS3kiq9uD6ddk=;
        b=Gzfhxgz9PIdmfImXvCHWn4MVzu7o0fXHFVGOQ+LXkE9QTZIpiBiBTauho5986R6FrW
         3g57i+qdtdT44rf6FvbsKIw2PjGObCSnXPBpDaR+TGNkK9afCyx92OWizBOR9SPKE13g
         5lCTsv6AFlIfmQGI9UOho6dql004oldOFA05Eff4W5gaDwWbqoeb0zx+/u16n7n8m2cq
         r9fBxJRmn7zWgeUvvlV6XpuSyU3WmwtCaqjKfJFIPAkCcR0Nn73VzFXeARBHY6OSE04o
         mE9CYQGPToauonGPAzq2G2qbBeZSgi0H5ssD4ylM5AvcU/26NBAdIz/eFhd6ppNZ/69q
         oL/g==
X-Gm-Message-State: AFuF++kG10PsRf+MjtzzwyMDYMGP+L7frKeZXZRkIlZqHjOx3gvX/yO1
	eK7wLIfuIKlunRC5xEfBpbtMBCwNnTUHKZC6Trh95tb58JAj/lCXY2XgbQXCdr7ITUs=
X-Gm-Gg: AYBFou1AvBT3CAR9VAjNqKHClzsUx5GwuHO0nAJAxEifnzP7VC4dziX+iqzNtPxzT05
	xYwQbNbtrsLzeL9S7aKRlgGlIxY5GZMQ1EOzLMrdLqNp6QBUIQxbPYdp5Ycysl2dpv8+N8J/Goc
	aHxzsCHgsbGEsqnZOT/cnX0XXPi5ZPqFAKCJFQ0V8Hryk0PbgeQgUqWAlEHPiOWJGIYbjZoRB3l
	9I35gojc0ikpfdMSjyuyrwb6HHcSt3M1CimoPguO+takT0youHNz8dQtsZv8vNEctplY0E/lryo
	w4tiVonGDbVftMxSdFwjlIP08WOPWHijNC04qMejcx7itx2lvPwsP4QjlCVX/Hvv1Qf5wcTipZB
	8pGFgZZ1MU+Ldin70Mq50YFTKtDFdn9yEqC1L4VubZAt1crDxC2AUiejLPQ4+uJxhh7pcpcckjV
	06h22/fRTh0c5c3XxlJn4nrMdj+wzbWFZe09+P6U6o0x41IyP27rMKXS8EgSccd6lx1p7a5ESeP
	7s0eU1s/Q0hEFHkT9uC02Dt6XK8fN2at/zh1OjEYwUUPWsPZENpYjQA0rNF/pUz7p8mQOzdWDkz
	5kMgmIwg10Z3O12X6o2WoAUph5fWBoYTEjyjZFmbhy4TyB1Ee/G4c/zkK9ZSZ2sAvQ==
X-Received: by 2002:a17:90a:1188:b0:39e:5b3c:4633 with SMTP id 98e67ed59e1d1-39e5b3c4de4mr344901a91.21.1789700281948;
        Thu, 17 Sep 2026 19:58:01 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c286d98c6sm412282eec.5.2026.09.17.19.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:58:01 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH] MIPS: remove unused <asm/amon.h> header
Date: Thu, 17 Sep 2026 19:57:51 -0700
Message-ID: <20260918025757.389718-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The last use of arch/mips/include/asm/amon.h was removed in
commit 7fb6f7b0af67 ("MIPS: Remove deprecated CONFIG_MIPS_CMP"),
but it was left behind. Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/mips/include/asm/amon.h | 12 ------------
 1 file changed, 12 deletions(-)
 delete mode 100644 arch/mips/include/asm/amon.h

diff --git a/arch/mips/include/asm/amon.h b/arch/mips/include/asm/amon.h
deleted file mode 100644
index 3cc03c64a9c7..000000000000
--- a/arch/mips/include/asm/amon.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2013 Imagination Technologies Ltd.
- *
- * Arbitrary Monitor Support (AMON)
- */
-int amon_cpu_avail(int cpu);
-int amon_cpu_start(int cpu, unsigned long pc, unsigned long sp,
-		   unsigned long gp, unsigned long a0);
-- 
2.43.0


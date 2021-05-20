Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517B4C433ED
	for <linux-mips@archiver.kernel.org>; Thu, 20 May 2021 13:48:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DA0261057
	for <linux-mips@archiver.kernel.org>; Thu, 20 May 2021 13:48:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233298AbhETNtm (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 20 May 2021 09:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232412AbhETNtm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 May 2021 09:49:42 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C91C061574;
        Thu, 20 May 2021 06:48:20 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id e15so2441157plh.1;
        Thu, 20 May 2021 06:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uaQphQqIy8iAUW0DAv32A4yBEG37F4G/mNVlzt/Q+ME=;
        b=HRyhkFUmiSLZKeZWFF3Dvzlj5g1okiPe87ymdtYmd8U5fk0hoWu8uyvzuonLEDFUe6
         Q4cmcEwDcH6aRO/a/1BB4hSDMUDefJgy0MY4pIMuxvuaP38O+mdT7Vbv02of2sjIixFx
         RWabRb+N+SBhfWiCVU2VWPs4teO9NFb2uOv07C38SXQ98ryHr4bP3C/xL0+7a8aiIil+
         6kt2VtT0E8fTQWqTBbmp9U/eS0dkwM+YRRVD08/rjUp4C/4gnRwywtR2UtdPvvykIZFC
         RqugG2Y/6OEE8ATbUs52DDJszRmgvBjZ/yyTPQj58p9TLvc8dn7s+60MHP8q0lbAbOZK
         0jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uaQphQqIy8iAUW0DAv32A4yBEG37F4G/mNVlzt/Q+ME=;
        b=OuJGb84gACP13BPXEMk/Vj5kYxxliHK9ElbU7wgw6TN6rFCctADHozh9QXdsFn7M35
         +N9om6ydaqnuTmew0JSnjTYXW1qn2BnA5k3vr+I/+8efIREHPekuBP/b84yVAicHWXcl
         hbB087QW6b+JxJKgbyvjmztk2ge+lDTTydTu0gD4Ta7O0+//kOi624qV3iSjYVA7Ybvl
         9Y7Q2f1xDokbfrQu887wv3cK8CGti0kjA4fI3ayx4RkWOGCyq/JcY/sbz8kzffB6sRB9
         +VsTX0e7nB5XKscTm1Hz3JMW8q2sNH8LUkcrWDhvb6QtmVkLO9xuNIqpizTWeZXzSoIQ
         FiRw==
X-Gm-Message-State: AOAM531OB9y9bbdqVXdYceWwhyapuW+RtiBI9iPIE+2KI9qOyUPHHejx
        fPGrbOuHue9zGBr1GaaK3tnyDKCLPI+R/Q==
X-Google-Smtp-Source: ABdhPJwEcBL5Cs0/MDEIhsfJxHQzbcHFh9+N4ADM0mun9mIH3esx0GWBR5zjbnNVhbYZfoKM8Xf4Qw==
X-Received: by 2002:a17:902:bc88:b029:ee:7ef1:e770 with SMTP id bb8-20020a170902bc88b02900ee7ef1e770mr6017321plb.19.1621518499626;
        Thu, 20 May 2021 06:48:19 -0700 (PDT)
Received: from kelvin-System-Product-Name.lan ([117.173.226.141])
        by smtp.gmail.com with ESMTPSA id t14sm1954025pfg.168.2021.05.20.06.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 06:48:19 -0700 (PDT)
From:   Keguang Zhang <keguang.zhang@gmail.com>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Keguang Zhang <keguang.zhang@unisoc.com>
Subject: [PATCH 0/3] MIPS: Loongson1B: Add dmaengine and NAND device
Date:   Thu, 20 May 2021 21:48:06 +0800
Message-Id: <20210520134809.27143-1-keguang.zhang@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Keguang Zhang <keguang.zhang@unisoc.com>

This patchset is to add dmaengine and NAND device
for Loongson1B.

This applies on top of mips-next.

Keguang Zhang (3):
  MIPS: Loongson1B: Add dma_slave_map to DMA platform data
  MIPS: Loongson1B: Add Loongson1 dmaengine device
  MIPS: Loongson1B: Add Loongson1 NAND device

 arch/mips/include/asm/mach-loongson32/dma.h   |  7 ++-
 arch/mips/include/asm/mach-loongson32/nand.h  |  4 --
 .../include/asm/mach-loongson32/platform.h    |  4 ++
 arch/mips/loongson32/common/platform.c        | 63 +++++++++++++++++++
 arch/mips/loongson32/ls1b/board.c             | 37 ++++++++++-
 5 files changed, 107 insertions(+), 8 deletions(-)


base-commit: 33ae8f801ad8bec48e886d368739feb2816478f2
-- 
2.25.1


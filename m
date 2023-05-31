Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5757FC7EE37
	for <linux-mips@archiver.kernel.org>; Wed, 31 May 2023 13:51:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236948AbjEaNvH (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 31 May 2023 09:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237235AbjEaNuC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 31 May 2023 09:50:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 824A52D53;
        Wed, 31 May 2023 06:45:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 86FDB63B9B;
        Wed, 31 May 2023 13:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B2BC433EF;
        Wed, 31 May 2023 13:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685540724;
        bh=jYxGqY2y2pVcge/6luDkL1kCABiWqjvlWIT8jXjRbnM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X8K+OlwBUltAe8ahNM2WE9hzHB5iqnVYtX1v1FgZFSev0NrtNVHVAmvc79ubUc7rS
         K53TeL6hbNtdtVYcHjznT3ce3pkO8NkE2bxlNo8fqJjWTdlJTrD0435ALOv9ovtUz2
         p9xt745P1t4ixhCItNgWp8SbE+LgQQig9OYvWvcuJYeIR67oCqSlHTV/RAVfYw1huc
         hRv6m+SI7ySLwAcZFk+tir9C9KWsrZ1zRhYK1wuy+qyAUY10pu7KS80Oo0qSWaU2Tw
         KvEPO/O1spaHFoeBke5AS/gRjG2M9JoE7m2Sj29CeuRkTlOmC18Ujaab8H9xUnw2uw
         m07TkkLCOjk/g==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Manuel Lauss <manuel.lauss@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sasha Levin <sashal@kernel.org>, jiaxun.yang@flygoat.com,
        linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 13/17] MIPS: Restore Au1300 support
Date:   Wed, 31 May 2023 09:44:57 -0400
Message-Id: <20230531134502.3384828-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531134502.3384828-1-sashal@kernel.org>
References: <20230531134502.3384828-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Manuel Lauss <manuel.lauss@gmail.com>

[ Upstream commit f2041708dee30a3425f680265c337acd28293782 ]

The Au1300, at least the one I have to test, uses the NetLogic vendor
ID, but commit 95b8a5e0111a ("MIPS: Remove NETLOGIC support") also
dropped Au1300 detection.  Restore Au1300 detection.

Tested on DB1300 with Au1380 chip.

Signed-off-by: Manuel Lauss <manuel.lauss@gmail.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/kernel/cpu-probe.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index f521cbf934e76..0307ff2337d5b 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1763,6 +1763,10 @@ static inline void cpu_probe_alchemy(struct cpuinfo_mips *c, unsigned int cpu)
 			break;
 		}
 		break;
+	case PRID_IMP_NETLOGIC_AU13XX:
+		c->cputype = CPU_ALCHEMY;
+		__cpu_name[cpu] = "Au1300";
+		break;
 	}
 }
 
@@ -2092,6 +2096,7 @@ void cpu_probe(void)
 		cpu_probe_mips(c, cpu);
 		break;
 	case PRID_COMP_ALCHEMY:
+	case PRID_COMP_NETLOGIC:
 		cpu_probe_alchemy(c, cpu);
 		break;
 	case PRID_COMP_SIBYTE:
-- 
2.39.2


Return-Path: <SRS0=BUXh=D6=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AFCC388F9
	for <linux-mips@archiver.kernel.org>; Fri, 23 Oct 2020 19:44:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0899122210
	for <linux-mips@archiver.kernel.org>; Fri, 23 Oct 2020 19:44:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Wg3yFwab"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754853AbgJWTox (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 23 Oct 2020 15:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754847AbgJWTox (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 23 Oct 2020 15:44:53 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA29C0613D2;
        Fri, 23 Oct 2020 12:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=hsGIUb4yucLxGB3KN+5kBK6FXlbisJz2OT8Rmz4D5Zs=; b=Wg3yFwabw2DWOYk8RC1PyxinQI
        mtZO++ShyMlNEV9tzo2uFUDBkAaHw4lf0EffeW11V45x/I2FzlUFfrroCp8J97fTfWiQspPsCuZJp
        MRqF93sO5l9ixgqnI7sriKWLX1wsvimQrTzp2IT2bTOtdxwEMi0SGeZiHTNdvJT2QBnXQD/+ZknIG
        da5yxZAP1wTxlBs7eX3csrnFjSvulbiL1ey0bETpxASWegLVu186qxQA9qIb1A3pfzo5W5dAsWY3k
        xvqqDgE2pCB+rVDAADttp3Ebkl7SY5cOkAHGuIu6DThA6hVZUIezOvSHwWmzHg4wTxVUcy45XQsoY
        fdwWW6fA==;
Received: from [2601:1c0:6280:3f0::507c] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kW2zX-0008HT-DG; Fri, 23 Oct 2020 19:44:47 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>, linux-nvdimm@lists.01.org,
        Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] MIPS: export has_transparent_hugepage() for modules
Date:   Fri, 23 Oct 2020 12:44:40 -0700
Message-Id: <20201023194440.13371-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

MIPS should export its local version of "has_transparent_hugepage"
so that loadable modules (dax) can use it.

Fixes this build error:
ERROR: modpost: "has_transparent_hugepage" [drivers/dax/dax.ko] undefined!

Fixes: fd8cfd300019 ("arch: fix has_transparent_hugepage()")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Vishal Verma <vishal.l.verma@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>
Cc: linux-nvdimm@lists.01.org
Cc: Hugh Dickins <hughd@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 arch/mips/mm/tlb-r4k.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20201022.orig/arch/mips/mm/tlb-r4k.c
+++ linux-next-20201022/arch/mips/mm/tlb-r4k.c
@@ -438,6 +438,7 @@ int has_transparent_hugepage(void)
 	}
 	return mask == PM_HUGE_MASK;
 }
+EXPORT_SYMBOL(has_transparent_hugepage);
 
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE  */
 

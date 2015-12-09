Received: from mailapp01.imgtec.com ([195.59.15.196]:34470 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008001AbbLIOyX7HAM5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 9 Dec 2015 15:54:23 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH v2] MIPS: fix DMA contiguous allocation
Date: Wed, 9 Dec 2015 14:54:05 +0000
Message-ID: <1449672845-2196-1-git-send-email-qais.yousef@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Qais.Yousef@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org, akpm@linux-foundation.org, mgorman@techsingularity.net, Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <20151209145405.gZ9uwsvvabuzMHB0Ueyf9k_1ViketBeU5kRLapgdpPA@z>

Recent changes to how GFP_ATOMIC is defined seems to have broken the condition
to use mips_alloc_from_contiguous() in mips_dma_alloc_coherent().

I couldn't bottom out the exact change but I think it's this one

d0164adc89f6 (mm, page_alloc: distinguish between being unable to sleep,
unwilling to sleep and avoiding waking kswapd)

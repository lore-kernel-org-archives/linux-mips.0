Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:25072 "EHLO
        mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010211AbbAGLV0EMhIa (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Jan 2015 12:21:26 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 02/17] MIPS: Netlogic: Fix nlm_xlp2_get_pic_frequency to use ref_div
Date: Wed, 7 Jan 2015 16:58:23 +0530
Message-ID: <1420630118-17198-3-git-send-email-jchandra@broadcom.com>
In-Reply-To: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
References: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <jchandra@broadcom.com>
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
Cc: Qingmin Liu <qingmin@broadcom.com>, ralf@linux-mips.org, Jayachandran C <jchandra@broadcom.com>
Message-ID: <20150107112823.rYiHWsFxSODhaKObmfTefEZQkLcwfJYwVIxrtW_jSqI@z>

From: Qingmin Liu <qingmin@broadcom.com>

The variable ref_div is initialized to the correct divisor but not
used in the frequency calculation. This caused incorrect frequency
to be reported when the clock divisor is not 3.

Signed-off-by: Qingmin Liu <qingmin@broadcom.com>
Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/netlogic/xlp/nlm_hal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/netlogic/xlp/nlm_hal.c b/arch/mips/netlogic/xlp/nlm_hal.c
index bc24beb..7e0d224 100644
--- a/arch/mips/netlogic/xlp/nlm_hal.c
+++ b/arch/mips/netlogic/xlp/nlm_hal.c
@@ -410,7 +410,7 @@ static unsigned int nlm_xlp2_get_pic_frequency(int node)
 
 	fdiv = fdiv/(1 << 13);
 	pll_out_freq_num = ((ref_clk >> 1) * (6 + mdiv)) + fdiv;
-	pll_out_freq_den = (1 << vco_post_div) * pll_post_div * 3;
+	pll_out_freq_den = (1 << vco_post_div) * pll_post_div * ref_div;
 
 	if (pll_out_freq_den > 0)
 		do_div(pll_out_freq_num, pll_out_freq_den);
-- 
1.9.1

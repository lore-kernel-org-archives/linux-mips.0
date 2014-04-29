Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:29457 "EHLO
        mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6843083AbaD2Obx4MGVh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 29 Apr 2014 16:31:53 +0200
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 04/17] MIPS: Netlogic: Warn on invalid irq
Date: Tue, 29 Apr 2014 20:07:43 +0530
Message-ID: <d1707472751b33a7154bc0be330ce565399808b0.1398780013.git.jchandra@broadcom.com>
In-Reply-To: <cover.1398780013.git.jchandra@broadcom.com>
References: <cover.1398780013.git.jchandra@broadcom.com>
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
Cc: Jayachandran C <jchandra@broadcom.com>, ralf@linux-mips.org
Message-ID: <20140429143743.ZrfWofeLQdbVVc2w8kIkjcZEj5VTnpUFlMlJ-oUF-TQ@z>

Warn and return if invalid IRQ is passed to nlm_set_pic_extra_ack.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/netlogic/common/irq.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/netlogic/common/irq.c b/arch/mips/netlogic/common/irq.c
index 5afc4b7..c100b9a 100644
--- a/arch/mips/netlogic/common/irq.c
+++ b/arch/mips/netlogic/common/irq.c
@@ -203,6 +203,8 @@ void nlm_set_pic_extra_ack(int node, int irq, void (*xack)(struct irq_data *))
 
 	xirq = nlm_irq_to_xirq(node, irq);
 	pic_data = irq_get_handler_data(xirq);
+	if (WARN_ON(!pic_data))
+		return;
 	pic_data->extra_ack = xack;
 }
 
-- 
1.7.9.5

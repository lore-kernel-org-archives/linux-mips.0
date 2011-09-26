Received: from mail.windriver.com ([147.11.1.11]:64063 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S1491985Ab1IZBID (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Sep 2011 03:08:03 +0200
From: <rongqing.li@windriver.com>
Subject: [PATCH] staging/octeon: Software should check the checksum of no tcp/udp packets
Date: Mon, 26 Sep 2011 09:08:00 +0800
Message-ID: <1316999280-11999-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org, netdev@vger.kernel.org
Cc: ralf@linux-mips.org, david.daney@cavium.com
Message-ID: <20110926010800.GHKa-Jkp7FaxwMTdyiqTI3DOCcL27LHB1Ls1pHYfsgw@z>

From: Roy.Li <rongqing.li@windriver.com>

Icmp packets with wrong checksum are never dropped since
skb->ip_summed is set to CHECKSUM_UNNECESSARY.

When icmp packets with wrong checksum pass through the octeon
net driver, the not_IP, IP_exc, L4_error hardware indicators
show no error. so the driver sets CHECKSUM_UNNECESSARY on
skb->ip_summed.

L4_error only works for TCP/UDP, not for ICMP.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 drivers/staging/octeon/ethernet-rx.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index 1a7c19a..1747024 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -411,7 +411,8 @@ static int cvm_oct_napi_poll(struct napi_struct *napi, int budget)
 				skb->protocol = eth_type_trans(skb, dev);
 				skb->dev = dev;
 
-				if (unlikely(work->word2.s.not_IP || work->word2.s.IP_exc || work->word2.s.L4_error))
+				if (unlikely(work->word2.s.not_IP || work->word2.s.IP_exc ||
+					work->word2.s.L4_error || !work->word2.s.tcp_or_udp))
 					skb->ip_summed = CHECKSUM_NONE;
 				else
 					skb->ip_summed = CHECKSUM_UNNECESSARY;
-- 
1.7.1

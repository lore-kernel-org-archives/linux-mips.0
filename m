Received: from mailapp01.imgtec.com ([195.59.15.196]:26560 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6860007AbaFWJjgWn4Ir (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 23 Jun 2014 11:39:36 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 07/17] MIPS: bpf: Add SEEN_SKB to flags when looking for the PKT_TYPE
Date: Mon, 23 Jun 2014 10:38:50 +0100
Message-ID: <1403516340-22997-8-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1403516340-22997-1-git-send-email-markos.chandras@imgtec.com>
References: <1403516340-22997-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, "David S. Miller" <davem@davemloft.net>, Daniel Borkmann <dborkman@redhat.com>, Alexei Starovoitov <ast@plumgrid.com>, netdev@vger.kernel.org
Message-ID: <20140623093850.1lt8Ae8dbOw3g7e7MrmruMFr7lOdOCHbDCJPtKDiIbE@z>

The SKF_AD_PKTTYPE uses the skb pointer so make sure it's in the
flags so it will be initialized in time.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Daniel Borkmann <dborkman@redhat.com>
Cc: Alexei Starovoitov <ast@plumgrid.com>
Cc: netdev@vger.kernel.org
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/net/bpf_jit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/net/bpf_jit.c b/arch/mips/net/bpf_jit.c
index fe5041bdc6fb..8cae27af03da 100644
--- a/arch/mips/net/bpf_jit.c
+++ b/arch/mips/net/bpf_jit.c
@@ -1322,6 +1322,8 @@ jmp_cmp:
 				emit_andi(r_A, r_s0, VLAN_TAG_PRESENT, ctx);
 			break;
 		case BPF_ANC | SKF_AD_PKTTYPE:
+			ctx->flags |= SEEN_SKB;
+
 			off = pkt_type_offset();
 
 			if (off < 0)
-- 
2.0.0

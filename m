Received: from mailapp01.imgtec.com ([195.59.15.196]:16908 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6860009AbaFWJjjIjqSQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 23 Jun 2014 11:39:39 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 09/17] MIPS: bpf: Use correct mask for VLAN_TAG case
Date: Mon, 23 Jun 2014 10:38:52 +0100
Message-ID: <1403516340-22997-10-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140623093852.RlKG2iU8gRrrErZj4N9AvfFNHoSOpWDvEkQacZ7dbOc@z>

Using VLAN_VID_MASK is not correct to get the vlan tag. Use
~VLAN_PRESENT_MASK instead and make sure it's u16 so the top 16-bits
will be removed. This will ensure that the emit_andi() code will not
treat this as a big 32-bit unsigned value.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Daniel Borkmann <dborkman@redhat.com>
Cc: Alexei Starovoitov <ast@plumgrid.com>
Cc: netdev@vger.kernel.org
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/net/bpf_jit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/net/bpf_jit.c b/arch/mips/net/bpf_jit.c
index 500f97fdc0e1..a4d1b76e7373 100644
--- a/arch/mips/net/bpf_jit.c
+++ b/arch/mips/net/bpf_jit.c
@@ -1317,7 +1317,7 @@ jmp_cmp:
 			off = offsetof(struct sk_buff, vlan_tci);
 			emit_half_load(r_s0, r_skb, off, ctx);
 			if (code == (BPF_ANC | SKF_AD_VLAN_TAG))
-				emit_andi(r_A, r_s0, VLAN_VID_MASK, ctx);
+				emit_andi(r_A, r_s0, (u16)~VLAN_TAG_PRESENT, ctx);
 			else
 				emit_andi(r_A, r_s0, VLAN_TAG_PRESENT, ctx);
 			break;
-- 
2.0.0

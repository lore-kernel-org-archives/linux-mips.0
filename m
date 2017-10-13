Received: from szxga04-in.huawei.com ([45.249.212.190]:2482 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990480AbdJMJWaPueyW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 Oct 2017 11:22:30 +0200
From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH -next] MIPS: bpf: Fix a typo in build_one_insn()
Date: Fri, 13 Oct 2017 09:25:17 +0000
Message-ID: <1507886717-150040-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Return-Path: <weiyongjun1@huawei.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, David Daney <david.daney@cavium.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Colin Ian King <colin.king@canonical.com>, Daniel Borkmann <daniel@iogearbox.net>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20171013092517.qjy813sWLTlkzejPn3gFHfcziZXh8g9MlvmQnitvDl0@z>

Fix a typo in build_one_insn().

Fixes: b6bd53f9c4e8 ("MIPS: Add missing file for eBPF JIT.")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 arch/mips/net/ebpf_jit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/net/ebpf_jit.c b/arch/mips/net/ebpf_jit.c
index 01b7a87..962b025 100644
--- a/arch/mips/net/ebpf_jit.c
+++ b/arch/mips/net/ebpf_jit.c
@@ -1513,7 +1513,7 @@ static int build_one_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
 		}
 		src = ebpf_to_mips_reg(ctx, insn, src_reg_no_fp);
 		if (src < 0)
-			return dst;
+			return src;
 		if (BPF_MODE(insn->code) == BPF_XADD) {
 			switch (BPF_SIZE(insn->code)) {
 			case BPF_W:

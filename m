Received: from mailapp01.imgtec.com ([195.59.15.196]:13971 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013596AbaKMLI4r3tSu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 13 Nov 2014 12:08:56 +0100
From: James Cowgill <James.Cowgill@imgtec.com>
Subject: [PATCH 1/2] mips: fix __node_distances undefined error on loongson3
Date: Thu, 13 Nov 2014 11:08:06 +0000
Message-ID: <1415876887-13957-1-git-send-email-James.Cowgill@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Cowgill@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Huacai Chen <chenhc@lemote.com>, James Hogan <james.hogan@imgtec.com>, James Cowgill <James.Cowgill@imgtec.com>, stable@vger.kernel.org
Message-ID: <20141113110806.xf-Pc0fWena6ZZUl6wMQQpb6clBq44bRp18SYhOFWvo@z>

export the __node_distances symbol in the loongson3 numa code to fix the
build error:

  Building modules, stage 2.
  MODPOST 221 modules
ERROR: "__node_distances" [drivers/block/nvme.ko] undefined!
scripts/Makefile.modpost:90: recipe for target '__modpost' failed

when building the kernel with:
 CONFIG_CPU_LOONGSON3=y
 CONFIG_NUMA=y
 CONFIG_BLK_DEV_NVME=m

Signed-off-by: James Cowgill <James.Cowgill@imgtec.com>
Cc: <stable@vger.kernel.org> # v3.17+
Reviewed-by: James Hogan <james.hogan@imgtec.com>
---
 arch/mips/loongson/loongson-3/numa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/loongson/loongson-3/numa.c b/arch/mips/loongson/loongson-3/numa.c
index 37ed184..42323bc 100644
--- a/arch/mips/loongson/loongson-3/numa.c
+++ b/arch/mips/loongson/loongson-3/numa.c
@@ -33,6 +33,7 @@
 
 static struct node_data prealloc__node_data[MAX_NUMNODES];
 unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
+EXPORT_SYMBOL(__node_distances);
 struct node_data *__node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(__node_data);
 
-- 
2.1.3

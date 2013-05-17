Received: from szxga01-in.huawei.com ([119.145.14.64]:15159 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6816822Ab3EQGV6izu87 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 17 May 2013 08:21:58 +0200
Message-ID: <5195CC6B.1000607@huawei.com>
Date: Fri, 17 May 2013 14:21:31 +0800
From: Libo Chen <clbchenlibo.chen@huawei.com>
MIME-Version: 1.0
Subject: [PATCH] MIPS: drivers: fix clk leak
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <libo.chen@huawei.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org, grant.likely@linaro.org, rob.herring@calxeda.com
Cc: linux-mips@linux-mips.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Li Zefan <lizefan@huawei.com>
Message-ID: <20130517062131.QAtnexIWr8cOw5uqYCakVYJKeMbXSH_XPWu82cWllnY@z>


when gptu_r32 fail, we should put clk before return

Signed-off-by: Libo Chen <libo.chen@huawei.com>
---
 arch/mips/lantiq/xway/gptu.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/mips/lantiq/xway/gptu.c b/arch/mips/lantiq/xway/gptu.c
index 9861c86..4fa577c 100644
--- a/arch/mips/lantiq/xway/gptu.c
+++ b/arch/mips/lantiq/xway/gptu.c
@@ -169,6 +169,8 @@ static int gptu_probe(struct platform_device *pdev)
 	if (((gptu_r32(GPTU_ID) >> 8) & 0xff) != GPTU_MAGIC) {
 		dev_err(&pdev->dev, "Failed to find magic\n");
 		gptu_hwexit();
+		clk_disable(clk);
+		clk_put(clk);
 		return -ENAVAIL;
 	}

-- 
1.7.1

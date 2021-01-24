Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CEDC433E0
	for <linux-mips@archiver.kernel.org>; Sun, 24 Jan 2021 07:39:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 665E622B48
	for <linux-mips@archiver.kernel.org>; Sun, 24 Jan 2021 07:39:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbhAXHi7 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 24 Jan 2021 02:38:59 -0500
Received: from mail.loongson.cn ([114.242.206.163]:56270 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726038AbhAXHi7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 Jan 2021 02:38:59 -0500
Received: from localhost.localdomain (unknown [112.3.197.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxRb3CIw1gZ8cKAA--.13975S2;
        Sun, 24 Jan 2021 15:37:40 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@gmail.com>, siyanteng01@gmail.com,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2] MIPS: mm: remove function __uncached_access()
Date:   Sun, 24 Jan 2021 15:37:55 +0800
Message-Id: <20210124073755.1287129-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxRb3CIw1gZ8cKAA--.13975S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW5tF4rKFyDJF47tF1UWrg_yoW8Zw4Dpa
        93Aa48GFW09w17Xw47A34UZan3Z3s8t3y2vFW7C34093ZIv3W7ur1fJFy5ur4Yvry3ua1x
        Zr4rJryUZF4rAw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0E
        wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
        80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
        I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
        k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
        1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

MIPS uses this logic because loongson2e override the
definition of unchached. However, now the logic of
loongson2e has been removed, so MIPS is no longer needed.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 arch/mips/loongson2ef/common/mem.c | 11 -----------
 arch/mips/mm/cache.c               |  8 --------
 drivers/char/mem.c                 |  7 -------
 3 files changed, 26 deletions(-)

diff --git a/arch/mips/loongson2ef/common/mem.c b/arch/mips/loongson2ef/common/mem.c
index 057d58bb470e..fceb3ee47eb0 100644
--- a/arch/mips/loongson2ef/common/mem.c
+++ b/arch/mips/loongson2ef/common/mem.c
@@ -41,14 +41,3 @@ void __init prom_init_memory(void)
 		memblock_add(LOONGSON_HIGHMEM_START, highmemsize << 20);
 #endif /* !CONFIG_64BIT */
 }
-
-/* override of arch/mips/mm/cache.c: __uncached_access */
-int __uncached_access(struct file *file, unsigned long addr)
-{
-	if (file->f_flags & O_DSYNC)
-		return 1;
-
-	return addr >= __pa(high_memory) ||
-		((addr >= LOONGSON_MMIO_MEM_START) &&
-		 (addr < LOONGSON_MMIO_MEM_END));
-}
diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 23b16bfd97b2..9cfd432d99f6 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -207,11 +207,3 @@ void cpu_cache_init(void)
 
 	setup_protection_map();
 }
-
-int __weak __uncached_access(struct file *file, unsigned long addr)
-{
-	if (file->f_flags & O_DSYNC)
-		return 1;
-
-	return addr >= __pa(high_memory);
-}
diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 43c871dc7477..869b9f5e8e03 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -291,13 +291,6 @@ static int uncached_access(struct file *file, phys_addr_t addr)
 	 * attribute aliases.
 	 */
 	return !(efi_mem_attributes(addr) & EFI_MEMORY_WB);
-#elif defined(CONFIG_MIPS)
-	{
-		extern int __uncached_access(struct file *file,
-					     unsigned long addr);
-
-		return __uncached_access(file, addr);
-	}
 #else
 	/*
 	 * Accessing memory above the top the kernel knows about or through a
-- 
2.27.0


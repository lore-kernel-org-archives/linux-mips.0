Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9D849BB75
	for <linux-mips@vger.kernel.org>; Fri, 16 Oct 2026 22:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189118; cv=none; b=pclLPHTtsNePYSKILS8PUugc1U6vTZhl2ig42nYLpgIXgARdxszY7ahC5NYSlliEnGci2kBG+4DLmVIxv/QwBRhHIj5riMBJtLAbV3FjyWU52WVGvojK36Bu6JeugW8tPUqvxB3OpQtOzhNJw3fYiSph7MmfRqITpDwd/BJDPCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189118; c=relaxed/simple;
	bh=eAkAvT+yBRUe0s9630zTQSOh0+HXy+SMp+QNlLmXu6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ttqdp2TVLqNRVZp7GEdW/lSLOcsZtb34/u8IhQCqny3+zNo2S9IjV5A+6CSotmPPljk9i+1//JYZRUBVUWgkFfOl5ZklXUnv5bQYaECVh3rMXRq4Xx/FIz/e5IEXpDpp97TtWNUqkrLJjnhFDn+P7HoniHdx8PtyZKipvv6cq0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrPBOcpt; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrPBOcpt"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3535a54bed9so479356eec.1
        for <linux-mips@vger.kernel.org>; Fri, 16 Oct 2026 15:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792189115; x=1792793915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlYhVNhZnOfgJKBXKw6X3C15lzRF5IoCPz9Nzq/4EgQ=;
        b=RrPBOcpt0Bfc++ENSWtLA73WJnYLrknL2kaDHIS/KvZXRbSawZzeedPhO03HY3xENZ
         OxYl+GimkGzJim3DfZMRtfunKqaF53AUVlELkpSzOl/8Lfoi6cZ5PkudY6y/b5LpOwC5
         4ib4JHk/f9E7elkc7y/VZK595Hj8okeRME4skOW1QzhkAqwkxcvKz/11L1EDeB5IDD4i
         Ll39JLFhfInCztjXtqRhamZMOS09bhvUZhCGZHLy+Y8ieqKqI3t/gsC9QdzQXVq5U4r9
         2zfM6l2mx4QczbTrGS1+tatZuG7utVROtIfZHU7rfJLglax/pL3KkPmiwI/yjqg3HyHp
         zWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189115; x=1792793915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlYhVNhZnOfgJKBXKw6X3C15lzRF5IoCPz9Nzq/4EgQ=;
        b=VlxpCWrjLmiwK/q8qfTgpN7OIBXyfZYMRAU7h8iRVwEHTWWLvpornJ/AtAhx9+EA7p
         wucDqRBSde89mX5v2avW/YxHBPe4Qbv1o3LC73eCHZUr4SMuWpbnGTmuhjYGuoai8NhJ
         JJVD6X6Y3G3c5+Q8TR0w5BUT/ezUIYmBxi90SrgtufVv6uPx5QnIgGF03uX90aRnfyQX
         l+mSm+Y2ov5OaAauPZoVWPu2vfJG8kzgK+wHxMUnGClU4PhEwGtgSYKzxzGg7C/R3Mdq
         z3H0aNd199m2Cz0+gjxbSgWGVpuaG9GRAEtwIhTHUqC8AbEYOxQFhTpxuyv9wdRiDgbW
         05dQ==
X-Gm-Message-State: AFq9FYJSqOuwXRjwyariGj6WN5ixE1TdSPDWlMkdeb5U6IvhIt8/XSYy
	A35b/Z2Zk/Ld6keQnxokh/PbYlXWWCW+Is/AN2pc7LijR2jXoqmP4Q0hAKeABueT
X-Gm-Gg: AYBFou2BT1k4qOSYASWzWgFkkw2EOTt2Baw5RhCaq067/2q+0cg+E6g0IyukUwCadHu
	iQcTdaQvtBxPrnU0A5jCENWas6sFsCTIU/KgaCs9qUJOiH8N+T8sBzc3ubZd7nEYA/F/TgZj1vU
	3Jct2LKTDYkAx53FGCsPsfKD6ZtiQKMW3v/hM+MKod99NAncp69hsu+soprC6IECPIcwgRJB/WU
	5ciFW5AXxgYTm7UxnSIPArCTYkD42oA4DWbpOW4TyG1mW+C4wzjv/Qdt6Na6q6FCtm+fr5qiTJL
	XyxkbjaZyna6TfoGH1qQle0Qrt/HYMAUqqD64MDv/xtrgaawhyNsFp1CisgMb1szio68xfQdRzT
	qX4fj5evm6oTgw/BDZAhmAEgBR+FAaYXBjzbyjCg5Wq9yDGly1EjxnVRP+eXFb7qRgXVMOn4ZyT
	k4R+IyOPAwYoXD5nvaggalX+6NYb3MELIhBiIDApcD3OnQcrzDjZYOUarJ4LM40nu48qlXEb8Wa
	VuHq0Zm
X-Received: by 2002:a05:7300:d58d:b0:35e:d9ac:77f1 with SMTP id 5a478bee46e88-3619ed0f96bmr1421666eec.2.1792189115227;
        Fri, 16 Oct 2026 15:18:35 -0700 (PDT)
Received: from eldorado ([2600:8802:b00:1f84:d294:66ff:fe95:a98e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082b8573dsm9242531eec.25.2026.10.16.15.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:18:32 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] MIPS: Alchemy: Save the Ethernet address before reusing PROM memory
Date: Fri, 16 Oct 2026 15:18:26 -0700
Message-ID: <20261016221828.2223162-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alchemy keeps pointers into the firmware environment and looks up ethaddr
when initializing the Ethernet devices. By that point, memory allocation
can have overwritten the environment, causing prom_getenv() to pass an
invalid pointer to strchr() and panic during boot.

On the MTX-1, the struct page layout change in 9ddb3c14afba reduces struct
page from 40 to 32 bytes and exposes this unreserved firmware memory.
Bisection and boot tests confirmed that the parent boots while the change
reproduces the panic.

Parse the Ethernet address during prom_init(), before registering RAM
with memblock, and keep the six bytes in kernel-owned init data. Return
the saved address during device initialization, preserving the existing
YAMON formats and command-line fallback without reserving a fixed
low-memory region.

Fixes: b93ddc4f9156 ("mips: Reserve memory for the kernel image resources")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v2:

- corrected Fixes tag to a more appropriate one

 arch/mips/alchemy/common/prom.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/mips/alchemy/common/prom.c b/arch/mips/alchemy/common/prom.c
index 20d30f6265cd..c4aefeb78871 100644
--- a/arch/mips/alchemy/common/prom.c
+++ b/arch/mips/alchemy/common/prom.c
@@ -46,6 +46,11 @@ int prom_argc;
 char **prom_argv;
 char **prom_envp;
 
+static char prom_ethaddr[6] __initdata;
+static bool prom_ethaddr_valid __initdata;
+
+static void __init prom_init_ethernet_addr(void);
+
 void __init prom_init_cmdline(void)
 {
 	int i;
@@ -95,6 +100,9 @@ void __init prom_init(void)
 	if (!memsize_str || kstrtoul(memsize_str, 0, &memsize))
 		memsize = SZ_64M; /* minimum memsize is 64MB RAM */
 
+	/* Save the MAC before the allocator can reuse the PROM environment. */
+	prom_init_ethernet_addr();
+
 	memblock_add(0, memsize);
 }
 
@@ -125,7 +133,7 @@ static inline void str2eaddr(unsigned char *ea, unsigned char *str)
 	}
 }
 
-int __init prom_get_ethernet_addr(char *ethernet_addr)
+static void __init prom_init_ethernet_addr(void)
 {
 	char *ethaddr_str;
 
@@ -135,12 +143,21 @@ int __init prom_get_ethernet_addr(char *ethernet_addr)
 		/* Check command line */
 		ethaddr_str = strstr(arcs_cmdline, "ethaddr=");
 		if (!ethaddr_str)
-			return -1;
+			return;
 
 		ethaddr_str += strlen("ethaddr=");
 	}
 
-	str2eaddr(ethernet_addr, ethaddr_str);
+	str2eaddr(prom_ethaddr, ethaddr_str);
+	prom_ethaddr_valid = true;
+}
+
+int __init prom_get_ethernet_addr(char *ethernet_addr)
+{
+	if (!prom_ethaddr_valid)
+		return -1;
+
+	memcpy(ethernet_addr, prom_ethaddr, sizeof(prom_ethaddr));
 
 	return 0;
 }
-- 
2.53.0


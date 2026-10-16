Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AA758B6DB
	for <linux-mips@vger.kernel.org>; Fri, 16 Oct 2026 17:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171942; cv=none; b=tokKyW3mQ9NTRCQ1Rjwypha1A7WsVLTlD4eeLCZeG1JS9xmICx4OdLu2OhpROm5nb+LaHPAewcpybyzXDSdo0U8vH6ok0LB0I+J3SecNqSSu2r9H+LvUycZpP521rAVuzUmhOrpuP+/99WolgwNhJcnE2uDm8Yt4ZlA6YTj6P7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171942; c=relaxed/simple;
	bh=Xb9/uHbaP6ZztLgA2mKpC9Kw4vGIiSU4nzGKuaJgjA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hcsVERdNY+DjemRvX3XJf4H0R7ND3YVew/wJ8sYTmc4HIljNXpSMDJDYXSz7/wl0Ooi9Kdw0GaXjEfsDJWbfq2haHVpIHdZqebqQGKQ9DxDw2p/8B2cthK9HE5AeAKqtkAgWK0h3A91ObqmUy4i01YQ4JYYdsRaFMzecjpeNc5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnRj2R4P; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnRj2R4P"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so312972eec.0
        for <linux-mips@vger.kernel.org>; Fri, 16 Oct 2026 10:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171939; x=1792776739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DDk7pcn/pZwo4E/CsDXVdDsNLgR0YfetqbEY1bK/nD8=;
        b=LnRj2R4P44HUechbLgk675VE1KAPpF9sQF5gIs+kox6rwveYqq2OchKktjavr/C74C
         0sI0rWRD36P4HqGBdr7SzFUMyFGzCdrIOjncDdRSEF1F33L2gb3v1D8nexf4eWgi+POU
         YGtm482BdioeMh1LJzHQD1c598PYNxStPT7zKb34zYwuWkeIY9BM8g2DClUzAK2TVWPh
         4MyAHohApBIadKPmvW03YDvJ+LE8KrynBOOkkrjAzsfA/C0bqlGlmzj6KcWZVkjSYHJ4
         tkTb651ICK4PKSUY2aFflE2EsL6+VGjyY9N3SNntzuIiizPI740wjUUzZPzTXcpjE7b2
         R6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171939; x=1792776739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDk7pcn/pZwo4E/CsDXVdDsNLgR0YfetqbEY1bK/nD8=;
        b=Xh1rwe8eN0OLtjgh8CUiLaUpj+8O8nAsU/Xa5PcFGW3ntpEcEON/FDAJn1sIFHgXFJ
         IJMuHwqsAuj2g3f2KQ9SuT7k27KNZr1iMghCu8zIzzUPw91S1CgbNYrXPYD9V21iau9N
         plDQhfhQfkPcpF38DW0m3Y1n/jn1P+vPZslVipVPRVDfhVxtXovTzAgzf9KoSIMz0jlv
         +r03PdOF9gQfj9pp973pPIpy3Tjuni+ODzMakMVL6rhlYmTcMIOUrNfl24Lh+4ygdz2e
         hOfKDXnQnHgAqBivRZldIBKKGD5wkUFGMtz+pgrYJQ96UFqMosZ5BBREIuQUJWY7X+Z6
         Q1Xg==
X-Gm-Message-State: AFq9FYI2NLfwesfg8FjHeucRoejNlvr3FGWh6gZJLnYs/nzlcrngE7AW
	ZFk8VdBk187wvVmVgdDah2UarL5rdtF009E121w70d3YWUBMyGKRlYebk4acYQ==
X-Gm-Gg: AYBFou3p5yIOxKsKHtcY7ei/wzP5HVqgFX/5uZFZREw2Gt0Lsziy3w0vyggJO5bRTrR
	J1eAWTRgcAcOT1o/RC+90hGbZRYHcUNpRMmpVhtLRJtDBrpBjBvRwSwdLns8P3MGzTDNtKHyOWh
	a3j4W512EiIpqzT6isEDfVDrzicuHYvqVxBVza18lOieqf1+qfFmLQCmtRNl/K9sVztRDB2ACqt
	8NtYBVdOCZWjZ5SxZSxqUzEzyC2fnt6e2vAlxo9K+WMF0odXGkCcww8TXHUXj47vz3kSyVNUj83
	6k8IMSlMbF2eovho2sVAk2LTWyFqKOVVbAD8f4pRQeUcQsJ3NbA0FlAdqenGWawwamNTJ3Ghr1V
	5KtMPLjwkswst8cWeA5OmRiiXiYt0lAkcc8m2jq0DBh+WUXVj+lLwylHqjMALKlLq86r3Z8ocie
	PZtKzEcFua7Wek8cQVXX6SNjFe/hFwiK0rPj8y/iVSykaIQ+u2uV7cJ3cz9d+MP3uFBXwxSUsm/
	Z3J6uKS0Nd22/A3ZS4dtDZG
X-Received: by 2002:a05:7301:3a8f:b0:360:8a6e:640f with SMTP id 5a478bee46e88-361a3719b9emr513983eec.39.1792171938929;
        Fri, 16 Oct 2026 10:32:18 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b792bsm7980034eec.5.2026.10.16.10.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:32:17 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: manuel.lauss@gmail.com,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: Alchemy: Save the Ethernet address before reusing PROM memory
Date: Fri, 16 Oct 2026 10:31:55 -0700
Message-ID: <20261016173157.2083454-1-f.fainelli@gmail.com>
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

Fixes: 9ddb3c14afba ("mm: fix struct page layout on 32-bit systems")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
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


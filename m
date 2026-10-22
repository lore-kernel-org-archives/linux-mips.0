Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792686670;
	b=nHqr9HgMJvsDyhJoKwuRYKS9jDev8OYNyxnDpBLuTV8y18Z/Z8FN/kKY3ugYj4EkA6ty
	 MQEydkurRlTUWlIG03VjppgH+8C4ZQDTqGp63Vp7ah23hsyfr9Lb0GU3bBPvrUWREwz/e
	 1BYVt5ijnv8JmtinsFDtRSzpHLaS18xfen8cccoK5/Fcl4c/MhZuYtySEjBZH2LXKE/c6
	 weiLS0jMuizq0SWknECOcJwQlXSg28egGNhJm9NDWxYF2bvLcXPhBFCGRAF6e8I4NCr6a
	 UhB6evGwWCSW8FDagd2wIR52k8bCZvp5jBASUT5Rxfrahhv+IC6FGsyEXrIo/JRrogA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=C3JsDYA+dHKiHzDhkGjt5ijrcUWz60I62RAqv7JIoHo=;
	b=c9R/3FFcVoGOjy5GXxkyqpj91imm/B1djuYYPZhLmd/9wGmuqNaepxqARdDbjE36K/WU
	 ns7gEBNGZCpgMPeNv9w2l4Rswm6ygFk19q9mlaLPlpYwqqGhIgu8NOvGVI+p8NoD9GDBY
	 SwTFimJonVR77VblcX3xH3lkvbJB3TH5XyHYR6c0Tvcb5bJroGNXJL0ndk3YTX4Ri9bJ+
	 l9OrgFqC2+MiNPUiWRAjWaZI+Z6LvVg5xjwpU3ITQeonfXKUV6d+B9Nt0/xOOmMy59sl9
	 lMNg92+0W5fh7A+SddZktD7ecoYdWOhFvbEb8DxD0t2PsY00J7Gql3JQiA5pC3jrg9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G9axl0ZW;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE8F606A319
	for <linux-mips@vger.kernel.org>; Thu, 22 Oct 2026 16:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE8F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G9axl0ZW
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3514b90bb89so5173675eec.1
        for <linux-mips@vger.kernel.org>; Thu, 22 Oct 2026 09:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792686669; x=1793291469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C3JsDYA+dHKiHzDhkGjt5ijrcUWz60I62RAqv7JIoHo=;
        b=G9axl0ZWjA7BHFiUel4w/TY/I18yCQTA+YWuou9plV+jjnH0qQt+lyaRuZr7rlcr0N
         5pleDG2nV7+fKtdKO9f0HQU0hzjtb6Yjv3rt6AGf78oa/RktR1NVu75dr8pddYnvQEWP
         KmVX18kDv0UDtEt+0FeP1nFXpafHXToc7NL7LRUo74UMpQ3T6Trz+4Y2gMPVpAsdq9vo
         oVw3Noz4zjJHEm3wMUgf0mPly7S7tzXHyyzVvi0d3ztqyDsD0W0Oecqb9cv7lnlJhrAL
         nlt5/ytKDMeYjye5IS/tVacDMFenh8Wp+zMeONVfitTJzXO7QsU0vtcV5DioZapbUOIM
         4VMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792686669; x=1793291469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C3JsDYA+dHKiHzDhkGjt5ijrcUWz60I62RAqv7JIoHo=;
        b=J7LL+rbBoROYg897Jl6WucxTkbVxiZFCViorkrwgCMiO+5bxRGzAfbULstQjiEZgq6
         947nA/DpYZaMB1RTOK/SdIYw1fbDMyZ24NJweOhqXmzODjHtnLfKCYT9kaDrkd05r7tW
         +9gLPQW89vW8lPsB+aRwl8AYTHsL+X4UEX307jNDG7v2QOGkkWJrr1RG43JOP+BMmV2a
         qdCvk7Y/nV5vjMwT8O61ikKSLDzj23nlfJCQFfElU8pZUvsWMlJUx+zXS/gf4Bl02ncA
         lcgQzChaU04tWsmF3vsW89vXHL7jBMaR6NlVEE7WEJtN0vDlAB0q1B418OuVv7qdiW4E
         WREg==
X-Gm-Message-State: AFq9FYI8uj/syiHuNaB6PmQVEbneMZ+CmyjbiN8SztjyLr1N6FRCtUDr
	38gScZqPVtfTuhVYDmBYdgeDJFONkews3zad2Pw/i/g69pS/onoGgpHEWUa9yCbZ
X-Gm-Gg: AYBFou1yugTbZxkLvaWI2IWlW7gF2/Q/M6kgYDwhWsSdZlbf6pkt8ubImSn5xBFScOF
	h76ugWH9r6PDE16OouFRADAFhrjXZ0Mx3kAdlrw9d+eA2JLHXViP9Xgn9MsduCIhtnxdo0l20SU
	o/XDjK/YPKWKYZeKK/nIOuSkYP5Mv4XZzvbuh1TN4UHWaPlSnrkOmzXxPbGqjBemsDzvkYwdGsq
	KK/ln66iL/T/5cwobKYgVthNwwqIfwFH8WpQQ0QYVFhiSLSIIDpiDRkiKvX+3KGqQKWMUShYcBa
	DQzS4DQVej4CA7oCxUSdlpiZhRwIPJRMZqfK86fcsCnB2VKcKX9o1qWM/y5gB7YXxkPBRq+ZDTx
	kgwH/1+VH48/HcXMtGvJjbhgzc4RPEDwBuAEqmRJbE7CWM2yxmSybgV5/UFSF0mFs90YpFmPOwT
	OP3FYmnam8MbH6L+xfAp4zAAwivusHchrUl0Fm8f0WNkgNXAhtPpDQTTLGxG+F/vpPHOj11shRt
	x2+1yIiCJ2+ng5knNEbLQbVT6cmS9iQhCg=
X-Received: by 2002:a05:7301:618e:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-3674c63d579mr7766127eec.10.1792686669328;
        Thu, 22 Oct 2026 09:31:09 -0700 (PDT)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198e2d6sm15771540eec.22.2026.10.22.09.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:31:08 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: macro@orcam.me.uk,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] MIPS: Cobalt: Include legacy IDE ports in the PCI I/O window
Date: Thu, 22 Oct 2026 09:31:00 -0700
Message-ID: <20261022163106.1410595-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Cobalt PCI I/O window starts at 0x1000, excluding the VIA IDE
controller's fixed compatibility-mode ports at 0x170, 0x1f0, 0x376 and
0x3f6. Since pcibios_enable_device() was converted to
pci_enable_resources(), these unclaimed resources cause pata_via to
fail to probe with -EINVAL.

Start the PCI I/O window at zero to cover the southbridge legacy ports,
retaining 0x1000 as the allocation minimum via PCIBIOS_MIN_IO. Register
the PCI controller from plat_mem_setup(), before the VIA reservations
and i8259 initialization, so the legacy resources do not conflict with
the host bridge window and prevent PCI bus scanning.

Keep the VIA resource reservations in plat_mem_setup() after the PCI
controller registration and use insert_resource() to nest them beneath
the PCI window. The i8259 and RTC resources are also claimed beneath it.

Boot-tested on a Qube2 with a MIPS64 kernel. All seven PCI functions
enumerate, both tulip devices bind, and pata_via initializes both ATA
hosts and detects the ST380012A 80 GB disk. All 18 boot checks pass,
including a read-only disk test and Ethernet ping.

Fixes: ae81aad5c2e1 ("MIPS: PCI: Use pci_enable_resources()")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v2:

- implement Maciej's suggestion to reserve PCI resources first
  and then the rest of the peripherals

 arch/mips/cobalt/pci.c                     | 11 +++++------
 arch/mips/cobalt/setup.c                   |  4 +++-
 arch/mips/include/asm/mach-cobalt/cobalt.h |  1 +
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/mips/cobalt/pci.c b/arch/mips/cobalt/pci.c
index 85ec9cc31d66..29fd052766b2 100644
--- a/arch/mips/cobalt/pci.c
+++ b/arch/mips/cobalt/pci.c
@@ -14,6 +14,8 @@
 
 #include <asm/gt64120.h>
 
+#include <cobalt.h>
+
 extern struct pci_ops gt64xxx_pci0_ops;
 
 static struct resource cobalt_mem_resource = {
@@ -24,7 +26,7 @@ static struct resource cobalt_mem_resource = {
 };
 
 static struct resource cobalt_io_resource = {
-	.start	= 0x1000,
+	.start	= 0,
 	.end	= 0xffffffUL,
 	.name	= "PCI I/O",
 	.flags	= IORESOURCE_IO,
@@ -38,11 +40,8 @@ static struct pci_controller cobalt_pci_controller = {
 	.io_map_base	= CKSEG1ADDR(GT_DEF_PCI0_IO_BASE),
 };
 
-static int __init cobalt_pci_init(void)
+void __init cobalt_pci_init(void)
 {
+	PCIBIOS_MIN_IO = 0x1000;
 	register_pci_controller(&cobalt_pci_controller);
-
-	return 0;
 }
-
-arch_initcall(cobalt_pci_init);
diff --git a/arch/mips/cobalt/setup.c b/arch/mips/cobalt/setup.c
index 9a266bf78339..502acc92969b 100644
--- a/arch/mips/cobalt/setup.c
+++ b/arch/mips/cobalt/setup.c
@@ -83,9 +83,11 @@ void __init plat_mem_setup(void)
 	/* I/O port resource */
 	ioport_resource.end = 0x01ffffff;
 
+	cobalt_pci_init();
+
 	/* These resources have been reserved by VIA SuperI/O chip. */
 	for (i = 0; i < ARRAY_SIZE(cobalt_reserved_resources); i++)
-		request_resource(&ioport_resource, cobalt_reserved_resources + i);
+		insert_resource(&ioport_resource, cobalt_reserved_resources + i);
 }
 
 /*
diff --git a/arch/mips/include/asm/mach-cobalt/cobalt.h b/arch/mips/include/asm/mach-cobalt/cobalt.h
index 97f9d5e9446d..c7a8607cd651 100644
--- a/arch/mips/include/asm/mach-cobalt/cobalt.h
+++ b/arch/mips/include/asm/mach-cobalt/cobalt.h
@@ -19,6 +19,7 @@ extern int cobalt_board_id;
 #define COBALT_BRD_ID_QUBE2    0x5
 #define COBALT_BRD_ID_RAQ2     0x6
 
+void cobalt_pci_init(void);
 void cobalt_machine_halt(void);
 void cobalt_machine_restart(char *command);
 
-- 
2.53.0


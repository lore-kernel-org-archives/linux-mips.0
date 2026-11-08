Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794148315;
	b=sVEBVO1Rm5UrzbWH0sXT9y/v7RIfv9EBH4FPGFFqiK/NQE3BPUlR8YNzj7sXRzZuuG6b
	 z9KWWgL2GCMd/j/ZoI2UO0Cm0SlKIAJkjsJBhs4u57/CZWTc1hdSdEqGBe0oWBf9PiLOS
	 fPsLUW+yuZUop1APLTtXAFhnhUhri/Xjy/8v7pqABjaG8XRXCo/pyNajw3+KhXlQyKQjt
	 oCbqW7Rr8twl8EXmEF1BJNUc8+/HvN4d0K5DA9d3JLxLlVTuahd4IlpzlDTCwtrLTtT+0
	 LT7fcUUyeXA/iIALlobjBNhq0xnt+Fnl3B2O6VrG46wTvWG9QXeHEXaphkQvXzKLu6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=liy1VmXlPKvtQbzDRyOlq4Ft68qogIpqnl5phnSa1P8=;
	b=TFXgPWv2XvX3Skz2UNS4DlKVDhpIkiFomPKRlX9ypW/51adxZLcaFJ9sHydunhfJ/KwX
	 aX+coJof6KYpHo3lpbUqGQIhob1oODxTjyRV3V69aM1cQ4wqFK3ysvwIacjjtc+1Oaqsj
	 mFPqwNjAkcn74ox/w3nwM2K8j8kSeJh7hf5GK5eL3U7t+oiCChGV5LlhvGrg7vVs8BFX2
	 bE2hdw6pec3NsjWiiAB3TWIlHQpkPE7mmgZ96z1RUCZcEEm7mNlCOL0bmk+jM8oY1mlpc
	 BsytlNXZh1aGEbVAI+j780l489zrvZnzYpVcHeFXU78cgHYS2gfTFx/4t83KL8fyMhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ct+Jmk/m";
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987EE606A31C
	for <linux-mips@vger.kernel.org>; Sun,  8 Nov 2026 14:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 987EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ct+Jmk/m
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-4b886ebe069so274545e9.1
        for <linux-mips@vger.kernel.org>; Sun, 08 Nov 2026 06:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794148313; x=1794753113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=liy1VmXlPKvtQbzDRyOlq4Ft68qogIpqnl5phnSa1P8=;
        b=ct+Jmk/mePCfTNw5JyEoXJ7aIvsqtL4IGtHgKGpa04qLsoMnl4r+Qg+yTKy2GAaw3n
         hSvi/HC60IrGTS+oAUXuvKQOU4uXbos4v5ieY2GRnHOcoTq+GmG7ugaqaN+vNhAd2LhG
         5yXwQFTC5NmMIxEZdXn5If4oAbuwwrnM2CNH6s1Pzxqgw8nvmQQXU6R7VulpOb9jmHI+
         W90Wwm/sRaujuk0oqa7ZPCghzshMJBeu8c1lcjhcPcnfni37053BicRy+vGN8Rviavwi
         fiScHJb4mIIdX2aOrXl0LXO+zq7bXwFB40qm5SI6mzEPPc40k3anAfxuvkUqzCLm6RIj
         0JDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794148313; x=1794753113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=liy1VmXlPKvtQbzDRyOlq4Ft68qogIpqnl5phnSa1P8=;
        b=wBzlob8l0IBMdO1A3VprJwRYF5yXPfXTHozmktzGyJ5nE0ZvfcPAin9BsVKU6rU9cx
         /eoBLnEnlhASN7rVt9ZZogE4r+O4ylZx/8WZ8zcL8v8b0ZyJ79FBsQvQ7lLmRIBV1zWl
         B7Kp6iQYhGP5gg20HjYSiCwDxhiUTnoqRj4txo5vf9MJDPg8ZmD9HQ6dd77j9fMvQulg
         TSVztvQY7frFYpOSehyNDjQE0FZxza2C+dLkpDAHsM+MHlkrNimbdrqbc+ci/i4x87Cy
         e5HMPJRhjd4et+S3712oBdjUsGtbuFEOcWhw3mVE5UvV/A3nczbD6vQkl9yEBLFrORPS
         YDpQ==
X-Gm-Message-State: APuU4Z8Tm7ZQhazOEWhwS4m2GfkWid2XiYzzL+459+juerHnoFJTRaJq
	jEriIzgZIAYSZsbtn9XEHT9Q4a+ILC1ilH3FKefEUnCoMEYh2FkaU2eq
X-Gm-Gg: AYBFou2fPwdeHzVIW7AlU+CltbPQ2zJrtfzJF6qfFuPz8UbyyaiB3lHVh4/bdSCGcUD
	lYcWYsCXOap2DR9G1iXY6imJMrh5tjfp9VTLlYIaTxPNE5G9JEIHBGj8luPuy2uv3mRry+Z/fVO
	d7yaJIe0gCzqZ5SckIA8vY7XR3DzRlwZuL1E99Tv0fCc8ybFWKPDFVfuhLaWSQE/UwSpwI9HDj0
	w1indjMYdO4g+Z9RfBZQexaGI2rSQXQr5+FgybSDVZqZcJVcfO5RSIXYVyNp56mnt4AXBOEnUfK
	gbiytUZyQL7FiuQCW2xsf4qsZKI4huWmOMU5Df5wNsPme5pgWyYDdpbPHHh+cxAQBs+rptmwKg+
	6KgkV1I0e2kYy8HI7HMGRwMEeai1v/GQKtB7VM8/GuInz2uoAJh2+Jj345Ocm1nXaeIGtHAp8x6
	6kFm/Ynfdd0FX/WO2nv1KKn0RgILdBbq1xzbvID1NRq7qXMEXv2Hn1SsEmTN/4+JVdecEI9yNXw
	mtfzV9DY6V8eV/RHvCryWZ49+fVUsHoipt1dyDPL2wp1+zMsRgsGzyjHaE2nj/rzZ+Wbki9dE0i
	GTTfgjNV0OlROyrdfQKYRHCbQY1u7ck=
X-Received: by 2002:a05:600c:c4a6:b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4b963c8eb13mr31501935e9.23.1794148312740;
        Sun, 08 Nov 2026 06:31:52 -0800 (PST)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee2b8c0sm68486485e9.9.2026.11.08.06.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 06:31:52 -0800 (PST)
From: Timo Joannin <timo.joannin@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Orgad Shaneh <orgads@gmail.com>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH] mips: cavium-octeon: fix missing prototypes
Date: Sun,  8 Nov 2026 15:31:40 +0100
Message-ID: <20261108143140.157628-1-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The compiler throws -Wmissing-prototypes warnings for
several functions in the cavium octeon architecture code.

It occurs due to a mix of hardcoded prototypes scattered
across C files, a block-scoped extern declaration,
and missing header files.

Fix the warnings by:
- Moving the prototype for octeon_fill_mac_addresses() from
setup.c to <asm/octeon/octeon.h>
- Removing the block-scoped extern declaration for
octeon_send_ipi_single() in mm/c-octeon.c and exposing via
<asm/octeon/octeon.h>
- Moving the prototype __cvmx_interrupt_gmxx_rxx_int_en_enable()
from cvmx-interrupt-rsl.c to the cvmx-gmxx-defs shared header.
- Adding the missing #include <asm/octeon/cvmx-helper-errata.h> to
cvmx-helper-errata.c.

These changes pass the compiler's -Wmissing-prototypes safety
checks without changing any runtime logic.

Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
---
 arch/mips/cavium-octeon/executive/cvmx-helper-errata.c | 1 +
 arch/mips/cavium-octeon/executive/cvmx-interrupt-rsl.c | 2 --
 arch/mips/cavium-octeon/setup.c                        | 2 --
 arch/mips/include/asm/octeon/cvmx-gmxx-defs.h          | 2 ++
 arch/mips/include/asm/octeon/octeon.h                  | 2 ++
 arch/mips/mm/c-octeon.c                                | 1 -
 6 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-errata.c b/arch/mips/cavium-octeon/executive/cvmx-helper-errata.c
index 4b26fedecf46..4ced03c18ad8 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-errata.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-errata.c
@@ -38,6 +38,7 @@
 #include <asm/octeon/octeon.h>
 
 #include <asm/octeon/cvmx-helper-jtag.h>
+#include <asm/octeon/cvmx-helper-errata.h>
 
 /**
  * Due to errata G-720, the 2nd order CDR circuit on CN52XX pass
diff --git a/arch/mips/cavium-octeon/executive/cvmx-interrupt-rsl.c b/arch/mips/cavium-octeon/executive/cvmx-interrupt-rsl.c
index d23f46736dd6..314672040f2f 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-interrupt-rsl.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-interrupt-rsl.c
@@ -39,8 +39,6 @@
 #define PRINT_ERROR(format, ...)
 #endif
 
-void __cvmx_interrupt_gmxx_rxx_int_en_enable(int index, int block);
-
 /**
  * Enable ASX error interrupts that exist on CN3XXX, CN50XX, and
  * CN58XX.
diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 7497be7b9431..a1159a3d7f78 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -1156,8 +1156,6 @@ void __init prom_free_prom_memory(void)
 	}
 }
 
-void __init octeon_fill_mac_addresses(void);
-
 void __init device_tree_init(void)
 {
 	const void *fdt = NULL;
diff --git a/arch/mips/include/asm/octeon/cvmx-gmxx-defs.h b/arch/mips/include/asm/octeon/cvmx-gmxx-defs.h
index bdba676f1f2c..27b2ae74e948 100644
--- a/arch/mips/include/asm/octeon/cvmx-gmxx-defs.h
+++ b/arch/mips/include/asm/octeon/cvmx-gmxx-defs.h
@@ -2256,4 +2256,6 @@ union cvmx_gmxx_tx_xaui_ctl {
 	} s;
 };
 
+void __cvmx_interrupt_gmxx_rxx_int_en_enable(int index, int block);
+
 #endif
diff --git a/arch/mips/include/asm/octeon/octeon.h b/arch/mips/include/asm/octeon/octeon.h
index 5c1d726c702f..ef1eb000f46d 100644
--- a/arch/mips/include/asm/octeon/octeon.h
+++ b/arch/mips/include/asm/octeon/octeon.h
@@ -31,6 +31,7 @@ extern void *octeon_bootmem_alloc_named_address(uint64_t size, uint64_t address,
 extern int octeon_bootmem_free_named(char *name);
 extern void octeon_bootmem_lock(void);
 extern void octeon_bootmem_unlock(void);
+extern void octeon_send_ipi_single(int cpu, unsigned int action);
 
 extern int octeon_is_simulation(void);
 extern int octeon_is_pci_host(void);
@@ -47,6 +48,7 @@ extern void octeon_user_io_init(void);
 
 extern void octeon_init_cvmcount(void);
 extern void octeon_setup_delays(void);
+extern void octeon_fill_mac_addresses(void);
 extern void octeon_io_clk_delay(unsigned long);
 
 #define OCTEON_ARGV_MAX_ARGS	64
diff --git a/arch/mips/mm/c-octeon.c b/arch/mips/mm/c-octeon.c
index b7393b61cfa7..f6b890a89ea1 100644
--- a/arch/mips/mm/c-octeon.c
+++ b/arch/mips/mm/c-octeon.c
@@ -62,7 +62,6 @@ static void local_octeon_flush_icache_range(unsigned long start,
  */
 static void octeon_flush_icache_all_cores(struct vm_area_struct *vma)
 {
-	extern void octeon_send_ipi_single(int cpu, unsigned int action);
 #ifdef CONFIG_SMP
 	int cpu;
 	cpumask_t mask;
-- 
2.56.0


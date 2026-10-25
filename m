Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792913510;
	b=Gvt6CT7YsYCApN69ftf4ZoP0CC5z3/F6+/MGI/dcnfDxwWkGXy6lqdZAt4XtXUiU8tOH
	 p8I+AtmCeaJ6AofPgeR22jUcdo+CR1qU+hoIsAYI8cDZA120ZqaYgDL/CAHrHai2XgkWC
	 iLjawL5vUAxBzpNNa77Dvw+fN1KJjKjo+m6zVu4205n9J8uIg/PJ3K8pG+CXFBi2Cdk/a
	 M9QfJ/HBm1kTxxMW8lEFJKCRYWJE7sVDfzjR+SCNjaoBc2IhCJ1JP96MCAOJ51LOqyEg9
	 TpGCdHmVzfuo3bz2arXvh1mRcawtwTDOBVGxHP/OFfuZ9UMfD7nyuVtknYO8tatziOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792913510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=FcxHNNwYWKeHjjE84+HBT2CorhyixjN1OSIrgYoYL2o=;
	b=5BU9p09cNcq8cPodJ0OSDDaCGhDlDTd6ZS/XpFAig4/mSQDknOuRBuWm9Bzq3CEaIRDp
	 jNgAW0lFy1GRKFz45IUFw7Qq+mr2uj2GOVz2j6R7oOL8VTz9Xn11tfLyo32EK3jhdTJKf
	 H+WjG/I2iWHfZKbRGxxX/p348ZSc1/6NiI+h8RlrHC7sU9tDI7fLgFemH5Q7ZjdZoEJLr
	 PYByUXqdsV+xf/8oSkKfm/mqZKOsYLF+bTDRi7dpoHikZ1j6csFl6eINJubBZWdrb+STV
	 bsBRxDDtgxSCgLs++jcHhW7OI7VQfZeh/svzINVebJvxlYyFCAhuNOVeKRMYf6gNivg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="y/cWJBta";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6513606A31E
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 07:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6513606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=y/cWJBta
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so7923935e9.2
        for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 00:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792913508; x=1793518308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FcxHNNwYWKeHjjE84+HBT2CorhyixjN1OSIrgYoYL2o=;
        b=y/cWJBtadCDkUwIRpDUyDF5RbDvZLEt7trvtu32AONUpv2qtZ/5z8xKMdwnduPNzl9
         nqvJQEGOlpTj7aim32x0J0V8H7vJlfNwqOdwu3n1VNaRATIu/7a+C+6LPLH95n7ZdSxO
         u6nXz7Ra/FhYZpFB+i1fe/OIH2I0hnE1f5bZHROA0qIi4FZLqiRXVQK94y7c0coCLn1Y
         BclJ44/UVeJBr06j5UtqCRx6lb3b1Lq8KkYgEHqntYTLOxAKLHe9FHKPNSaYlQimlYzR
         dnFlr1Lxo2eFI0NZ5uVsO/UVugB6egCO559MjX2LORvZ0vRgsVPusMFHEZ7zWqRgvcv+
         mGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792913508; x=1793518308;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FcxHNNwYWKeHjjE84+HBT2CorhyixjN1OSIrgYoYL2o=;
        b=ZOCq4vQ436XPS8ejcySBC7R+Xxhjc2/EQDt0wq1rKMNnWI6z//YCdsaUbBhrS39IcQ
         oqyR1HesrWW/LlwaWIAdfodPcvuSsW2ZezQ4LVoE37NrNQNQHCxo2Q93oAjidDKc0V29
         cE+3yUP2kBIw/sP8CPdJy7kpQ5Jg9uMzuwTnlNKKUMQkzu8MfYE4f4uv9vWy8CDFBClE
         XlfCIzqHS09cfvkidj/G0t3QktTjV3UpyToSyA157yT+exouGFOBwGW3rjd79OQKmw2V
         wjlR+YISgU/6ip3NMdDM4pEni38uvPQn+zLU7CXzZlWmyeEmfPj3qxAzQ5vU2xJ7tqqk
         Rp+g==
X-Forwarded-Encrypted: i=1; AKwUvByLawRGwvuTPqoaa72D9n8iRMUlK8ID6BSBnDp0lgJBiDW6ZDAyTk2KKQtQj6xKUXpJwQ5ib59yAuJs@vger.kernel.org
X-Gm-Message-State: AFq9FYLCyuzvDOiQieZqkxe5ZriiUqe8xI18iauIFZTuWEyhkfHtyttq
	0SPUU2Syim61EQzdShzskSITEC59AsAfjJVucLrs6izPBR2CkJJ1rEQwOD+IS+Vxoby7dpvEQGo
	R48j0m7I=
X-Gm-Gg: AYBFou0bxwsGYLkfpOeJ6ru3MPgRriydBivj8fRRLvEFUjf2EV6lk5+9twihiorB6ox
	2nfDrW0tYxQqUC/XgO/eMfLwj/+PRM5kVu68j4CfsPONeGHpv5RRgUsfrmtaa977VVPhL5i5DoU
	yBpiNolKLrXfEdqx63bbjfGD9/aCI2rUwaWVemzkRCa8r3MkfS84+PG7nGnfC7vAj2y7X7GAIrp
	9D4vhVx1YO0Y3Ew8u0zdlOKAq6nL13jrPB5auN5AEUlGvHiuPPkn5cm8L6M0jFsDalUWWf11gbQ
	aFxrSo2e9/CjCN5mwovAZkroswFKSdfBWzGQO0LUCIxCvKoWy8KTfQxUrsP6aqDzVb9GjT5VdDA
	6f+I0eVooPdAr2FIrMVSfWPC3o+BjpkROa/ETyvayr07XzNqPlc0b8iO+5hd7BN/f7WW3IVP7aW
	tfD3QH7gM4FuYn9QIfdlF0cFS0JnxX2SgrIIWX7TDvKwAUGTPQOTbhwBgjKSnKiYxK58s4ZrwX8
	93SntMSxnujhLmruzuhh0P/fnSiwIue0bh9ZudE8wcAEQ+mWhqywMcH3qVc31mYcL0AaWygPx/u
	uRBR5zMPifBcxxlEHPIKUaMORHe2gAuJ+3Ng5lZWPiA53l5FwzEvyfOXhSUY9ojpuWnSLOzR6cz
	pHv9PdwUi09v3J6Y+FuY=
X-Received: by 2002:a05:600c:46c3:b0:4a2:fd2:9855 with SMTP id 5b1f17b1804b1-4a35acbd173mr62562205e9.13.1792913507871;
        Sun, 25 Oct 2026 00:31:47 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ae28sm107744875e9.2.2026.10.25.00.31.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 00:31:47 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "Maciej W . Rozycki" <macro@orcam.me.uk>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2] MIPS: cpu-probe: Recognise the XBurst core of the Ingenic X1600
Date: Sun, 25 Oct 2026 08:31:46 +0100
Message-ID: <20261025073146.25326-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The X1600 reports PRId 0x00d00000: company Ingenic D0, implementation 0,
which cpu_probe_ingenic() rejects with "Unknown Ingenic Processor ID!"
before any console exists.

The value is in the X1600 programming manual, 2.2 "PRID of X1600-CPU":
"For X1600, its value is 0x00D0000", a digit short (the X1830 manual's
same sentence gives 0x00D00100); the chip reads 0x00d00000.

Add implementation 0 as PRID_IMP_XBURST and handle it as
PRID_IMP_XBURST_REV2, as for the X1830, which also reports company D0:
write-combine through the WA bit, and none of the REV1 workarounds.

Tested on a HiBy R1 (X1600) on v7.3: it reports "00d00000 (Ingenic
XBurst)", mips32r2 and 1099 BogoMIPS at 1104 MHz, and boots to userspace
straight from the boot ROM's USB loader after a reset, so without the
HPTLB_DIS write of the REV1 path.

Co-developed-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---

Notes:
    v2: the Letux kernel's handling (commits ee3e4e8baeb6 and b799b9a5e4d3,
    Nikolaus): no SoC in the macro name, and the REV2 path, as for the X1830.
    v1 put the X1600 on the REV1 path, which its commit message didn't say.
    Letux's PRID_IMP_XBURST2_R2 (X2600) is left out: I can't test it.
    Added the manual reference Maciej asked for.
    
    v1: https://lore.kernel.org/all/20261023204205.48222-1-olivier@mgcrea.io/

 arch/mips/include/asm/cpu.h  | 1 +
 arch/mips/kernel/cpu-probe.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 0fd9f9bbd21f..c43c9364ddd0 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -186,6 +186,7 @@
  * These are the PRID's for when 23:16 == PRID_COMP_INGENIC_*
  */
 
+#define PRID_IMP_XBURST		0x0000	/* XBurst®1 (X1600)			*/
 #define PRID_IMP_XBURST_REV1	0x0200	/* XBurst®1 with MXU1.0/MXU1.1 SIMD ISA	*/
 #define PRID_IMP_XBURST_REV2	0x0100	/* XBurst®1 with MXU2.0 SIMD ISA		*/
 #define PRID_IMP_XBURST2		0x2000	/* XBurst®2 with MXU2.1 SIMD ISA		*/
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 489612ed9d49..7da5591f6024 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1814,6 +1814,8 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 		}
 		fallthrough;
 
+	/* XBurst®1 (X1600) */
+	case PRID_IMP_XBURST:
 	/* XBurst®1 with MXU2.0 SIMD ISA */
 	case PRID_IMP_XBURST_REV2:
 		/* Ingenic uses the WA bit to achieve write-combine memory writes */

base-commit: bfe97f12a0a64c3682be21a02404238e3b91e945
-- 
2.39.5


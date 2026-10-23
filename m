Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792788129;
	b=is9hNuHe8k1zRVQ1X11pTWuMiYrtXjPRxyoxXmSAVt1KioQK0zxFXGin2xfpUJw0J7DF
	 n0gP1EvdvcHQOD1gWemvsihV6Z3A2iMKkt8sITsOLXJ3eJ7N/jClOBBRAIjG2fQV/W33z
	 D2wn/n1wxjTLG0mr5Ewg5OcTi//E5lU5e+tB68M1QTspTAnN3PyTiinUoCznh2vzibcbh
	 vgS228vV3Sd7j86lu1UeFd3GyH1CMiNmDnWlpgFxjS8bkLtEtFsmYMJX9v/uIt5cvca4L
	 vgeV4F9yk73wXZoq7/iWL943pMHdhb4QHNmFeZ+io4EzkXHHAezzDhjrkVDxvPUpq4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6PCVir3npc/uS+4yLjSPNS2cjSBLb6KpsRqgCKleykM=;
	b=Hyv/h3XxZznkwrYh/6nOWvSJD1LWMCixkpUFfUPffMfAT9xXCdSAeik9jD01McY1z4Qq
	 /UYV3JpyJbBI608m7pn9Bo8PBh8VML0L4pER31hpUZyIc4iiFyekWpnqfUrShTGgLhCl0
	 S/9YGxJIPYeCVQRl+kzmIt65WZnvCbRJJOw6ka27dH1wHUWZuwldCg0n9Nfy/MIL9rBLy
	 +t7h6loGA2NR3WW9mCTAUcBRW47KBrnu4UEjtcjpRTTsu+CFoactpR03f5k0VmzGyox6g
	 O2uNjmptDhyVJapk6lQc715FI/ScOjU+3uPcAdrFTekPN1AFqW8e85D66cyfqdyX7WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=wJ4TYCH2;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B173E606A31B
	for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 20:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B173E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=wJ4TYCH2
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so10039485e9.1
        for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 13:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792788127; x=1793392927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PCVir3npc/uS+4yLjSPNS2cjSBLb6KpsRqgCKleykM=;
        b=wJ4TYCH28ARZj3dmJxVUohrPxY5RKX1Kuc/zNHfUzZQGJzsKxHQC+/dVLBtcfifk3X
         FnyFJ5rQno3hE2EO81iWdZL9ql6k/5y+r25vqKRqrBS/dXKjkWe0l59LpKAnAr+WhvrT
         cqUEimZlhBVoS8F97HCV4IisScb0ypbECnzkHe68qlThPBa2hpeN92eBAzUfXeXW/Ezz
         bbjAEoyyTqimOjMGwg4qE64jRcP0ZOosOP+vYHnLrHOlHP/MICCwEIskNA14S7QutRYQ
         OPtEXFJjN/0epur2Kewt6C4PoroPFSH+LcMFYFc8mwXqgZZLKO96I2R6sBjGct+UFbSH
         j4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792788127; x=1793392927;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6PCVir3npc/uS+4yLjSPNS2cjSBLb6KpsRqgCKleykM=;
        b=klhKyUDqjaGR0Bz2s47JvKaIiMRvFu7UdMruTRIlNvsiDYjcve9HOHYuQw2Ss4ieo5
         VKRvoUz8+B0dSYJcfMDc5O81+3dCppoxG+UJfdMQbnM55AD08R3t5PQGv1mkuyRbGSnz
         H8G+pa35PWRHxZxd+i70ZoecGTW4hMz6/6LXqS7KzxX9MsI0L5Jal8+j/un9jl8x9ezT
         TdKtd8qo7pIN+DmggTs13SYCBDx8K0jVedhVBIUM1gVyk2kFo8ZqWFjnfBB+O0Yj7KiM
         eeAdDPCKbykL7sphdlwCyE0oWGa+DZjmMcnqDYxrXsVB+QeVpHmGdNdcgWyUz/+Foj3h
         EbKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdTT9VQYJpkrBjJb7dFFAa/rPl80+Z9i02mtSpoT1XmBNTQUfOgOJ8IwwQnOUO3NXvvk8PvKyM/4x3@vger.kernel.org
X-Gm-Message-State: AFq9FYLARfWex31SL0OAt1VlCsv5PsnFkuQL8st/nicClD9dzmJlcAuD
	sxsaTisloiu4bKwtDN+ovG79Amclp5lv+u7AJoSbdgnzHY9AWnfqK0oggp3w9mb4OBY=
X-Gm-Gg: AYBFou1Gtdp9tRJZ3wbdJWMB9YPGASSEjgQuZwB8tah65MiFfoP1OTBzDb6zYVbmzkG
	QiZNRVmwj40GM1zoRSnadfeG2Boy1cZ9gttjogbRFGg9sZ5X0jzsDtrA+hr2+A86wJ6+hwCaA1A
	ZlScZtxRtwXWyIAhlXeIbZGzJ2j9wtDhY+DndfnTvZyvEY8kMv2LqysrzLbSR5kPbFDN76qVe81
	x+v0m9G+UMk/PSVsK5bl02hEi0d6w2xTgOUa+p5FinBZHXmN7OzqwDaUnnPa3AGW5rmuryObkuM
	PLQGyMnvX1ToMeGftZWTRPsrrxXPjZeFjf/PYiQY7cMWN1/cbFWOU62OuTQfGfsmeMLHZlfiWMQ
	gNfaLw/ViCHtN1m6gdCXnnWEC4u/nVW1dv7xhdDluECITfyBA8YH2l1C2H5jRsyBKzrobXY5D+h
	SQMKYyJL+BPr7PJyJg31gQ7qYjJry2NttCVZ6Ube2aYtOcCC3a73Av7OkQhq0CZ1DQdIeDLqWp7
	C95uTkqR/smAUsiCsCvki31StCCpQKMYqVWPlJPegnRndVRLBao8plFcQzm4Z1I8OgYH9aPzazP
	0Y0G+PfG1eQ=
X-Received: by 2002:a05:600c:818f:b0:4a3:2f35:38aa with SMTP id 5b1f17b1804b1-4a35acab86bmr610025e9.29.1792788127005;
        Fri, 23 Oct 2026 13:42:07 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a09434esm7985305e9.0.2026.10.23.13.42.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 13:42:06 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Cercueil <paul@crapouillou.net>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH] MIPS: cpu-probe: Recognise the XBurst core of the Ingenic X1600
Date: Fri, 23 Oct 2026 22:42:05 +0200
Message-ID: <20261023204205.48222-1-olivier@mgcrea.io>
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
before any console exists. It is an XBurst1 core like the X1830's, which
shares the D0 company ID, so handle it the same way.

Tested on a HiBy R1 (X1600), which boots v7.3 with this.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 arch/mips/include/asm/cpu.h  | 1 +
 arch/mips/kernel/cpu-probe.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 0fd9f9bbd21f..ff7b63587daa 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -186,6 +186,7 @@
  * These are the PRID's for when 23:16 == PRID_COMP_INGENIC_*
  */
 
+#define PRID_IMP_XBURST_X1600	0x0000	/* XBurst®1 in the X1600 (PRId 0x00d00000)	*/
 #define PRID_IMP_XBURST_REV1	0x0200	/* XBurst®1 with MXU1.0/MXU1.1 SIMD ISA	*/
 #define PRID_IMP_XBURST_REV2	0x0100	/* XBurst®1 with MXU2.0 SIMD ISA		*/
 #define PRID_IMP_XBURST2		0x2000	/* XBurst®2 with MXU2.1 SIMD ISA		*/
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 489612ed9d49..e3b547307c77 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1769,6 +1769,7 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 	switch (c->processor_id & PRID_IMP_MASK) {
 
 	/* XBurst®1 with MXU1.0/MXU1.1 SIMD ISA */
+	case PRID_IMP_XBURST_X1600:
 	case PRID_IMP_XBURST_REV1:
 
 		/*

base-commit: bfe97f12a0a64c3682be21a02404238e3b91e945
-- 
2.39.5


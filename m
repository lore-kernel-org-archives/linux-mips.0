Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8254908CE
	for <linux-mips@vger.kernel.org>; Fri,  4 Sep 2026 12:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526174; cv=none; b=NgQ6Wu66HshJ3TwMEHbbXK4gvl2k4XyCE5seaBNHNSO0dkxL3B1w2sFBO5978ddOJWq2cqcmJoo3Vbr2K7DsZtjRWB0BaBA4lJ1GRI2zQ/sW+aRd4/GNIQ5jqJmyrJFoMPXK/ePdK+pPXifKcYgJfjnuNHoDVbF7u6IapxE6AOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526174; c=relaxed/simple;
	bh=wiJSAls5dG/l/lqMBo30eyrMskBWYHsQm6S11Wjm4Ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s3NWmgHcFrIm2cN+auMg/W3aSUJGpK30/yt80N6jlTRQIIxbAqoEUPB9JX8gvB0WCgtTztUr1dNNTlojLozz/jE3PukK4x6GT0jByRLW0LP8sohnqcu1LMraDxJDSD+n1ovswL4mZ8qvry0ACsMEbgp2oz7UXTcMfIap+la1vEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/E0R1aa; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/E0R1aa"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d91518a63fso7432495ad.0
        for <linux-mips@vger.kernel.org>; Fri, 04 Sep 2026 05:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526172; x=1789130972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z75uHTDJpbnqzAUrkWajIutbgvqHAjtR2ftrzWoM/Fw=;
        b=X/E0R1aaWMvFQQ7xTZLM/jtw+B675PqzKfYzsWVqmt4A+f4sxtBrlruTNhrlN17i7H
         8B+wwLRzqcdg1TEGem2WKVMGmfG5ttVwapWmW9BGRu9OAQNqlv9zZvmtGNPB53EbTTv0
         U8T1Z7jwd+61xVUXBj8Fok06LTLzTizieg1JvLMB8AUgH5tJZsmzZAuIvk/CrgftBnCQ
         7vzwbmdRce67wDxBE6Zj1MttKs/aADnz7YPkpFhGdVaUw1OakQdr7ZwgbwdKGi70af5u
         dYS66dgUdXRuYAwY7cdquOw8uy6A56BapfNd0ju9QIPq94cgBaSNtvrIX0OD2MGaSG1p
         KKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526172; x=1789130972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z75uHTDJpbnqzAUrkWajIutbgvqHAjtR2ftrzWoM/Fw=;
        b=buGXjymv2MJh++chhCs+y2Rox/DuSTFXorNM5toIyZk2ZVkDuSLJQsd7IWDV+1n4UN
         TDvazLlvOWjYni6oOARGOVyufgimlOy0C4A431CHxuvwPboM7TWl3oVknmrC2kKkra/+
         IRQWj0wXVpORENwm7nk9v2G5GgGd2alCqiRoM/0I9IxcTKq1GKUILL9BgTFWx1M3Z4SM
         sdiO0zpJNZqhGu3DDPFrzvT9BmYEHCQl9SYWQb/lrqaLLVyEuGCkmjy0Qg6n4qZrXlvt
         QOoAG8tid2MSfhA1NOgZoH8Ag1Gr63kNIq1EAbdbLTUuABlp+sWDx9lD+WNqlRChNbFj
         PO7g==
X-Forwarded-Encrypted: i=1; AKwUvBxlDUMUAFYU+olffTWK4LtsAs9wVSXUKyff8MttR630jaOeCap5m72x7IlGMF4X6H5ErP9KqPPIu2B8@vger.kernel.org
X-Gm-Message-State: AFuF++nfxaouWWE3ViNpNQTzCLXZOwuLfn/CSKPSJpC7F2kTdWpj9JkQ
	WRCfoLXjSk0XHbDB33BdQoIWXRJvOZZu/uIVbj9qDLi+h12JBZmfNTK9
X-Gm-Gg: AYBFou1A2CoCgBjeMJMFahhNJ5WwG17Rbh+1+FUMk9QmFvbyWMkEChSmeFmjQ02/Ifa
	vtAzjN9wkHgzjSnCLWFD0rAXbM3mQoRrdw4wzhseNt4DKbCdioEmiY9rFFbxrE8mhFO2ZjaU3XR
	s1N1emjgWM9kd49skJVqqeJ4Uk7k6u0WpK9STO1Bwm/56zgG4XKlX2gsDT497LATXTO9zEGhLpJ
	/lPRoVOpizOOSxwkq3udSJNu0iVPjM6AP4lp2fzY2qGmCM/LwRi5bRBN8YDIVu+l80k6jnVQCQt
	ULY887D6N+0qp/1j3Q93JcjalC5TTxp35bxs+VCXDLCpaa71fZl11MX/fXtB4eDPsQVETEdDihr
	omX4CXNwq2tMcptzXan+h/mAOpZfRNjtBX05OWQ+egJ26gHECM5r+WSk8g4r5oofzLk2geeTntE
	KGIJOsFQtUvHETqilhyQPfBtNowqKUI9TXPTR3IP0jpJfVSbYHTLrdqoL0wmnsYgy8Ak5UVy2bn
	1UoAPUDNRVgApA=
X-Received: by 2002:a17:90b:3d92:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-39b2614df9dmr9955857a91.2.1788526172098;
        Fri, 04 Sep 2026 05:49:32 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm7328079eec.30.2026.09.04.05.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:49:31 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH 2/2] MIPS: fix repeated words in comments
Date: Fri,  4 Sep 2026 18:19:20 +0530
Message-ID: <20260904124922.10256-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904124922.10256-1-hemanth.selam@gmail.com>
References: <20260904124922.10256-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/mips/cavium-octeon/octeon-memcpy.S | 2 +-
 arch/mips/lib/memcpy.S                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-memcpy.S b/arch/mips/cavium-octeon/octeon-memcpy.S
index fef0c6de3fa1..fb27126afc56 100644
--- a/arch/mips/cavium-octeon/octeon-memcpy.S
+++ b/arch/mips/cavium-octeon/octeon-memcpy.S
@@ -60,7 +60,7 @@
  *  3- (dst - src) == (dst_entry - src_entry),
  * The _entry suffix denotes values when __copy_user was called.
  *
- * (1) is set up up by uaccess.h and maintained by not writing AT in copy_user
+ * (1) is set up by uaccess.h and maintained by not writing AT in copy_user
  * (2) is met by incrementing src by the number of bytes copied
  * (3) is met by not doing loads between a pair of increments of dst and src
  *
diff --git a/arch/mips/lib/memcpy.S b/arch/mips/lib/memcpy.S
index 84f85aba6f4b..49408c0049f2 100644
--- a/arch/mips/lib/memcpy.S
+++ b/arch/mips/lib/memcpy.S
@@ -79,7 +79,7 @@
  *  3- (dst - src) == (dst_entry - src_entry),
  * The _entry suffix denotes values when __copy_user was called.
  *
- * (1) is set up up by uaccess.h and maintained by not writing AT in copy_user
+ * (1) is set up by uaccess.h and maintained by not writing AT in copy_user
  * (2) is met by incrementing src by the number of bytes copied
  * (3) is met by not doing loads between a pair of increments of dst and src
  *
-- 
2.48.1


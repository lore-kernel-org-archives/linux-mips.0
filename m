Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CE839891F
	for <linux-mips@vger.kernel.org>; Tue,  1 Sep 2026 19:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291246; cv=none; b=XXqzsD0274DmKqw4b8ntGT15DFhfcuOg/Vd63G2OFE6uPwQaoo8E1cRW3BG/jrMmD3JcnW8FNf1FjtqxUEYTY34D62u/sWdmK1OyUpJoXwvAM09uWYy0u/f3MjViWSiFPZ1hNzMhiPbYFE2k7X/Md7PzjyoaQu3KhlxeyJXnBQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291246; c=relaxed/simple;
	bh=T9J1gxfDHXIxdL2lKT0b9+PNh7/0tNrUAHtU91n6X64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lXtYXDhzsEt4GE+rfGfcxwY+ZcS4tob/ELFwvMmCtbGkoLr72UfXZjKGnZzUUzr9p+hmnz/R1mQAz4HQDOyRto2v+2b6c8PlPCrYSdR38HGTMqz2CnsRFPt8DyixjfwZWn276bbBgCsLwKT2e2dkKCiM2VncLz3QSfM9r+lPc6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KY3smrA6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KY3smrA6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso1433255e9.0
        for <linux-mips@vger.kernel.org>; Tue, 01 Sep 2026 12:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788291242; x=1788896042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2OfNYzeEIu4hE7s+v0no5iuQlcG0XuJ4sg5AErZQdU=;
        b=KY3smrA6vdSJ0S370Q78Po1z20FoRLW9kM27A97eh6fu19FyfpA58RFEu53gUfbTTV
         n4KCF5AGTj1RRSphCkqjjm1jkWkDYp6pzrUCp3Cl3a3C8bu92dYiMBBENWIEjFiny64V
         SdDEPiun1RwOyISKGRpECOR8JEf1gJVfNMuY545HfeVeU5mSQcfRuSe5zhWkJxyfZ9eN
         aapVjA258MWzGXOJV/ULa/HPF8skxI3zeqswvt3iYc88EoqMSnjd0gEoyMJC43oCZfCI
         3ECyNRqL23B2N6tsuBsF4aA5N/FSwD5AB84KlUhbog6c967AUY5udLXDa7Xuabsd9LUb
         hI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291242; x=1788896042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a2OfNYzeEIu4hE7s+v0no5iuQlcG0XuJ4sg5AErZQdU=;
        b=foUN/16gjrGuYwvcVaZfpfaTQUJ90Y1OrrwIxkbW7UVCq+96XE4vz/1q3bmYe83tiU
         n2TzEIpQOmZpNA3LMSbvH0Bys4ufQo9P870hcAbfsQEl1baKepBIG/58xdWmRfuxGdUs
         tI4BevY4cYo6CKcOVuH2UymNe4TM/K8bCK4tnxfhJloORbuaMocSWrp3lEpp/7GrKAOe
         3MMwBLqLW/Iw3APhhcIiYGTS2eRSjIIaC4qXb4k7JltMj41wbygpTohHId1NQ/daJR/p
         AIFvipkQLSl0dtMtxA5jMlLhDjcD7ZbeeCnnS0X/b81Jar/4aNkeWmCttpsfPtX8+tud
         rZaw==
X-Gm-Message-State: AFuF++nroRqs2yVynhzn0g9mRieEglndtZONndI1xViwIqbIGHj9zY4f
	I8TouUbXLVea/Vi6lQ0edhXhAwamAJfqDzC4Joq3aKC8yZa4KWmlqT4C
X-Gm-Gg: AR+sD121Ou7DpcshZOnMOeQZJt9BXKfvrQiX2/VnHxqbfqkEPCIdYE2hCQ3xT7rlBGd
	2N3V25ThIdA8rpiMOjhQRsWyEHmjrIOn/0H7rzXeCHTAFAB8GgLoHnru6yvojDtIusqfN0RnP4N
	NyLbBSBlRHnuxaww0j2+FMf4oRu3fqSZFl+TvfpBhhw0S8hdURVXz2HUrDXcwfxcF0wdrMCWPFc
	9GVbwco4rK+kCca6ANCl1lOn1WBm9mrZV05JilDUW1Dm2GfIpBl02Og9e2n/KARoI4AJ7pRA+PJ
	kETpkWmH8Qc8vxap5vGD7hw8EPMdqsHiXmnIl4pubuJNl13aClziCet0HfBrecSkHE+4tBHc7YF
	Xpz2epV+gz3GKFv9/XTW4t7oewDA8PplSxKzNcq4JwtF4je+Czb4+YitRl90c7OFmoB5Umdx0cz
	mmKCS799EHZJGGoqXsWy83NJlHInZ6VN6z5TGEXPwOgpVKLrQzcKSja/WzanwaEdJfOAZOLR3UN
	UyxsejWFCUMyMT+lqh43/62RZbfTmWHeqoTOcbvSVFbi5rohx7ePPU3L5NqcggTqYFWzZFD4PQT
	Z/kiBw==
X-Received: by 2002:a05:600c:4f92:b0:49b:90cc:3c87 with SMTP id 5b1f17b1804b1-49b91c487b2mr576060905e9.13.1788291242049;
        Tue, 01 Sep 2026 12:34:02 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed3840sm1099834f8f.17.2026.09.01.12.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:34:00 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] MIPS: Octeon: apply USB FDT fixups also when USB is modular
Date: Tue,  1 Sep 2026 19:33:55 +0000
Message-ID: <20260901193357.1352617-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827175728.1574-1-orgads@gmail.com>
References: <20260827175728.1574-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The uctl/usbn device-tree fixups in octeon_prune_device_tree() - which
set the board's USB reference-clock frequency and type from
__cvmx_helper_board_usb_get_clock_type() - are guarded by
"#ifdef CONFIG_USB", which is false when USB is built as a module. The
fixups then silently disappear and octeon-hcd sees whatever default the
DTS carries (12MHz crystal in octeon_3xxx.dts), leaving the PHY dead or
the bus erroring on boards with a different reference clock.

Use IS_ENABLED() so USB=m gets the same fixups as USB=y.

Fixes: 7fd57ab9d9cf ("MIPS: Octeon: Fix compile error when USB is not enabled.")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

v2: no code change; added the Assisted-by tag for the AI assistance used
    (Documentation/process/coding-assistants.rst).

diff --git a/arch/mips/cavium-octeon/octeon-platform.c b/arch/mips/cavium-octeon/octeon-platform.c
--- a/arch/mips/cavium-octeon/octeon-platform.c
+++ b/arch/mips/cavium-octeon/octeon-platform.c
@@ -18,7 +18,7 @@
 #include <asm/octeon/octeon.h>
 #include <asm/octeon/cvmx-helper-board.h>
 
-#ifdef CONFIG_USB
+#if IS_ENABLED(CONFIG_USB)
 #include <linux/usb/ehci_def.h>
 #include <linux/usb/ehci_pdriver.h>
 #include <linux/usb/ohci_pdriver.h>
@@ -1080,7 +1080,7 @@
 		;
 	}
 
-#ifdef CONFIG_USB
+#if IS_ENABLED(CONFIG_USB)
 	/* OHCI/UHCI USB */
 	alias_prop = fdt_getprop(initial_boot_params, aliases,
 				 "uctl", NULL);
-- 
2.47.0

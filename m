Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8C549365C
	for <linux-mips@vger.kernel.org>; Thu, 27 Aug 2026 17:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853460; cv=none; b=Mw2jh6vE4o6Nuc68dDmnpuyvJpUP4zx6yAcZPunDMv+/LbGJ2ORZCjTlODUdk1oWUd/AltEA5yFzrfdaOhXigl51Ck+c8qoTOeSAsA+KCuW2C3cbY+acTIzUZpEryPCW9X8E/QcmadCEnmOjXHgRHLQbJCvPU4+64cp9yWsvJS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853460; c=relaxed/simple;
	bh=BFndmlciGHzeOgBCzrhNA/MP72XWG8rgm3n/q4+pMtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gl1mM1f4IXenRofS1jk9OnrcvYayc7GJD9ELr+li9twLjzg5YqoRNwypXScrgjazmttiRkZGw9OQ32G/dMHcntF9ExOj+r5WKNUFJkIxFK1AYN5OHf+HxweTmcBHc1zw12ZXUrkXlxhRWtM5aZxgYoQT5A6XdD7dfi1VMqh3jIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfsPd0TD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfsPd0TD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b14637dfdso327995e9.0
        for <linux-mips@vger.kernel.org>; Thu, 27 Aug 2026 10:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787853458; x=1788458258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAxoG/7M6yngkwtA+SjYZNvGegIxYBuYl/S78jn2qhw=;
        b=EfsPd0TD3SsBtax8Q7jr/7wZimnsAm5y4S+hMBlzpQxlbyO/iauuAxUWeC9P0goi4J
         EjBrwUBn9VATZeM5KN4GNYnLm5GxWQQ11bPRXckeQWvQt76N5XhQc8JO8yJq0aB1fO/8
         Z7rKv+Mtq8a3DPQfaxpwzQcsJRYK0bYVj4e4+Br1eR0dNCjSJKkz03nxUJWeOq9vapEW
         JYiBcs/axDXVOZh5tvuFcYO7whfE7rW6VNmqQYU3woJk1RAPn5CgTl7JSby4zsrMNy89
         VN7zTBkgQ2llHyRYRXBTkrCsR5JVGCJzFzrkOOLFsSp8lt2GSEKbTNPgS0HScbKUA1cV
         7q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853458; x=1788458258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAxoG/7M6yngkwtA+SjYZNvGegIxYBuYl/S78jn2qhw=;
        b=E3JDfLZRS/kjFw3AUqadWAeM+ZkHo16FK/62zFXz3BOmaFoBQZEdyx56mLYMw6oAh4
         K4iNKfrUBxVZH4SkO39MDCkbLqe9ciVpnfeF2Yxv2eyuxXXQJFCBF3D6oj3e7K8utUgz
         Zl3ESzkZg40KUzsjTfvQRmvIt4yQVhsd/15ifR/6syg7KfQCP39+qkBcWthHfyKwrXmo
         sYmcEhZZbz7AYCMwX2anShwYOzPkkDqu50XX3//6kHfZlGAc6uMjCkYcQ1AYlIR02z+T
         juRbFG7S2TLJewj04kerCUNMg84vygPhjVp6JTddf5ecevNAmG3S5e6WCYwEiMiLdIbo
         RpEA==
X-Gm-Message-State: AFuF++khav8Dqk/g6n1E28zvrYjCYp0s1saUwHo7rLUiX2XxBg8j3tVy
	djXTG3G+/0egfdoKMhjBjSWzbxNy7G4Rj/weeNpH8o9dk09QQ2ddllHF
X-Gm-Gg: AR+sD1013E4UZxMcUKbtsPdPTlkLtbluziG6+2PLnbuBv+A1loiVBW3XDwhxWtts6A2
	/U6Pwd4yxJS/ey/CEDKbJX0yNl28lIf1fT5eZaQ6hmadd3Io6W9lga0Y6s3xuHGXT64wVaCcN0c
	xJ9Xaq4kSDazzTkbcdZYidLDtadccAVgzQYSsrXOUQi+RtXksrkK7O0Hr6nvsOS+gwlRGOM1nJe
	iYc+Aa63LWiMtYY55Q5biX67/llV6ynSf9LEMRU2qyb+Yt7YGk9qt2n3fPGIJYZafQQ7Yftx+Gx
	fBThDDmFt1NL8LHwkwgHg3uja+Mcjy7bAyNDHfV+Tr+QF+nuHQmsLOvW25BUJK+xogzamZp/d7A
	2Bb2WuFzhbKFUUh4sGVyfwhaf4tVqfECIAadCR6dKkPBaegvuMoIhZ7UbbGeL5297r/Py57RJgW
	Y9fBxi6inGp/9YU9W0xRmf+UkF9JQ7vqnyX6pU/jeGsY2L41If0nyEA0GbOdcVYHvWCCf9/GMr9
	EcBnVYi/fk/A3gHCBY0s3Eh0r+E3CjawOGwRhfP6/1TbtUDWOjcvTo=
X-Received: by 2002:a05:600c:3513:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49b91c4faebmr9674645e9.13.1787853457735;
        Thu, 27 Aug 2026 10:57:37 -0700 (PDT)
Received: from il-orgads-lp.corp.audiocodes.com ([134.231.187.64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49eb3b21sm71905795e9.8.2026.08.27.10.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:57:37 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH] MIPS: Octeon: apply USB FDT fixups also when USB is modular
Date: Thu, 27 Aug 2026 20:57:28 +0300
Message-ID: <20260827175728.1574-1-orgads@gmail.com>
X-Mailer: git-send-email 2.53.0
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
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

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

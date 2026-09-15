Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAEF31E84F
	for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 07:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456416; cv=none; b=Y+oUe2gVwqpobpax1EirvOF1ZLvpbLAuxB5hH+ciwwsRimNMv964WVUvNAAq0JVo7ln6WfabNL20r8Mdi9FRT1t9R/eu33f/tXQHHOny2hfE/6FkCGfhE9HvlJWltPwR3zCXhH1H1kfapIaLCkZnefCVDaxi3dJZRXVYbfNj/rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456416; c=relaxed/simple;
	bh=UTsJbixj5f5upm1yDL4v2oYlqoNy1xwwPfF04Oakgjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bBqGoqAEBt5uStARD0IGqFTDWPRQwSMRonWsw031bC0sKx3ETHwqdcEpzcI/xb8M+XyCxvw2W+yoQjluCiMKphPZQSdev4WGn01OUPX6lDNLHzJIhbgxWc7/iXDnpit+Og12XgYHiMDaiY2FbYW/2jLsDqV9aHjTGnbI69EK0L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdeQMyLY; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdeQMyLY"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so31220935e9.3
        for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 00:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789456412; x=1790061212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3/q6Adnz7lpVRwZWpJQefNRmiB7gYNF+Y1dkZ8i2uhk=;
        b=TdeQMyLY483Qp3Ir6tu8G6PkGn6zU2tSNhUlJuxdPVNh6QrxeOSx0ZvzVGn3YZaE2i
         jsXLQpnqLRsGCnCCl+SWQz2U36ut6w/rJp2DPnwcSnIuKg9m02l+CS9DvG5IOD88bmnJ
         804fzUEtb/ji/A5EsdGcWuLSO7IxCSO9vo3gYwkvRgPyUg7hNRiObI9uKfGRY8KmXVmU
         lVVzBNjmh4mH+Y7hz1z0Sbq5Lc5+Gjdi/6W9/42Yotkzi0P08HGaXlg0W9PUQozt+ZFw
         x4jiZcyA6inmc60uXUgXidAfiaerZU2bcmEgwvf5z1PmgroC1/U3JylX2a/flHzKcuB/
         5+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456412; x=1790061212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/q6Adnz7lpVRwZWpJQefNRmiB7gYNF+Y1dkZ8i2uhk=;
        b=dGLKH62g7cewEvQEPwqA67BL7QBysU8m12kenB82hOv2DvlxOp5Le7GkexYojBcvRT
         W/EAhaBJfmIDsCXovnlLJXKL0EQx1i2DFdje1xm+scDuIccp3ZgAVcKnIK7zUwDSIGis
         GpSDtGUSIq9z6d//nmxpiY484u7qrsVeStulJfkRZ5URJjakFnALrJWNEhnyDyr+4s1G
         uJvoBaVBDJcek2gYNzT9BnS6dbLBe6NvWd7HpqDy9wOReNvuWObOyHPPRUDaoDji27EL
         hcxTvmKiEArnuraDA6vdoBCrPoWq4WY6S8vUvGEHXbfzLQIN5OkyDiamLFTgKlKrjS/L
         Iniw==
X-Gm-Message-State: AFuF++n1m4MlE0OiZeNOtp7+zfmgfzWN7+Rw58dfyfg3qaka4r690keH
	5zBUX4jL+HpatCOwjtpl0ECI/sR5Wem8Zzn26fIqp2lYmspsWSRiI8+Y
X-Gm-Gg: AYBFou0KLd12yvJAnkB0MYTxgdj6xujWgkBVfKfA8OkEixUHoJB2oFa+VjB4vdZyVck
	SMwjtb8gZBlK1IHIQ9/4hAi47A6qY1qBwLO0JqrC5YyHwPheR1YsSvTg3WxontO8WolJNdTOyg/
	jx20BGeRD4UZvAFIl2dyRf2FdlZBbTQYPBiYhpoy3ggz/hJAw2f8Hg/NX+HKUy2SOUZi9AS2Hyt
	s1YzkJT1xD3tUJ6zmN402J6jfRCS39GAF/U70/OoiNOoPGgMrzYD/+NYwvlYwF5Shp7W2qou5aW
	6appQcjI9H+L8ytUQApCgjGqxDWotBW2uth/+toS3BgCjGbGMxagVBA1+DPA8RsEzPLsBswLyhk
	tPDABaUMnJeZ/h4Zko5Q4WuLzVe3vrkj05EU0A6J1RHTdKJg6GKcwRCoyY/6F21OHctVOMuTpZZ
	EDXwxJOU8Rbclb9oJSdHA5L9hoYFeqdqydVa65/RghS99bDqhOAhllyWU0MG/9DxaiBG8B1+cxM
	A1OEwl0b9wAu7CWF4hj7ujS6vMOoz0MdlQl1J7e64pis315AkozU9sYm+uT9r7r755Z6atVYT/8
	Pev79rktXxxN3Uy4aQ==
X-Received: by 2002:a05:600c:3586:b0:49e:747e:c00e with SMTP id 5b1f17b1804b1-49e7a64e729mr82091545e9.9.1789456411633;
        Tue, 15 Sep 2026 00:13:31 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef735cesm42941345e9.6.2026.09.15.00.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:13:31 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	osalvador@suse.de,
	stable@vger.kernel.org
Subject: [PATCH 1/2] MIPS: mm: align hugetlb mappings in arch_get_unmapped_area()
Date: Tue, 15 Sep 2026 07:13:24 +0000
Message-ID: <20260915071329.15125-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since hugetlb mappings were made to go through the architecture's
arch_get_unmapped_area{,_topdown}(), every architecture that implements
those has to align hugetlb files itself. The generic implementation and
loongarch do it with huge_page_mask_align(); MIPS was left out.

A non-MAP_FIXED mmap() of a hugetlbfs file therefore returns an address
that is only SHMLBA aligned, and the kernel then installs 2 MB PMDs for
a VMA that starts in the middle of a PMD. The consequences on an
Octeon (CN63XX) board running a process that links libhugetlbfs with
HUGETLB_ELFMAP=R and HUGETLB_MORECORE=yes, all within a minute of
start: the neighbouring 4 KB page table is clobbered, the TLB ends up
with overlapping entries ("Caught Machine Check exception - caused by
multiple matching entries in the TLB"), process exit trips
BUG_ON(start & ~huge_page_mask(h)) in __unmap_hugepage_range(), and
freed pages leak into unrelated kernel structures (oopses in the irq
maple tree, in pte_offset_map, ...).

Do what loongarch does in commit 3109d5ff484b ("LoongArch: Set hugetlb
mmap base address aligned with pmd size"): when the file is a hugetlb
file, use its page mask as the search alignment instead of the cache
colour mask.

Fixes: 7bd3f1e1a9ae ("mm: make hugetlb mappings go through mm_get_unmapped_area_vmflags")
Cc: stable@vger.kernel.org # 6.13+
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
--- a/arch/mips/mm/mmap.c
+++ b/arch/mips/mm/mmap.c
@@ -9,6 +9,7 @@
 #include <linux/compiler.h>
 #include <linux/elf-randomize.h>
 #include <linux/errno.h>
+#include <linux/hugetlb.h>
 #include <linux/mm.h>
 #include <linux/mman.h>
 #include <linux/export.h>
@@ -72,8 +73,11 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 	}
 
 	info.length = len;
-	info.align_mask = do_color_align ? (PAGE_MASK & shm_align_mask) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
+	if (filp && is_file_hugepages(filp))
+		info.align_mask = huge_page_mask_align(filp);
+	else
+		info.align_mask = do_color_align ? (PAGE_MASK & shm_align_mask) : 0;
 
 	if (dir == DOWN) {
 		info.flags = VM_UNMAPPED_AREA_TOPDOWN;
-- 
2.47.0

Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8789D353A69
	for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 07:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456417; cv=none; b=DVqNKnUVV35GwOTN6wZWSq8OmbYK7XcAknjTVqpPbYh+2nRaHX8KM818kM+CNmSGGV/W7XLZ32ukvb2duuf/a0jTbBRbQJ1X5gLA39EnndKpQT+DuuRlIFK99x+yPqaCBsiS6Td2BdjegnZEuDz5ebbkQHmal3b3fYYXGXq+7Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456417; c=relaxed/simple;
	bh=VJPiA57oY/5vyoJkrmWgpCXvfp7VtHP7Ct2Mll3e6pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdbDdhTlp0K7U970qkJz3mhVxdZtwuqGgeOU2V1VYK6rRz28mWHrZZ2yznG1dtc9QGbD3cPi1FVSR00L1j8vqm/L9jLZAqTr3yDlVR97ZEXTJ54hl6ZOclq/RYs0STk+CqXm7Gkn6qlH+2IdvdWG4IHAtVr8wFyvehj/WqE4YVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrYP5Coz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrYP5Coz"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49e6bad7b79so26302435e9.1
        for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 00:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789456414; x=1790061214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=velMxIt+642lquxYVKbrnSVvPRt1SpQzIuYolRQYJw0=;
        b=HrYP5CoznF8vgUi3JCmujnTnNjVljxzsH/hWlebMlSfTOqXBdY2QbsFWdOXlLungB1
         QnE9UaPv1FgVCrMyYpK3xZmJQHtzM6jMGAX7SkXA2efeyQoIH3bHBnYNWyTrW1rtcHro
         +3hk0tgALDfb6giikhzTK71it21pLTngv7N3/UiZp5YTwoVHlSbwzHdOvddOCTgVuQib
         6bGigJxAVd3/qc1ECbVEOvtsgSabxi5s+S6NVLNjvxXS4QjJbVVpM7jsJqPSmF3FhjXM
         aUZ9uadZiNhC02GGM78bDfAzK2hELwQAqAxATZTqCmX3QNORZCYjawO+LUn33D2qDUrC
         8GvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456414; x=1790061214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=velMxIt+642lquxYVKbrnSVvPRt1SpQzIuYolRQYJw0=;
        b=Gj8YrJwe7Op1aIuIJXZkrtnSx2AAA/uiY8HI0CsZPW23PF6WXWcxXs98zF5i3zsPK0
         qCdzcuDsOZ7F5J66rEu1tpgeC3PdifpIiZZ3+r+/FbSQuBZwYRi4zhcAG3BvXYgnNzRo
         E5anwcn40aqttvLogDAc1kDW2EZUzDqoSi7zzYuIXXDMJHjoTkZSnd18bp3PouLRVy5R
         nA5E0rXkoAtXgZUkovYMK4y2LscN57mzJ8NFWNs/QLlNUn1jgkcYN9kLBMLccf07mLdG
         H9eqFUm6tnMhe/3rhqcCumtytNO5UmJ+sm1+W4j/4j8nv1KARHyUBzYTwnuNptpA8RZo
         lOVw==
X-Gm-Message-State: AFuF++mpjzDpTW0dnnEAKnesSxigb6QBeIGCR3TznF7th7rG1yUka1gK
	NyTnbt24aooAWC2AzFgDnaln9tekTW1CC+vTxwPxsizjtLUURWkb1iPNHK43BlcL
X-Gm-Gg: AYBFou0OSJDQTFA8azvICMD2V88bIv1ezYhTjr4YWMw7Q8cTr5q2llzbJOazYWcfBvP
	ZMi30j2Nl6LOXbuwAiMdyVHMOiJHdoIiZ/6SXlYCGtLDswgp+LlyxIjWMDSoS9YYKffoNhFO0CM
	hWS3QdLlzFqwRstS/E3EY+8bHAwDUnRLkaQQct3mM8ZJWVuoa89fDz0uDPGy9VQasL5nw9SSj8M
	01gz/QddKGrBfu4cBLRnL4KsEQ2wcDsC8J5CKsOLgC0X7i/yO0u1v3VSMcvG141pmCehDnJDzzv
	hC2GXu+foVTdIgTQoEkiK9CU1k+BqQa9ToHdkt63op7nmrOa6Op7jWCFfcRo3VtcoW62tBrgRO+
	23UeOFvOqYcv/vfqMZulYr0+MvFqnOGqCQ1tMGFf9OFMKrzOmlTeXp+OD9/KE4gg/VauRSd+jkJ
	c1bBFrYee1qfyHPVFegQYK/WVsv2vx7FZKIzF7LtBFrc6szNSS5VFumoC9q+k4c68u4I15fb8sD
	SmE2vBXWqreQadLRkf90MPFtYFLp2mg0bch7EjklhHnxxY3A+fCCJuIi3d9c4D/bqRIWXc/+6jg
	assgQ5uRThf7z3WP
X-Received: by 2002:a05:600c:4e4a:b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49e7a63a784mr80413585e9.3.1789456412284;
        Tue, 15 Sep 2026 00:13:32 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef735cesm42941345e9.6.2026.09.15.00.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:13:31 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	osalvador@suse.de,
	stable@vger.kernel.org
Subject: [PATCH 2/2] MIPS: mm: do not write a huge TLB entry when the probe misses
Date: Tue, 15 Sep 2026 07:13:25 +0000
Message-ID: <20260915071329.15125-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915071329.15125-1-orgads@gmail.com>
References: <20260915071329.15125-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__update_tlb() probes for the 8K pair at the address it is given and,
for a huge pmd, writes the huge entry with tlbwi at the probed index or
with tlbwr when the probe misses. That works only if the caller passes
the faulting address, so that the probe finds the 4K entry the refill
handler loaded for the faulting page and the huge entry replaces it.

update_mmu_cache_pmd() is not called that way. do_set_pmd() has always
passed the huge-aligned address, and since commit ebcfc63d6bca ("mm:
abstract THP allocation") the anonymous THP fault path does too
(map_anon_folio_pmd()). The probe then misses the stale 4K entry, which
sits at the faulting page somewhere else in the 2 MB range, tlbwr adds
a huge entry next to it, and the TLB holds two entries matching the
faulting address. Octeon raises "Machine Check exception - caused by
multiple matching entries in the TLB" on the next refill of that page;
a process on a CN63XX board died this way within a second of start, on
the first anonymous THP of its bss.

Skip the write when the probe misses. The refill and TLBL/TLBS handlers
probe the faulting address themselves and rewrite the stale entry with
the huge one (they also set the software young bit), so the entry is
installed on the next access at the cost of one exception.

Fixes: fd062c847a8c ("MIPS: TLB support for hugetlbfs.")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -332,6 +332,19 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 	/* this could be a huge page  */
 	if (pmd_leaf(*pmdp)) {
 		unsigned long lo;
+
+		/*
+		 * The probe above only covers the 8K pair at @address, and
+		 * a huge mapping is installed with the huge-aligned address
+		 * while the refill that started the fault left a 4K entry
+		 * for the faulting page elsewhere in the range. Writing the
+		 * huge entry to a random index would leave two entries
+		 * matching the faulting address; leave it to the refill and
+		 * TLBL/TLBS handlers, which probe the faulting address.
+		 */
+		if (idx < 0)
+			goto out;
+
 		write_c0_pagemask(PM_HUGE_MASK);
 		ptep = (pte_t *)pmdp;
 		lo = pte_to_entrylo(pte_val(*ptep));
@@ -339,10 +352,7 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 		write_c0_entrylo1(lo + (HPAGE_SIZE >> 7));
 
 		mtc0_tlbw_hazard();
-		if (idx < 0)
-			tlb_write_random();
-		else
-			tlb_write_indexed();
+		tlb_write_indexed();
 		tlbw_use_hazard();
 		write_c0_pagemask(PM_DEFAULT_MASK);
 	} else
@@ -380,6 +390,7 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 			tlb_write_indexed();
 	}
 	tlbw_use_hazard();
+out:
 	htw_start();
 	flush_micro_tlb_vm(vma);
 
-- 
2.47.0

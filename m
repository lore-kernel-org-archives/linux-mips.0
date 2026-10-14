Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D8540F759
	for <linux-mips@vger.kernel.org>; Wed, 14 Oct 2026 03:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950360; cv=none; b=mia/UHPqxPc+yXtELe25YkyiWhwyXPtTJxTd95UjFjLyyuwWCy0kWoXWqfyuBxoAqlEj6bhyYE+g4D8SkG5AeF5fFkpv/BNhGqciOlAnzR06QmVr3/8s/+f3QXmQO3BzV8i4gT7M8CkX3R4Ycaovn+HmvD+bt/BEx5W0XD+6gAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950360; c=relaxed/simple;
	bh=eo2KS1rD2mthJFfkPWGzxyjARkBBzJ1ObzuNrYesD1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VtXPktwcq+yvzvB3cTzh+Vpypr9JuQ9czrA8DZXrmXe9mXAMhVvNHuhFoXyV6BQOJGu6Ea5veI+NfiixKpUdklNWddvRUKs+PowDPMmPrxBQ6M6g+TDrkx5vwg6ZF1hViTnHnXM6Hj9y1bK9WLyxCOVR+vmofpCmJED1mRs7NeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ajkvbjk3; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ajkvbjk3"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso2295982a91.1
        for <linux-mips@vger.kernel.org>; Tue, 13 Oct 2026 20:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791950358; x=1792555158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5STA7RRpF0bZE7yNESPvMRAN/jMwPnFqOs2b9BGo7gc=;
        b=ajkvbjk3kTPfvCqcZGv4EJqKjl+5/xxRCJuc52x+TJywPi/B9lU7YuQiSJvhgrdZFS
         ZCqGSfrf5efC82Vl+nSlFwfDM8PcreOEcIMxYFLkZrGBQinbjcZFV3cn95wzsuFAKNHu
         c9EXuJyOrgR43wPTICZCiqx5zbn10VaDruDFaTZfhr7STZmLeLqeWpOaTxV+GdLRUa+P
         LGG2A4hNTeO0nvLe6CVn+adZh+nalPuwJGwWWc9+5jMH2ejXNhIY1ByllNNuX1r2oUCu
         DgUfkyOmM15luwL/Gz0oEp/tEOp7ECgdgo6JMC9cruIIn3aGKDIvi7a1+d8e7OmPq/32
         gXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950358; x=1792555158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5STA7RRpF0bZE7yNESPvMRAN/jMwPnFqOs2b9BGo7gc=;
        b=S+Mp9uwyujxMSK+94f2MbHIj+mnbfQwtfU9+XU8qUu8BawoOBZCgY8PPLXzEJiWyut
         WSaOZKDb7z0HkMj3olukde9QQ4jsd6z8lutmfdIXOvYE56ohnAiMA1lzTg14OV8sLA7B
         Pqtg+WHNYWyEHRnpqR7ZKKu4LG685qT9yAjX28ShGkdzsLePhovGsZsQWrGSGQmrGkFW
         qFA67dgKvbZCohFkMQ5r9HynPMlEaZy60trFuvuSMB4a/lnhpWp3JWomh4eXC4+tIiQs
         xAzwif0j107LAGUNfIqQxQMuim7M6HZQ3oXcpb8XV9moIVysjVtrcPFibNfv+t6756JN
         rvew==
X-Forwarded-Encrypted: i=1; AKwUvBznX8xNg+OxiBo/oXjoXmXE+lGKd/lwofGxRqhc9TVEdiMiNokEK7/lJtVFTirtAKjlOqFmbW/SrK+F@vger.kernel.org
X-Gm-Message-State: AFq9FYKklQSgyl16tJEf7WyE+IJAOaliJjJ6ZBFtNmxHUJT4tAzMX7W/
	AYsXCAX1i/ODQhwAdzty0d6YYXYfBaqmefR4aMKxkw9A2ryIucTve/mMf5WzeVaWwX0=
X-Gm-Gg: AYBFou0r6R8S9oVvfabCDiehuNftFWytMI0ZBaeAST+IqUQJf0vr4vZhDjdtbjFH6/H
	YGUl3NVUOcoXIMv0MDF99fCG8sw7AegpuYsQhzDZChUgHV6IEstBAD96jo6dxp47PKtlKJEuKKe
	jHT6ofUK6EjusjXcmXipGH/sdT4MN6qsU6oy26QFjIo6ikh6FvvBAEJ/oJ7Q/nr9Jbp6AAWycCR
	8o72SOefvIGcFpMjg4DyoLyTgwGeFGd8LBHUZpQevNmL6FK3s2pf1PHA+Tnloy3Vsaw0mKngar3
	xNg28X96EbCMhC46YRoGbmble1hTloAgkcuNivX7xaKA407qZ+tbDd+Z5WrH7rDIcHf5WVRr+88
	lNYwl5npc5zXb6wwEQKwjNLwkFGP9dg3OlWRuwVYa5P58YRkdrpapvbjTk2zhUsaMuI2Dy5GfZS
	O+11T6HbJTNkE1EUwHFVzAvl8pAuB2oAvatcMypItg9HMz8h5WyKKjHK5kysr+7ifwIDKR/mMG8
	KnCpx7ROB6W49JwwYPK
X-Received: by 2002:a17:90b:4c8a:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3ac63bfe81amr1395913a91.41.1791950357376;
        Tue, 13 Oct 2026 20:59:17 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24a538sm2492305a91.9.2026.10.13.20.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:59:16 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] mm: Generalize page table allocation helpers
Date: Wed, 14 Oct 2026 11:59:07 +0800
Message-ID: <20261014035910.687847-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A subsequent series will switch runtime vmemmap population to the
generic page-table allocators. Since vmemmap tables belong to init_mm,
the allocators must select GFP_PGTABLE_KERNEL and mark the ptdesc as a
kernel page table.

Some architecture-specific allocators do not preserve both semantics.
LoongArch and MIPS choose PMD/PUD GFP flags without checking the mm,
which can charge kernel PMD tables to a memcg and leave user PUD tables
unaccounted. The private PMD/PUD allocators also omit kernel ptdesc
marking.

Rather than duplicate this handling in each architecture, extend the
generic PTE, PMD and PUD allocators to support architecture
initialization hooks and non-zero table orders. LoongArch, MIPS and
parisc can then drop their private allocators and inherit the generic
GFP selection and ptdesc handling.

This series only prepares the allocation interfaces; the runtime
vmemmap conversion will be submitted separately.

Muchun Song (3):
  mm: generalize kernel PTE table allocation
  mm: generalize PMD page table allocation
  mm: generalize PUD page table allocation

 arch/loongarch/include/asm/pgalloc.h | 48 ----------------------------
 arch/mips/include/asm/pgalloc.h      | 40 -----------------------
 arch/parisc/include/asm/pgalloc.h    | 17 ----------
 include/asm-generic/pgalloc.h        | 29 ++++++++++++++---
 4 files changed, 24 insertions(+), 110 deletions(-)


base-commit: ad9f2d463666c64e94b04be5263c9bf8f9f96fb7
-- 
2.54.0


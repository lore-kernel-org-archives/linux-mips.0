Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B828836E468
	for <linux-mips@vger.kernel.org>; Thu,  1 Oct 2026 05:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832656; cv=none; b=OtE7iXxpmcL//D2zbN5FqoMKWlMBxT9MOHLVfpkw+9ArZkCBKPCn3yv8n/qC3Fdz3wKbykMW8dv+kg+nWwUQYQKDVeESHULwulE6A0phRDKTd+pzGhXyF0J22MavyWr3l358e+MdSDrtak9/5NvzRXL2NdAobsKXtsrJnCATVpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832656; c=relaxed/simple;
	bh=EmA6//KppfeUgVZiV4cMUwGel9FhZCcjp0UJf5p4IKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UPuAgw1rXmxrdqTKaACaA5mLHK6edxonUMD6bu0sbwH8oNB8RUVHu6TTBWHYqiJr0CbD4V3sih0pA5dPhBMaig4Io2+F+mwaSHF042f0VRuZbWLWtIzb+l2k9miRBvEaaMfAxFxb1LCx9stk2k6nfbCQS2qetLN6BIG/HFd2+gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=bw22YXjU; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="bw22YXjU"
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2881F3F601
	for <linux-mips@vger.kernel.org>; Thu,  1 Oct 2026 05:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1790832645;
	bh=1VE1RYfLq2T8mu9mJjmLt+ict1IadVMm9yDzloS+OAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=bw22YXjUxhQ3mxLDK4VlPrqp2hOY6j2Ba+B+ChVg5uqR+55ct0Y6LBXrv0JNOKnSY
	 9kvqod2OoeI43mLeQ9PqoOYwWX8Xii7UyYFymyN7QEyP5sjhBWHS3AenUZaKYPeKr5
	 PaleHXWHjjx1ULBKXy3R972WGqMneROt7Jn03XA8YZjEMuSrHe6Xmm7n1itwBgZlDd
	 U+aRv+2kqxNVIqxQyL6R+Fflksba/eSLRJfmvG/ERlpBVZtuDx0zgR/QI/Mt7oDn0A
	 iPyDpXMb28yUgVPAuy0O0YNoZTkXsD2dZ0sLQASo3dKxqmKRAn14C7cX6Pf2PRP4KE
	 ASV+BEO4HANdwOVD/kuJn0viXUtPssbyDys/2Luw6IOyisWYjOKcj0zOl7ltUQmej9
	 BYKwOY+iVEl/lIdTVsVXM0b4NuFR2zM84TasUbjK9ge0wvtMKKkQN4tl3WnGG/7b85
	 7X/CImbvqB4+cue8lJxG+HJEVjbHJQEg7dGq36jUk5KwVpJNQXP/GXP6RsaCfVg73L
	 OgZnopTA6fXdGHAwCd9XUkIck32n43z2PiB3CpscMCSTaW+/4Edayub4UN/cAHflZb
	 qYmxpZmUkyMKhu5Vo+uMbhVD+qAWUpef2TJa/OBAVGqALaCMko2IDMl39px8yhGc2N
	 kg/YqXKTmpaPKBYa2SfbKTkY=
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so58734475ad.3
        for <linux-mips@vger.kernel.org>; Wed, 30 Sep 2026 22:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832643; x=1791437443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1VE1RYfLq2T8mu9mJjmLt+ict1IadVMm9yDzloS+OAM=;
        b=hY+2qNBGxOiW4GOvFJ73CAEgL3imrl1dZltJVRlgxsAJ2ebjaWjDRtxTbOi2lsG5zt
         ye39z4zljW/6bD6o3GmwhpC9yO20Y33Mr23S6zhXPpEidiU27IfmYCuH7S5GIPkpQjSm
         yHz1GaD88cA7/BXIzU1GUjkt6ISal8iV9N31adh867/Ls0H5wObAKg7H8l8k8wjZFtwY
         4KH6aj/mGgdRn/WwKvwyxi5VzvQTpeyFV83KdqwgrdNKe2OBmhX+pbLFb2TWE5yENp8/
         TkteWMrj77JbjdyT9H6q8OlI4tcYQ1COGyMlUj1eTj0Ceu8jvGTD9smaQg6jynYnpqIb
         ZFVw==
X-Gm-Message-State: AFq9FYITpvIcE9iU3oZa1bAspxwB+tJFUtSuVNsotD0o0btxDqr6R75M
	IveEqYEEYZusnW8iiedTHAPABYYMaHXcvsARKuleZVTDWjNkKwx0fOefyIs8DHsuDzJxbK4H0h/
	p+o1mjI+Wgbbh+B8N/QlhBDQQOyD0HNh3HcWd+s/cmJaF7sAlK1/c6P1vBpnbGCNFzIlPi1Cjnb
	s+bDM=
X-Gm-Gg: AYBFou15Qr5BqI4uXGsCyjUS85Hgm55jYpKAEGe6bijASWOqljWcHVu0H2H9GpP8d2w
	s6h/ppr3Wx4W0paUEIDOw1M/FhklKVjSxyUvps7CeEo81uESNv9vuNh1xbAKgE6jOKpzpT6Dm8P
	HeI/VZzqIzRybzdphMBoT85wGJBCFOM8G+J50QK+GJNK3IYNT63GfthGdzecl7xg/KDDaNZp5Y7
	ZzHuIwXzocNaQwUeOTNWMmH/adLwxVyL0ph35ZuHDcedIGYEhkPm5K56DB4RvhRwvOjeNW8Hm2K
	KY4AhNa2kuqZ53X1aKkrpZfxKGcyTYkvxY/2fLk3jmw4NBgjxAM+HRuqhasd2UNX18j+eDHqNCQ
	61qvPYah5g2Y0IBgWPv9hDVskatd3dkQJ+grD8syHmJYjKeO9KvlE8Por
X-Received: by 2002:a17:902:c945:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2e2e49167eamr32572225ad.2.1790832643550;
        Wed, 30 Sep 2026 22:30:43 -0700 (PDT)
X-Received: by 2002:a17:902:c945:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2e2e49167eamr32572045ad.2.1790832643130;
        Wed, 30 Sep 2026 22:30:43 -0700 (PDT)
Received: from resolute-linux.lxd (124-218-37-86.cm.dynamic.apol.com.tw. [124.218.37.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b4273csm5205745ad.64.2026.09.30.22.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:30:42 -0700 (PDT)
From: Aristo Chen <aristo.chen@canonical.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>
Subject: [PATCH] MIPS: GT64120: Remove duplicate GT_PCI1M1LD_OFS and GT_PCI1M1HD_OFS
Date: Thu,  1 Oct 2026 05:30:15 +0000
Message-ID: <20261001053016.76578-1-aristo.chen@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GT_PCI1M1LD_OFS and GT_PCI1M1HD_OFS register offsets are defined
twice in a row with identical values. Identical macro redefinitions are
valid C, so the compiler never warned about it. Drop the second copy.

No functional change.

Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
---
 arch/mips/include/asm/gt64120.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/include/asm/gt64120.h b/arch/mips/include/asm/gt64120.h
index 5d68d726598a..2ad770ff3c56 100644
--- a/arch/mips/include/asm/gt64120.h
+++ b/arch/mips/include/asm/gt64120.h
@@ -45,8 +45,6 @@
 #define GT_PCI1M0HD_OFS		0x0a8
 #define GT_PCI1M1LD_OFS		0x0b0
 #define GT_PCI1M1HD_OFS		0x0b8
-#define GT_PCI1M1LD_OFS		0x0b0
-#define GT_PCI1M1HD_OFS		0x0b8
 
 #define GT_SCS10AR_OFS		0x0d0
 #define GT_SCS32AR_OFS		0x0d8

base-commit: f552e14f77bfce3e7ee0bb268ab023951baec3ff
-- 
2.53.0


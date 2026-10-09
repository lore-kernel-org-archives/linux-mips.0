Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA9F44E65F
	for <linux-mips@vger.kernel.org>; Fri,  9 Oct 2026 23:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791588566; cv=none; b=d4zrDYjKSyNsu3bkSGNqxp23capWzE8bEDCib+XE0BraxMyNv2B2ujvJgE0VAxCLRDDu5HAzu92qsAVUW/ADS/U+zb8H/kHoX4L51zTuXhSRCejFRrc8NEoRfPSDt0l7saAaIYTximL5FgSKn/jfC75r7KFfhoBX8j01nIn0lCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791588566; c=relaxed/simple;
	bh=kMMHsn2tqRp2ZEQ99J7niLvGSpZcEMfzZzrLSnYsy5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ARD0Esm+83euvT+OJVAnB2XLrp95DhzEZSDjK+/7wJJfudfDV6CKvleZia8UWZ27XG/+TiARH5Qm3DkK5WcsmJgYG6WiQYJRgoZZHTBzNRaSIanLgOHYExSY5vN0vp6iHcXfVNaezj45NzyfF0av0x+EvKFk+QF9K8NAyn02Wic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMI7XJOO; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMI7XJOO"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab67ff8f16so94605a91.3
        for <linux-mips@vger.kernel.org>; Fri, 09 Oct 2026 16:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791588565; x=1792193365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UvHiLUfan8B1R8Q9EX6DNQFDDmfCS3njUEGk4UoDUoQ=;
        b=HMI7XJOORKE1MiklM4HC6FjaF9gsceE4KBpl3bVL0wsSm8D2T1vbAiYKUO9XC4rKbc
         jTiwMtAZNd6L/qksIlzzKIUDdn9WwqqCZ/ugBOAqX8z8cFx4b/CvFAj9p7SBXffgIVsY
         7QEsjGZ+deFDSu8LP/PNk9xL1ml7LBgHi4mNAlBHnjoXp8dSc791AfsG6nD5eXM3WlS2
         K5RHitQ8D9ojkZcqvoz3hTApXpfgCoOclo0YEjVgIB/yVsRwi8Z7yuCXPz2mclvq2w6b
         E5DuEuzQpkAhnQldt8teWVIyLXuWj0rREAgmhlcrHYtwT686cH+urE2jGdHrwD43w6YU
         ckMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791588565; x=1792193365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvHiLUfan8B1R8Q9EX6DNQFDDmfCS3njUEGk4UoDUoQ=;
        b=Y0gYQcBGUs3ZY7X0svJ7RQ8w8oJx2gLHXdYOW6WmfcB2wE8VGPUy6Zz1rdYrVPhmoB
         k/5dSOd1RLunilW9vI42gh/7TL56ZG8Kzwrb8ROC5JdUBuj2QjUqI0Bf4Audfeg5h9Dx
         PtFLmkyl4eytCOp6IyK29EILntWVy7YileV30Rx/Exyvrbmn8I/JpV3Dn76LJvYS6y6a
         Kd/pYFLB7Il2XJ2+powqJAfoONqgg3CgjleW+txOPMyWjbppj0KSSRFYdQ0o6d4YHqq0
         vjg9NHUoaRWS2uRczI+biyBGlQor7P8q7qABUcv9hrMbv6gij3ZNq0IEaXwnWToT8SML
         k8WA==
X-Gm-Message-State: AFq9FYKp3p7LQytiTv2stb6vnYLzBrYhTW1GyBy8sIDHfeFh+Wu9CeFF
	Y73d2eS8virfADsp7jhhrSqb5xk5W1z8JjphcvTY+aiMb1q8LVTgrFr0zewKtG+0
X-Gm-Gg: AYBFou1WoA4+W7xn1OxozDXYJYPHTAxagLJExamG+fB0DSkTpGmuJLQ0weapAtiDpq+
	rYvdm7UB2wfzEt/Qzq2Og9cmI/FYFd70rCeahNxK2cYgPo9vF5es2Tvgn9RTJsqR3gzX11EUSwt
	+s5WKSbHKXf4U6GNNd+sw88neEEsJL2EC3QrGtos1XNo0oI9cf8BAvM1j9CElq8sXKuaM6HLzyW
	T+aDUIZ0rYL6a8f740TAUaKYxuvUUcBm0OmQeyBrmGTL9HizS6/slGFOIX7KsVDUcf4sKqp0VpU
	8aFMpy6ulX9cvrz3yab/ObbEZgDpJXKK7PFG2paTUs3dBPQB8TMel9ap6/uhL0xORnB077np5Pp
	Ikqgt3FZixIpuLWcdPL3/2lY7Mlg5+iQukgrGEfg/C0gct/nWqMhntfgq9pTH7L9m713+Do5zJ8
	moe9iTRZsbEdCsjhkD8zml1bbb/VImZQs9YdDOk1pRnQcEOis7gFbngroBoO4bXBliSRoB+6K24
	1mI1oAtgn3iwTCDlsF4+Unifrndx8ui2I3hY11eoMud67wL3qKKKKFR5pSgBFClp+4PRko9B8LL
	Ll126Z/9+MGBBvc6xgXqIac35Z6TWxwoTCteH7u/gmurseneUQ==
X-Received: by 2002:a17:90b:3c8e:b0:3a6:fc30:ce16 with SMTP id 98e67ed59e1d1-3ab3ae696c8mr2375695a91.51.1791588564913;
        Fri, 09 Oct 2026 16:29:24 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f2f866sm7121939a91.10.2026.10.09.16.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:29:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: boot: compressed: fix the vmlinuz link with ld.lld
Date: Fri,  9 Oct 2026 16:29:23 -0700
Message-ID: <20261009232923.655907-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ld.lld cannot link a 32-bit executable at a sign-extended address. With
a sign-extended ZBOOT_LOAD_ADDRESS, such as the BCM47XX default of
0xffffffff80400000, the vmlinuz link fails:

  ld.lld: error: section .text at 0xffffffff80400000 of size 0x35a4
  exceeds available address space

arch/mips/Makefile already avoids this for vmlinux by linking at
LINKER_LOAD_ADDRESS, which drops the upper 32 bits on 32-bit kernels.
Do the same for vmlinuz. The address computed by calc_vmlinuz_load_addr
is already derived from LINKER_LOAD_ADDRESS, which is why only an
explicit ZBOOT_LOAD_ADDRESS is affected.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/boot/compressed/Makefile | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index e0b8ec9a9516..ee554eaaa18f 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -96,12 +96,20 @@ VMLINUZ_LOAD_ADDRESS = $(shell $(obj)/calc_vmlinuz_load_addr \
 endif
 UIMAGE_LOADADDR = $(VMLINUZ_LOAD_ADDRESS)
 
+# Like LINKER_LOAD_ADDRESS in arch/mips/Makefile: ld.lld cannot link a
+# 32-bit executable at a sign-extended address, so drop the upper 32 bits.
+ifdef CONFIG_64BIT
+VMLINUZ_LINK_ADDRESS = $(VMLINUZ_LOAD_ADDRESS)
+else
+VMLINUZ_LINK_ADDRESS = $(subst 0xffffffff,0x,$(VMLINUZ_LOAD_ADDRESS))
+endif
+
 vmlinuzobjs-y += $(obj)/piggy.o
 
 targets += ../../../../vmlinuz
 
 quiet_cmd_zld = LD      $@
-      cmd_zld = $(LD) $(KBUILD_LDFLAGS) -Ttext $(VMLINUZ_LOAD_ADDRESS) -T $< $(vmlinuzobjs-y) -o $@
+      cmd_zld = $(LD) $(KBUILD_LDFLAGS) -Ttext $(VMLINUZ_LINK_ADDRESS) -T $< $(vmlinuzobjs-y) -o $@
 quiet_cmd_strip = STRIP   $@
       cmd_strip = $(STRIP) -s $@
 
-- 
2.56.0


Received: from mail-pj2-f34.google.com (mail-pj2-f34.google.com [74.125.227.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE2F3101A7
	for <linux-mips@vger.kernel.org>; Sun,  4 Oct 2026 23:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791157712; cv=none; b=CSTtjNVaQ1cZ2Voxqcd9cOXB7Crq+Wyfizyiap+fb2O+fWNqBM9A4nhl2f3cOEWjGDWY5E3IkGM+a+EDlPAd+O04Z8GkBiFAApewchdb/C7icQEtJsR5uU6asSFN4VyKKRc1FporxDIG/OhBqwGfaa69BmiTPz7u417pXAnTGGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791157712; c=relaxed/simple;
	bh=Yakr+ipymN7ZnA+Xz4TDokUUTt0zx6UpbPqxI12sIzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fR31buH0O32zL8VZw/iyqsaDmxbW2i7NBFNhT9T6xm8nxr1akNQhBocFYLwJItL5GsrSh8fuOMQGzeh/Jc6gaqTwr5cwgDs4mnLFWDaGAwqETwlKefFvClS5jtYyKt83ILn7H+vm86b0t9OBuuWDBk725l0OLEGDVP7WKaEPI2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C436IMPh; arc=none smtp.client-ip=74.125.227.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C436IMPh"
Received: by mail-pj2-f34.google.com with SMTP id d9443c01a7336-2d747eb79f7so3532155ad.1
        for <linux-mips@vger.kernel.org>; Sun, 04 Oct 2026 16:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791157710; x=1791762510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dO6qiiwJ5mjkpx+bVW9ukEfz8rnMpwLVr276QlZKmZE=;
        b=C436IMPhgzSHcCaPbpqrBCHxhPGVgJCpHq5OadFUyEls0wJerWsJ59E21vBqSUhpBJ
         RPL1LdK8aVWQx2JB+USXBZofzQeDVaYuqMdZxmKFzar9I7nUScnl41MeO/Q3s0GOQFXE
         qiK07yKk0dKLcdIK5SB9wcKfV2O3fGMvgPpeTAcjLcv7IaQLOdRgJCJI+Ywk/xarOcLZ
         Ov1lDGLf0mPydr2QWzmm+sNtWTyZ8DcNlgOz+Vn6mop++D0yJUm3TdFRmkcKSc/N+9ld
         zx0i9PS1YgZN6aBlaIZOG+a+3h2neZjev+X2/aYvveplS3YIJbGRCghxc3bCROIuzdxS
         w/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791157710; x=1791762510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dO6qiiwJ5mjkpx+bVW9ukEfz8rnMpwLVr276QlZKmZE=;
        b=wTMWPEvcFbFow2LctN1STNfQR2M75Ia7GKCCMJF5RA7jsEe0Gfn0UZ7kQHLSzbc5r+
         pu5ns9jJn9qPhDc6XX/GkX3MaWwTkNHCPz3Tr6fywY8x6UZIL6Wo87tADz1Nz+nxVbJ0
         d1wW+EXWglbB+Vo/ya43UWXTnTeFGsUSM0Gyj7fron35g0lKMEhhquGlKCUFlbouVfCA
         ATiSOrr7L6qXECLZomFNxGYKFYJgevEz131ikkrbe1QpH/ScbCpejqNjyTigZZScbeXq
         84ZGs61bpqNewrMJTJl1QjNtICJr8m2nXL8cjUBimv4iXRBkUVSfQt00fJM0cOm7UpjJ
         tblw==
X-Gm-Message-State: AFq9FYIXVJSrEr3PUHBNx8roni/aPGLwWodGWVg8OfhNt1FNxYsGRHYX
	BnuMIsW6/f8Yk69NzPtyec3Xm+DPYj2+ozeZDzuQ5ffc0OWO8HBNTNZdFL8WHWvULng=
X-Gm-Gg: AYBFou3o4z2BIxcbv/sNuvej4FR+WG2OSwj88i2NrXweRGNatfGf4mstv+UZCJyr6HF
	SzHrSEbSbW7l7yDStzPleg7oJ8f56U8z1A6M5YtnsC+/CYx9wu5/m+Wm9AnG2otse0H1SMemCaX
	KhjFfNYk1VzU+FpqE5smpUeimBbfuGgWJHM8z+wTv1Zju27dvk4J+resHazuebU3SNOvbEHN877
	ThUuvKykjcQM0KZsBm4VZDR3oZNZh42eyP2Q0qx2szDxOIA5B9wygOF+OPnAQdVvm/2M8HTf/Qu
	ClDbBwWupFmeRjPQwsEduBEnI4dzTK6K9qxZ1gp9TdlJELU4Pb+FTjfjzKjo7+bD3Rt5fqREv+b
	ZIk60mJnEb5IruvijbUPNxVCF35UYJP2/APoa8m5IDSPywTrPbLfFc3oupDpcCRvbC48v26RSBE
	xCqrXyJYJWv/y3B0Ysqg7pber3eL5VaaWYdnbbQPFMOTgLLJij6pI4Y2XgfPavwV0tZ/kX28cqO
	F0/tLnthreB/RCqZhpvc/ClFVrVLF0c0kARHYyGcXhShiPNLEGAV3bygX2mSjy0BY3hL6m+JzYp
	vVP1q5S0DkSt795ADrU6xqoDMmX1gs7u/b+xmdTinATgUzB2PxE3S7tf6uM=
X-Received: by 2002:a17:903:8c3:b0:2dd:c0ff:e727 with SMTP id d9443c01a7336-2e49b65f04emr81741455ad.57.1791157709961;
        Sun, 04 Oct 2026 16:48:29 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6cd764sm26207215ad.48.2026.10.04.16.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 16:48:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Paul Burton <paulburton@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] MIPS: Avoid dead code/data elimination when using recordmcount
Date: Sun,  4 Oct 2026 16:48:26 -0700
Message-ID: <20261004234826.541468-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_LD_DEAD_CODE_DATA_ELIMINATION builds with -ffunction-sections,
placing every function in its own section. recordmcount refuses to use
weak symbols as section bases, as a strong definition could override
them, so a weak function alone in its section, such as the generic
pcibios_fixup_bus() stub, breaks the build:

  Cannot find symbol for section 88: .text.pcibios_fixup_bus.
  drivers/pci/probe.o: failed

MIPS always records mcount locations with recordmcount, so this hits
any config with the function tracer and dead code elimination enabled,
e.g. malta_defconfig built with LLVM=1.

Only offer dead code elimination when recordmcount is not used, as
powerpc does since commit f8b2336f15f3 ("powerpc: Avoid dead code/data
elimination when using recordmcount"). In practice this makes it
unavailable together with the function tracer on MIPS.

Fixes: c0436b503591 ("MIPS: Enable dead code elimination")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ddabe25d6bf7..f4f82bd75b66 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -79,7 +79,7 @@ config MIPS
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
-	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
+	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !FTRACE_MCOUNT_USE_RECORDMCOUNT
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI
 	select HAVE_PAGE_SIZE_4KB if !CPU_LOONGSON2EF && !CPU_LOONGSON64
-- 
2.56.0


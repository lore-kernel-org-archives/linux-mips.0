Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3803DE452
	for <linux-mips@vger.kernel.org>; Fri,  9 Oct 2026 23:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791588542; cv=none; b=X+vraz9ylj6iAF7RK0/CwTfz3Igh0fm6FYNQTD7cELjZ4k2yxeq5VwCzOxi0MTeftAIt3jkr49do54GldpglV2aHy0wNweF0SntBNSwt3dxU0YLkOMzB7ge9bcSqlrXTda64YfdRChOeGv2cEKzLICXOJfRGqQGTQDjP9A0508A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791588542; c=relaxed/simple;
	bh=mLqMNkEfqZixT18rfTh2xaYltQQWNBAMspvKIAef3Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J6li+NIh2Gppq0q61DKkuHr4XQe2jK6/r9wTC1S8np7+PAJerRCl/uzJ/RZpQ4wA2NisLBA+MU/K6n8E9f/n3QTT47p84H634CyZn+bBenf5Dy4GqxkQ/HPVSSjDrbKAYnxtMLvvgLgQBWM0Y0f5wXHluMxL+GR83oXdSpgvH0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbvQNKkX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbvQNKkX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e60f9af6e6so1940485ad.3
        for <linux-mips@vger.kernel.org>; Fri, 09 Oct 2026 16:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791588541; x=1792193341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oSlxszekxGveYsrL4DF7hT5F5fsZN6SpIJIkMN18hKw=;
        b=FbvQNKkXzmSYmPwgz0nfBH7l6Vyijn9rPhhHkYSzxwVScyRSFB67Au61e2aIvNKFAe
         4AM1IBYQQXOkAaqHENleI8isR2UfqesEwBt5qRikP0WNcU8ePVpPgBWvrGSczB96MhWO
         qEgwt4UWL2O+GYLoR6w0B4xOpjTQH38nX879KSlvzZ4/Y8y/b8JMWRyL1RZfGv+3AbZe
         lxKaKHfK+MdN9VQOuGqlbovSGoXEfvv+VCTXT8AUCZToPdU6duzPEncECfYTMhtDCsAO
         4G75B9Dd0aQT+VTn0vocnmEFZutL3i5N11vFih2NBogDFH+LKVaUUxTvmH10WYFAWAgE
         bt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791588541; x=1792193341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSlxszekxGveYsrL4DF7hT5F5fsZN6SpIJIkMN18hKw=;
        b=sDRM61t5dqACcszwqcvDyi/gN4vbqC2vMBjlXg+swzk4BruxjueuLdapEkgvecWve4
         gQQEeM3laJ0SyyOHwaE+rKNauXeib71SW+PWgIXrsGHcwBk8o7w4f27WqN+S6GaKITgu
         3xs3Y88dA4a6swc8I2by9r0Vm59v5CmVXQ/v9+RXj8JYw9DfI7KE3mXSubFVB12Y3kwl
         1T6dXx61U4fl7WTHrLlq5sF6yVs/zsCFySjKzes2ScRbyIq1kbxBlsY2fEHl4hRha6Zc
         wOzOA8D6tDTxod2iK+8KHww2Z+3RrvZXD+jPohKqFU/vwfJ/wKQFTSmFtox5CpRGvcMA
         H5vQ==
X-Gm-Message-State: AFq9FYIT3MsOtfU4Mprj5BYMIPyS+NytjeVpGvBTpcBPvYcXxyqF+Yuc
	Ck1K5tJ6/+0jnj9DyRHDOPWf9T08747o06Lrn9HgcKbUGnQPjJXEuWGMHDozFKqA
X-Gm-Gg: AYBFou39RMFwum5X4jNZKhVXicWHNxSeNwVp1AR0VNnyZBR1y+NZP//QOhPi7lHTLx+
	qhY8x1W/UWLeYsLUqhlzxw69OgQquE0/+/jSZkytg3twtwkuusRJ5ny0WxWcsJP/BQW1zKdy9Ds
	JfYEUxaRVVoWSTxAVQe7wb28Q9EdBKoGEj14TJlR8j39Ti+98zsQOFZDYbmBB8CV2k3K0PzlOWL
	s5+Af/+qOyscQFCchudIjyZkb8USQDEMZYgkJhmjrA/VHrFcI55JACadTwwbOvtESUsOFwRza22
	JbYXjkpGT5EVdAuGbPHrqEHdoHJKS1Ui4gHozjG70L+zRRlooDNYWMSRP3YgV+Ly8bnC9YAfGuY
	32r+C9xkGXhM2+Opw14v01pypS7GJgPsXrtBELe5n9WA+z4Xud/XTt4RGTR6Mqj3g9sVAx3EQCR
	4KO/zYgahdXdY8QffZhvLbQyAsf27PKpnXguaUh8NIFEzSS7vBu2K1MoexDpiDDjJBbfIlFwjfK
	gT4rCWuFBwgE85DgU2JLLwl3FU3CQ4qNBgWTWcKEkC50TGSKC+Vm//EDOzjoTAbhMgP2Pofv4nm
	xWdn0d0TO4M/KEvJUcovU7T4T0L3oMohgcvBKqNkVJP69KnY9h+dFvVPjH8=
X-Received: by 2002:a17:90b:2645:b0:3a8:10e2:ad08 with SMTP id 98e67ed59e1d1-3ab3ace48edmr3043646a91.48.1791588540601;
        Fri, 09 Oct 2026 16:29:00 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39533ee7sm3396362a91.4.2026.10.09.16.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:29:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] MIPS: boot: compressed: place .rodata.* and discard .MIPS.abiflags
Date: Fri,  9 Oct 2026 16:28:57 -0700
Message-ID: <20261009232857.655265-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The decompressor linker script only collects .rodata. Clang emits the
decompressor's strings in .rodata.str1.1 and also produces a
.MIPS.abiflags section. GNU ld places such orphans next to similar
sections, but ld.lld puts them after .bss:

  [ 5] .bss            NOBITS   809246c0 5346b8 402010
  [ 6] .MIPS.abiflags  ...      80d266d0 9366d0 000018
  [ 7] .rodata.str1.1  PROGBITS 80d266e8 9366e8 000164

This pulls the 4 MB of .bss (mostly the boot heap) into the file and
leaves the strings beyond _end. For BCM47XX vmlinuz grows from 5.4 MB
to 9.6 MB.

Collect .rodata.* with .rodata, and discard .MIPS.abiflags and
.gnu.attributes as arch/mips/kernel/vmlinux.lds.S does.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/boot/compressed/ld.script | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/compressed/ld.script b/arch/mips/boot/compressed/ld.script
index 0ebb667274d6..c45be18c6f0d 100644
--- a/arch/mips/boot/compressed/ld.script
+++ b/arch/mips/boot/compressed/ld.script
@@ -17,7 +17,7 @@ SECTIONS
 	/* . = VMLINUZ_LOAD_ADDRESS; */
 	.text : {
 		*(.text)
-		*(.rodata)
+		*(.rodata .rodata.*)
 	}: text
 	/* End of text section */
 
@@ -50,7 +50,9 @@ SECTIONS
 
 	/* Sections to be discarded */
 	/DISCARD/ : {
+		*(.MIPS.abiflags)
 		*(.MIPS.options)
+		*(.gnu.attributes)
 		*(.options)
 		*(.pdr)
 		*(.reginfo)
-- 
2.56.0


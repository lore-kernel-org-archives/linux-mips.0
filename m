Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A59E3DDDDE;
	Thu,  9 Jul 2026 07:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582133; cv=none; b=RbdrC+JUSODsUFosTExo+d6oQMciny4Kn5k7rxriJ0DeFMNHn8UKtjz9JHU/JoKiSbDfeTNVtHYlzsU0BlZkiETPQWK09hKksgIouLXooNkoCRf6TWAf29HCpzwSdomrxgWpsBF2Hj/XY7+Oyk6zkA5QbQbIQ9kBjM8W5Z182R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582133; c=relaxed/simple;
	bh=gpL2Kdh2FNEW3Md/rlMLfxuFtLniQ/gyR5WMlcrQ/Ao=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pDgz7u8Mlbq/a9RXTpGUisF2ZdEp6m+mQt/YMQbK0M6fo97wEcdBYRCGN7z+SI06W4CAPcDILAwf7XQKBgTsWJmzzneQa2qVGzH7LKDClb6kPOC/Kq5C4tBPk4k81xKLBPU0GCeQxMeyy1ce019Pdf95UkBMPuHqZDbV+RX3gSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MjmGUSw+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PiCK2jc4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MjmGUSw+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PiCK2jc4"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783582130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cONdaMi0/lNXSjMycj8uzKQ6fqn12BHJjmdk9MctUh0=;
	b=MjmGUSw+ZdYCNgvwosBkGGlZQSkTnnDb9jkRxcdf9loH6lnU1z0+R2+W2fC7EbxE+lUdVs
	xVJtjFbSrb7uowFhKuxrDwla13/RlE4T8ahsao/vB+GmJ3AFlgsJtFo/jBgyXwuIBecH8h
	yvdLDkOoxTnEtNIOB1tgjxYvOpmLReH4GqeUpyPwoGRHwkGssc0DCRImiBpLBqOOtJmtHU
	n9zkLYCj/XsFF4OWLDBQ/YljEcZEJz67Ivten62LTxzfLORDaCph9Wz8jWBTDghyqrYdVZ
	+wNvzlBHkatCwA2B3AsbDQJrC/I14Z8NxhLV8bdwivMaLrvhvVVrnwC6glMpOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783582130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cONdaMi0/lNXSjMycj8uzKQ6fqn12BHJjmdk9MctUh0=;
	b=PiCK2jc44w6gg5/toDAAbwQOa+jjMdBkff9p0GxZXeuKFEFnxQ1sD8uxXegI637wUeKur8
	+B2o4XIJCQgKf9AQ==
Subject: [PATCH 0/6] vDSO: Clean up the HAVE_GENERIC_VDSO kconfig symbol
Date: Thu, 09 Jul 2026 09:28:36 +0200
Message-Id: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMywqDMBAAf0X23EDqM/ZXREJMtro9RMlqKAT/v
 dEeZ2AmAWMgZHgVCQJGYlp9huejALsYP6MglxlKWbayk0pEx6tYTEQ9o8+t1bepO1XVrWusanr
 I8RbwTd97PIx/5mP6oN2vG5znD93xvBZ6AAAA
X-Change-ID: 20260708-vdso-have_generic_vdso-478346d5c859
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783582129; l=1452;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=gpL2Kdh2FNEW3Md/rlMLfxuFtLniQ/gyR5WMlcrQ/Ao=;
 b=AGUNGiHqeZ7Udh3TzdEUJ3zfTDiJP6UxlL9rqZeiWoBYns4KYxHmVtLFrO2B23VsA1NxcC49U
 LPM6FXtFeH1DdhF4s4BC6ueV9dJRouQuGcX1+li7d3SbUSJ6ZTPW6+0
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Simplify the usage of HAVE_GENERIC_VDSO and rename it to better match
its function.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (6):
      futex: Remove dependency on HAVE_GENERIC_VDSO from FUTEX_ROBUST_UNLOCK
      vDSO: Remove the dependency on HAVE_GENERIC_VDSO from ARCH_HAS_VDSO_ARCH_DATA
      MIPS: vdso: Stop using CONFIG_HAVE_GENERIC_VDSO
      vDSO: Automatically select HAVE_GENERIC_VDSO if necessary
      vDSO: Drop HAVE_GENERIC_VDSO from architecture kconfig files
      vDSO: Rename HAVE_GENERIC_VDSO to VDSO_DATASTORE

 arch/Kconfig                   | 1 -
 arch/arm/mm/Kconfig            | 1 -
 arch/arm64/Kconfig             | 1 -
 arch/loongarch/Kconfig         | 2 +-
 arch/mips/Kconfig              | 1 -
 arch/mips/kernel/vdso.c        | 4 ++--
 arch/powerpc/Kconfig           | 2 +-
 arch/riscv/Kconfig             | 8 ++++----
 arch/s390/Kconfig              | 1 -
 arch/sparc/Kconfig             | 1 -
 arch/x86/Kconfig               | 1 -
 include/linux/vdso_datastore.h | 6 +++---
 init/Kconfig                   | 2 +-
 lib/vdso/Kconfig               | 8 +++-----
 lib/vdso/Makefile              | 2 +-
 15 files changed, 16 insertions(+), 25 deletions(-)
---
base-commit: 369cecd238ac8317cccd27cf2452a8a6b6da1581
change-id: 20260708-vdso-have_generic_vdso-478346d5c859

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


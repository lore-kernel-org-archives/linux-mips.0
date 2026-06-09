Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9449481ABA;
	Tue,  9 Jun 2026 15:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017445; cv=none; b=auON2peEPMD5m2eqTyo/29Gv97aqM9KG/Ll+XUQx89Rd9UnoCtjberzOhQqk+nc683C1VoNyH2a9vgJdObGLbGxH8NB119SSdrrLrLsDaspUu6QobHFBmq7/0DQWlve7pGhaqJJOQuzTeBVBXupQxWykOBsTHNRyY8JthcRht/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017445; c=relaxed/simple;
	bh=X4xhboKxqt4ORQhlXpbdAL8Pu+AiV+mpGgMbTxzU7IQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=YU807kn9BIrmIhzMhKcKkP0pBl6e9Z++gzLjoeHHzwe0RNxFVqVcHEM8jdYk1x5oZC0VyVJbtIXGmHs3iWo4f9gr5wq0vh1Wh2YFawL2rCyxSe2UdEfiznzmXggnZOA9Nb1a5pTStyQ2tw89Q5H8ECBDNiL5biIGNmSXwHRy95g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DgdHf5Nl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=k3NBYiZe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DgdHf5Nl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="k3NBYiZe"
Date: Tue, 09 Jun 2026 15:03:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781017441;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LR7obcT3j33di+gH3CRJeCjwnxbgUo7ZEB19qHcMLGo=;
	b=DgdHf5NlCFbWhNODzZeCEcMtwVDqVxNGW9y7eUinZaV0kFL/Z6KifVpLH8atIdxw9MUC4B
	1+uNYImvBJqV/4Wk4y18AKi1OJe7NbX8ygr7lsVkruiDrCe1LfBdDLyf7xdW7SZ1TAuMUW
	p7ffB+cek07stnACeT/ANIXU6J/4Lud7FFTkQYoCatvG1PZRVxym2T/jn95FnFSCCIoHzQ
	vED8GVmPgXJwJes85n+ikkIBtiZw2Gwgojwo0XuobREDosAFd8JhSgx06LvniBbSKWjFtu
	DxfeiuFh5iBsH1bcxDmuuS0WAylLUGWAXZ1Y6aQqiHMrSjaQtp1iEpOPA+4usw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781017441;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LR7obcT3j33di+gH3CRJeCjwnxbgUo7ZEB19qHcMLGo=;
	b=k3NBYiZeUOiCjNlgmJD+O1MElub+kRD+AnJTeJP0/4DSoRhatYJYxwlagvrXECpj0PoHnR
	+rTydwcNlTBHVpCQ==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] MIPS: VDSO: Fold MIPS_CLOCK_VSYSCALL into
 MIPS_GENERIC_GETTIMEOFDAY
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-mips@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260521-vdso-mips-kconfig-v1-9-2f79dcd6c78f@linutronix.de>
References: <20260521-vdso-mips-kconfig-v1-9-2f79dcd6c78f@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178101743986.529383.15318148364435303032.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     8d563bd7904734c05a4f2abf4ecca0e4fe764b50
Gitweb:        https://git.kernel.org/tip/8d563bd7904734c05a4f2abf4ecca0e4fe7=
64b50
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Thu, 21 May 2026 08:53:23 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 09 Jun 2026 17:02:10 +02:00

MIPS: VDSO: Fold MIPS_CLOCK_VSYSCALL into MIPS_GENERIC_GETTIMEOFDAY

This configuration option exists so "that we don't provide the symbol
when there's no possibility of there being a usable clocksource".
However it only covers __vdso_gettimeofday() and none of the other vDSO
functions which should be affected by the same circumstances.slightly slightl=
y.

Remove MIPS_CLOCK_VSYSCALL and fold its usecase into
MIPS_GENERIC_GETTIMEOFDAY, which works correctly.

Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org
Link: https://patch.msgid.link/20260521-vdso-mips-kconfig-v1-9-2f79dcd6c78f@l=
inutronix.de
---
 arch/mips/Kconfig              |  4 +---
 arch/mips/vdso/vdso.lds.S      |  2 --
 arch/mips/vdso/vgettimeofday.c | 20 --------------------
 3 files changed, 1 insertion(+), 25 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ccc66e3..323ca08 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1133,9 +1133,6 @@ config CSRC_R4K
 config CSRC_SB1250
 	bool
=20
-config MIPS_CLOCK_VSYSCALL
-	def_bool CSRC_R4K || CLKSRC_MIPS_GIC
-
 config GPIO_TXX9
 	select GPIOLIB
 	bool
@@ -3171,6 +3168,7 @@ config MIPS_GENERIC_GETTIMEOFDAY
 	def_bool y
 	select GENERIC_GETTIMEOFDAY
 	select HAVE_GENERIC_VDSO
+	depends on CSRC_R4K || CLKSRC_MIPS_GIC
 	# GCC (at least up to version 9.2) appears to emit function calls that make=
 use
 	# of the GOT when targeting microMIPS, which we can't use in the VDSO due to
 	# the lack of relocations. As such, we disable the VDSO for microMIPS build=
s.
diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
index fd263b0..05badf3 100644
--- a/arch/mips/vdso/vdso.lds.S
+++ b/arch/mips/vdso/vdso.lds.S
@@ -97,9 +97,7 @@ VERSION
 #ifdef CONFIG_GENERIC_GETTIMEOFDAY
 	global:
 		__vdso_clock_gettime;
-#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
 		__vdso_gettimeofday;
-#endif
 		__vdso_clock_getres;
 #if _MIPS_SIM !=3D _MIPS_SIM_ABI64
 		__vdso_clock_gettime64;
diff --git a/arch/mips/vdso/vgettimeofday.c b/arch/mips/vdso/vgettimeofday.c
index 1d23621..00f9fcf 100644
--- a/arch/mips/vdso/vgettimeofday.c
+++ b/arch/mips/vdso/vgettimeofday.c
@@ -18,22 +18,12 @@ int __vdso_clock_gettime(clockid_t clock,
 	return __cvdso_clock_gettime32(clock, ts);
 }
=20
-#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
-
-/*
- * This is behind the ifdef so that we don't provide the symbol when there's=
 no
- * possibility of there being a usable clocksource, because there's nothing =
we
- * can do without it. When libc fails the symbol lookup it should fall back =
on
- * the standard syscall path.
- */
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
 {
 	return __cvdso_gettimeofday(tv, tz);
 }
=20
-#endif /* CONFIG_MIPS_CLOCK_VSYSCALL */
-
 int __vdso_clock_getres(clockid_t clock_id,
 			struct old_timespec32 *res)
 {
@@ -59,22 +49,12 @@ int __vdso_clock_gettime(clockid_t clock,
 	return __cvdso_clock_gettime(clock, ts);
 }
=20
-#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
-
-/*
- * This is behind the ifdef so that we don't provide the symbol when there's=
 no
- * possibility of there being a usable clocksource, because there's nothing =
we
- * can do without it. When libc fails the symbol lookup it should fall back =
on
- * the standard syscall path.
- */
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
 {
 	return __cvdso_gettimeofday(tv, tz);
 }
=20
-#endif /* CONFIG_MIPS_CLOCK_VSYSCALL */
-
 int __vdso_clock_getres(clockid_t clock_id,
 			struct __kernel_timespec *res)
 {

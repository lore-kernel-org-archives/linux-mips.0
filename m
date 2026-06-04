Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6481747F2C1;
	Thu,  4 Jun 2026 16:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590294; cv=none; b=arQckXP+L52P7iqslEQHVZyX6yS9bXho3FUAyVXsWCeIpLJbpq/ZdgvpTmceeCgclqgDMtHE31JbncC129XVgtXkvmr9sgDV4xlqkPLBoqKOMaJecqj30GvvGS+H6bczRp4ZOPm5Ybjw7uHcwG5/a6GCyxJODIL+l7Ea0qzt8zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590294; c=relaxed/simple;
	bh=WsEGcShXZBMQGGnTuNN4o3CsicI9GppifeiSFonUENg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=FlatmMBhaBAtaWL6z+cytthO313AP/KO7f7NhMSuSgWHKFEWM6nmOQ809Jpbt/668YeJui2fZPZfuc26reW0B1bPIRDxYc0bvYfZohddymqWHf9fBBwz3bnVsNn9KNLr3IYQPsZh3fCZFj+eOc8yZ7bUM+chm905v51W9wOkpvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tgHlVOXl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H9BCymdp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tgHlVOXl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H9BCymdp"
Date: Thu, 04 Jun 2026 16:24:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780590291;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EwgsDe0mcubgwxcwe6tTzweAnmiQAeJ8dsICuvTkyHM=;
	b=tgHlVOXlaiJ9ORU22+F5cCnySH0jaEgdhm8Y3ISBnhqaVRLEF+Blrsjwe8CtUCvAbeTAJ9
	ze9y4hJRYPYUZ1WPZb9Hc38BLMqW0WinX6MNOs9xls2e3IzlemvZCMMZVUDt/DbfW98hAS
	lRl0vJa3x18g6HlACbt2e/IQgz5CYEpvbxbUSPZy06wXIig8kjxCJj/SmqxqipIY5dwXU8
	Mzo0J/G1uZO/bZNQhKMa7v/D5LJ1UKOWg00f9mS9CLsJdUjVONtOGjKb+nSPMx6+xwzoiZ
	tMtv7XYAW/w7vrSPztvazActh5QrQJmtwV5q31sMhS5HuPwGrWPXwwfjdAuEAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780590291;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EwgsDe0mcubgwxcwe6tTzweAnmiQAeJ8dsICuvTkyHM=;
	b=H9BCymdpl92Qxm6vBUDnaC0n2JKqNOp2nmTLQ3upPF5KdmrxDftj++xkS9CaI7M97fbiz6
	8qx9Cn9TeuQMnnAg==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] MIPS: VDSO: Fold MIPS_DISABLE_VDSO into
 MIPS_GENERIC_GETTIMEOFDAY
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-mips@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260521-vdso-mips-kconfig-v1-7-2f79dcd6c78f@linutronix.de>
References: <20260521-vdso-mips-kconfig-v1-7-2f79dcd6c78f@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178059029047.710.17481366435802841455.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     2db1ec80dfd5f9f1200acc90ec04a9c8ea47701a
Gitweb:        https://git.kernel.org/tip/2db1ec80dfd5f9f1200acc90ec04a9c8ea4=
7701a
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Thu, 21 May 2026 08:53:21 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 04 Jun 2026 18:22:46 +02:00

MIPS: VDSO: Fold MIPS_DISABLE_VDSO into MIPS_GENERIC_GETTIMEOFDAY

The currently used MIPS_DISABLE_VDSO will disable only the userspace
bits of the time-related vDSO. The kernel part is still pointlessly
built and running.

Remove MIPS_DISABLE_VDSO and fold its usecase into
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
Link: https://patch.msgid.link/20260521-vdso-mips-kconfig-v1-7-2f79dcd6c78f@l=
inutronix.de
---
 arch/mips/Kconfig         | 6 ++++--
 arch/mips/vdso/Kconfig    | 6 ------
 arch/mips/vdso/Makefile   | 7 ++-----
 arch/mips/vdso/vdso.lds.S | 2 +-
 4 files changed, 7 insertions(+), 14 deletions(-)
 delete mode 100644 arch/mips/vdso/Kconfig

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f56e1a5..6463b0b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3171,6 +3171,10 @@ config MIPS_GENERIC_GETTIMEOFDAY
 	def_bool y
 	select GENERIC_GETTIMEOFDAY
 	select HAVE_GENERIC_VDSO
+	# GCC (at least up to version 9.2) appears to emit function calls that make=
 use
+	# of the GOT when targeting microMIPS, which we can't use in the VDSO due to
+	# the lack of relocations. As such, we disable the VDSO for microMIPS build=
s.
+	depends on !CPU_MICROMIPS
=20
 menu "CPU Power Management"
=20
@@ -3183,5 +3187,3 @@ source "drivers/cpuidle/Kconfig"
 endmenu
=20
 source "arch/mips/kvm/Kconfig"
-
-source "arch/mips/vdso/Kconfig"
diff --git a/arch/mips/vdso/Kconfig b/arch/mips/vdso/Kconfig
deleted file mode 100644
index 7014024..0000000
--- a/arch/mips/vdso/Kconfig
+++ /dev/null
@@ -1,6 +0,0 @@
-# GCC (at least up to version 9.2) appears to emit function calls that make =
use
-# of the GOT when targeting microMIPS, which we can't use in the VDSO due to
-# the lack of relocations. As such, we disable the VDSO for microMIPS builds.
-
-config MIPS_DISABLE_VDSO
-	def_bool CPU_MICROMIPS
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 69d4593..00d3ba2 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -4,7 +4,7 @@
 # Include the generic Makefile to check the built vdso.
 include $(srctree)/lib/vdso/Makefile.include
=20
-obj-vdso-y :=3D elf.o vgettimeofday.o sigreturn.o
+obj-vdso-y :=3D elf.o sigreturn.o
=20
 # Common compiler flags between ABIs.
 ccflags-vdso :=3D \
@@ -36,6 +36,7 @@ aflags-vdso :=3D $(ccflags-vdso) \
 	-D__ASSEMBLY__ -Wa,-gdwarf-2
=20
 ifneq ($(c-gettimeofday-y),)
+obj-vdso-y +=3D vgettimeofday.o
 CFLAGS_vgettimeofday.o =3D -include $(c-gettimeofday-y)
=20
 # config-n32-o32-env.c prepares the environment to build a 32bit vDSO
@@ -47,10 +48,6 @@ endif
=20
 CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_FTRACE)
=20
-ifdef CONFIG_MIPS_DISABLE_VDSO
-  obj-vdso-y :=3D $(filter-out vgettimeofday.o, $(obj-vdso-y))
-endif
-
 # VDSO linker flags.
 ldflags-y :=3D -Bsymbolic --no-undefined -soname=3Dlinux-vdso.so.1 \
 	$(filter -E%,$(KBUILD_CFLAGS)) -shared \
diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
index 5d08be3..fd263b0 100644
--- a/arch/mips/vdso/vdso.lds.S
+++ b/arch/mips/vdso/vdso.lds.S
@@ -94,7 +94,7 @@ PHDRS
 VERSION
 {
 	LINUX_2.6 {
-#ifndef CONFIG_MIPS_DISABLE_VDSO
+#ifdef CONFIG_GENERIC_GETTIMEOFDAY
 	global:
 		__vdso_clock_gettime;
 #ifdef CONFIG_MIPS_CLOCK_VSYSCALL

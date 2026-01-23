Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F7886323;
	Fri, 23 Jan 2026 23:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769210276; cv=none; b=oj+JUxqo/w2rQ45ve0FeapHMFOt5fY8qkHGy6FxHLp+C0RhFBfNywMRUfKaBgMENPp1XzHmOvh5TgLI5Bz0bGQc71oZDsPlfuDn7dngIbswVmH1tLlJfBHALWWx9b7vsw5tFYpHf6Wz2F/NgS0loKyz31LDAmoRZ+vB22tWTyS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769210276; c=relaxed/simple;
	bh=1pQksIRKjW2WX7SPiK8B+S+R1sks0G159z3ToqCWTRk=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=F4ESaxKss8r7JbA5qMRL+zSHb7jnd28D6x5HQWYZ9YR8IGVprDZ7Sb7g4cA55IbyvX4Fd+9s/8caUl247tVA468OXsrz2V24k/zOnkhEQfT6U4YbFx+RVQG0+9qsU8NXYl+uQKlFrdIhE05mK85HrP+pHGqAq01x4iNmA7x3hCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=linutronix.de; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Sat, 24 Jan 2026 00:17:52 +0100
Message-ID: <20260123231521.723433371@kernel.org>
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 John Stultz <jstultz@google.com>,
 Waiman Long <longman@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>,
 x86@kernel.org,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Jiri Wiesner <jwiesner@suse.de>,
 Daniel J Blueman <daniel@quora.org>,
 Scott Hamilton <scott.hamilton@eviden.com>,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org
Subject: [patch 2/5] MIPS: Dont select CLOCKSOURCE_WATCHDOG
References: <20260123230651.688818373@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

MIPS selects CLOCKSOURCE_WATCHDOG, but none of the clocksources actually
sets the MUST_VERIFY flag. So compiling the watchdog in is a pointless
exercise. Remove the selects.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/Kconfig           |    1 -
 drivers/clocksource/Kconfig |    1 -
 2 files changed, 2 deletions(-)

--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1129,7 +1129,6 @@ config CSRC_IOASIC
 	bool
 
 config CSRC_R4K
-	select CLOCKSOURCE_WATCHDOG if CPU_FREQ
 	bool
 
 config CSRC_SB1250
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -595,7 +595,6 @@ config CLKSRC_VERSATILE
 config CLKSRC_MIPS_GIC
 	bool
 	depends on MIPS_GIC
-	select CLOCKSOURCE_WATCHDOG
 	select TIMER_OF
 
 config CLKSRC_PXA


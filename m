Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AF62C2340;
	Fri, 23 Jan 2026 23:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769210279; cv=none; b=vCST837tjqCB0U0FGPQ0eGujm8HscYoqRQIF2fejMCrKxjiaPvyA1xCS27L9u+av/66IH2YopsFv+unRjKBJEORsqyR8f7d5WFzcUylMU3p+B0aitQScFq2YMkjDsKsoJsnZ/JUq14WS/pTRVzRlfBrwp8ESpanlbLm5E8jRUYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769210279; c=relaxed/simple;
	bh=kBrIaFy5hgxebQXHqX/9PhyjRhLdPLFIGDlxACWe8sM=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=Mr4x8swSWoNpGPuEouYbQXExo4BiyJSVhwMqPwemejCeiObnprGEM5s9ruawgyjVmehntXh1+ScNwvLEhjJtuJyTVpPmkzREGe9nhOohyiAxCRTxfuGQFEp991EPh2DJ7lVW/MsLmrQKABXnZ2K4EFIEjqWt3U4tGb7QtN+bceA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=linutronix.de; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Sat, 24 Jan 2026 00:17:55 +0100
Message-ID: <20260123231521.790598171@kernel.org>
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
Subject: [patch 3/5] x86/tsc: Handle CLOCK_SOURCE_VALID_FOR_HRES correctly
References: <20260123230651.688818373@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Unconditionally setting the CLOCK_SOURCE_VALID_FOR_HRES for the real TSC
clocksource is wrong as there is no guarantee that the early TSC was
validated for high resolution mode.

Set the flag only when the early TSC was validated as otherwise the
clocksource selection might enable high resolution mode with a TSC of
unknown quality and possibly no way to back out once it is discovered to be
unsuitable.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: x86@kernel.org
---
 arch/x86/kernel/tsc.c |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1193,7 +1193,6 @@ static struct clocksource clocksource_ts
 	.read			= read_tsc,
 	.mask			= CLOCKSOURCE_MASK(64),
 	.flags			= CLOCK_SOURCE_IS_CONTINUOUS |
-				  CLOCK_SOURCE_VALID_FOR_HRES |
 				  CLOCK_SOURCE_MUST_VERIFY |
 				  CLOCK_SOURCE_VERIFY_PERCPU,
 	.id			= CSID_X86_TSC,
@@ -1403,6 +1402,15 @@ static void tsc_refine_calibration_work(
 		have_art = true;
 		clocksource_tsc.base = &art_base_clk;
 	}
+
+	/*
+	 * Transfer the valid for high resolution flag if it was set on the
+	 * early TSC already. That guarantees that there is no intermediate
+	 * clocksource selected once the early TSC is unregistered.
+	 */
+	if (clocksource_tsc_early.flags & CLOCK_SOURCE_VALID_FOR_HRES)
+		clocksource_tsc.flags |= CLOCK_SOURCE_VALID_FOR_HRES;
+
 	clocksource_register_khz(&clocksource_tsc, tsc_khz);
 unreg:
 	clocksource_unregister(&clocksource_tsc_early);


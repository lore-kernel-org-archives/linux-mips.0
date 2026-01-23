Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6633D86323;
	Fri, 23 Jan 2026 23:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769210273; cv=none; b=W89Op93iGrFzDTlEpfK28rxSKNsCf1wjiY3xJ1BHgP5DD1tp2J7NIy05Ug4ZJ6aBvniHH98tAD7I7jEjb1M6UrzXKs6FnwL/eoURN+YW97WwMCDDnD/37UmLsefR42WuAPmMTB0jcy4lyGYIYxf1zorEtTMhAbZMIx6NqPQ3KgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769210273; c=relaxed/simple;
	bh=Y19frp7lIbPsjo/Z1VS9Fj2+iu4cl46hLTbkP0np+Qg=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=IQNYVdMgMpfKRw0JHYDpILUZd3rOLeub7Ynoor6YyGo180gpnznkqZaGPePfN21rlRoSzDDjVZZ2dVDTZmZOreE9Erg0cuSBHRBf1jypDydID5XAwpvSbonbS2amcDsQ5UYQWJr24xMHcf3+rcfGz7G4YTInLdCb7eYryE8rR6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=linutronix.de; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Sat, 24 Jan 2026 00:17:48 +0100
Message-ID: <20260123231521.655892451@kernel.org>
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
Subject: [patch 1/5] parisc: Remove unused clocksource flags
References: <20260123230651.688818373@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

PARISC does not enable the clocksource watchdog, so the VERIFY flags are
pointless as they are not evaluated. Remove them from the clocksource.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
---
 arch/parisc/kernel/time.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -193,12 +193,9 @@ static struct clocksource clocksource_cr
 	.read			= read_cr16,
 	.mask			= CLOCKSOURCE_MASK(BITS_PER_LONG),
 	.flags			= CLOCK_SOURCE_IS_CONTINUOUS |
-					CLOCK_SOURCE_VALID_FOR_HRES |
-					CLOCK_SOURCE_MUST_VERIFY |
-					CLOCK_SOURCE_VERIFY_PERCPU,
+				  CLOCK_SOURCE_VALID_FOR_HRES,
 };
 
-
 /*
  * timer interrupt and sched_clock() initialization
  */


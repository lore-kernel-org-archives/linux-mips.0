Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEB34F96BB;
	Mon, 19 Oct 2026 13:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415437; cv=none; b=Ys5HCFybFtYoKUzQP5ZYGLk4TPKTao9izz1ubYqDkgimLRqIBw2wHwnYXw0hk1SuDp383Iy/LrxgoSiBqaTo+n13dswQVUITXTqsTIWTnkSIuT9PkLlhwW593ENiBRlpyxF7/cztnu4N6upL11pKLXpkAI7/sAcpLAnGTHeyr+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415437; c=relaxed/simple;
	bh=ep5flZPEP2O78nyvnJVjTXd6HkHobBQJI/Jfhn7sIkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ME3zilWDfz/dOnFL2JXY6nXPx6UwM3LENMeT3PTMrMf3OBguVTL3g5aMuPcNQZcPXwJrhGAGZkmm58wByLTamrAk3ZX0lF6PI6vobXWaPeiFF+ruTJnvMJH92X6oDXY7zn+Eu5rIykQn75nby0LeMA5yNlUFCBKflK2fPLlRtUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbhVazCE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbhVazCE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE761F000C4;
	Mon, 19 Oct 2026 13:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415435;
	bh=GocMBD114Tn+rSaPybGANKxIGpQkngHoJhLN+aYS2LQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LbhVazCE/PNwhC96Vm8Mk9F2F+2SSX0wfkMszxK6xw099Uj4IIUzaxR5QmPu91vYT
	 37bza2io6BVtP39Oi6SEw5KmpNktewUHP5WMdtwH2X6AAPTA6WffooGG37N38sCLMz
	 riYCY2IPwfn+wt5Pupwr3VOpuaCnXt7fYoT5OTiER2fN+k/1AEaE1Ecv6sKL4tDLvT
	 Mq5iRx6KV4ejdDQghTKQN2BJkqcX/LZ1lLarMhasju1BnSX/SujXjE5p7xV8qOd71z
	 ++tZyWegBqMRCIKQiPGj8pRqpaRpNYiixNRoSMRO6FvK6MYWsQIH/VQc7d+gNjnhJl
	 rfniNj9lLNKjA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-mips@vger.kernel.org
Subject: [RFC PATCH 32/49] clocksource/drivers/mips-gic-timer: Move CPUHP_AP_MIPS_GIC_TIMER_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:39 +0200
Message-ID: <20261019130856.49711-33-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019130856.49711-1-frederic@kernel.org>
References: <20261019130856.49711-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 664831c50f0b..e648df00c6c1 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_MIPS_GIC_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_MIPS_GIC_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


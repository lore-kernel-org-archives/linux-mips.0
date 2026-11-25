Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645477;
	b=2AcquzHYfoqLXvbWXeJ6mGA0a+2ia/d3oiFA8lCMuNIgooXgyrCdLLoMpUtP1uXEtW8s
	 mQLZgszI/6szEhb5Jk9zmNqoVVMrPvqDFwhlAeqHM2/LgMmTG0H3B3VEZOTmKBBxos0uJ
	 YkfOKXJUubbIfLD8G0SRwTxM3GdpQ8TJ2Iew6BeeVUOoMQGpsWH4Oyl76YCBha5LrGHbm
	 x1ancsTN/+ZN+6S8+OC5CS6V7xKkuv+qtYqGw6lBAvR12WyNSIuIFl+XmqHRwakTO00F8
	 JSzWvcnyGxnLBpYB/NyL20T8J+pPxlMOPuzok1DnadhJQCVx2qL5nR7FoNznufG371A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645477;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5szWeZKE1z/drzfw/aP5VoEESRjMYcr18SKdRyw9M98=;
	b=oMvlECCfw8zy0PXfm3A5SdtSJ/PIn7AvSdxMlcdoKehZp1GuPc21G6zhcligG2vPKE0w
	 t8/kEdp1d+6WwVDKUXOTDLBY+1RwGDKdI3+W7pSTINM4fe4NaSB9wHhA0foR+fNK9N3sC
	 u33iVDTRS7NHtF5/RkTxkr/2efwT6Zd8cFz25VPl+MrwvqVIpac68HNYBKZ14O0P2ja1c
	 oE/BROSIFv6ZKv9oiKrJPn6S3Xm13WJPm/9f0aSQGcWHZp6+TsY8MkXopqKj6Gq5KfwGv
	 GJusmMzKBErvsFDWAQbUUDKJfgJ21fNsRsWyFDX7Dxmg/YWcLM4Wtu8dCrUpQa2oRhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q9F8DvFi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AAD606A68C;
	Wed, 25 Nov 2026 22:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q9F8DvFi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122E91F01562;
	Wed, 25 Nov 2026 22:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645476;
	bh=5szWeZKE1z/drzfw/aP5VoEESRjMYcr18SKdRyw9M98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q9F8DvFimQFL1WF6IJF0YDLDecDLFzcYbuIb5ecSsKK/Utp2YXi7paw7mpV2u+Jad
	 xvMXDHBOPLsVek4mAjiZdmGdwuhYYTDwpBbgsw25H1PqE0jhCwPugcw3sRTl6EXp25
	 SF8Op5dp8p73CDt9i9qnrdWMCX/10PrrGQZC236ju17PCN9a9SIdLfNmstJj+mTFPq
	 hRuobLtUzHz0R7ttgrGDGdHWCo9hm7TU6AVgqg5jAAg18lEdwC1VYFXagsbolUX7+v
	 5bCCPJkq0lyz9y/l194cRTXBSdZVfLFgc3FZ7eRe6it73vWDdEOEofrSGqTSl+x0Ys
	 rnIsvPYgkdRdQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-mips@vger.kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 32/47] clocksource/drivers/mips-gic-timer: Move CPUHP_AP_MIPS_GIC_TIMER_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:15 +0100
Message-ID: <20261125222230.22508-33-frederic@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125222230.22508-1-frederic@kernel.org>
References: <20261125222230.22508-1-frederic@kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while temporarily stopping/pausing all CPUs
in the system. This doesn't mix well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 9a3936cd6d79..4451c5997cc6 100644
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
2.56.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896354;
	b=PWnqkSlXI8AaDZtkLhwyTgviSr9lN1gb8SFKbgxTdwGYE+2SKkmVrgVdUbEpD+JdwLKR
	 jB+lqnjGbh9j1rmUQ6S28jF3k9WzW1Du4TtsIYLXq2hbiweKP01oWprAlbJRM2MeDr0iN
	 s5K5iFgQYBBqtBgWMWZkfYrifw7Us/dNlAoWDpWgCyBR5HkDz83tDTD9BpKZ0Pq9Hw5FA
	 SjkwpVDTrgB/QaWolYimyow3Mln7uByh7HotBBdzXczNfF4QzlBo2EZpBR7wuLy0YgMBK
	 6Gki3S0PdAepWB+ICkCKD6urzln/rDVvc5yL413Nq6lsOdu2FPSZAi6GOdst6nmtb+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896354;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Ki+nqmBhZXGuZnbX7u9v3sUjNAWL+MTXgec4H0qVAJg=;
	b=c2Xmkjzl7xqW4l1EOGBZSiJRwdNH+71fmXO2yk7TPf481JwADCOKEMU8QTaRC82ac5fB
	 IgtjMMxPhjvTfW/tX8i9gqy1+jAh0uI31NzuNwbhg7uwgcektAetWrLt1RU3eTjI5xgdE
	 +lUA4Lz6+8np11GCLvSy5qBdraYPaaT61bJ2JPYfbbHxJhw1JAFrBYIpOcOMcigAXKEID
	 6dWWsCvynY3/AilVaYs3pFm2svUZMc9613iQFpNrVNdkWk6MEZCmh1mE5jvtJzkgAqzM0
	 09uJNc0Nzr9VMRfNTeN+E3XqJPH/fULHDfuuPeFqVY1dseG0XmP0pNSIjogHl7HLssw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iri2nVqZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFE3606BF18;
	Thu,  5 Nov 2026 16:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iri2nVqZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DE51F00A02;
	Thu,  5 Nov 2026 16:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896354;
	bh=Ki+nqmBhZXGuZnbX7u9v3sUjNAWL+MTXgec4H0qVAJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iri2nVqZNV5FH5m/Q9Pp1HS9ybF/Aug2n36P8Ay8387Pj2NtJ3OT7B+33jfxG162f
	 R1EeL/d0v1A9/V+EKpvN3uT5PWJBFJk3hKa9txHB05PdhgAxpOH+rx0hRD2iqSQ4NS
	 7dUHKum/D2Ptd8aqla6oBzxsL/4yALvsewYDheiGMw0zF6tpqQP2vdmJcTcJN/Mm1I
	 29exXjRYyEQ1NHqjx9yLO1+2ZXaR6ooRaFUjTj3OMY9SGvWczb/r6Ca0kUlpqmSPmK
	 QpKajS4zD11ZZiQlqSJ36bc8dU607bUcQWid37/FNnw4BwF03BI5LxXZKbqYSBg4za
	 +jOZPK9hURIgg==
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
	linux-mips@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 32/47] clocksource/drivers/mips-gic-timer: Move CPUHP_AP_MIPS_GIC_TIMER_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:30 +0100
Message-ID: <20261105163045.38862-33-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105163045.38862-1-frederic@kernel.org>
References: <20261105163045.38862-1-frederic@kernel.org>
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
2.53.0


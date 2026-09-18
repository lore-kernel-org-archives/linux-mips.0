Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC9B38D3FE;
	Fri, 18 Sep 2026 15:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745319; cv=none; b=HugzTVoMMb8wLPoJpvRq5Mhtn4j7xJz3nOTGRu8ETHuSIZmB+BehcVTWDlxvyn6hQN/fRrgXVxTYhqFU5s9ORPG5Azf1eQwvbkB+bgNIUXMDg9sCz+T6P447Am+Vwm6hBRMCeQp/IotvMg2tFOIKR1bX/2AHYZgAMGG6oxAoobE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745319; c=relaxed/simple;
	bh=ngmES3BBLORNxEz8n977DCLtmYVSg69M3kgrGcvdz2g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mBqzjtnBfjLYszXGcqXrykT0n9OnA3HmHPySilRXlpYRGJJU+V+ajMsy/jY06OKG+TB/CzvvVsQla8OgHL0lYbKTbmZzHIYA/YD4BczIvoEcw3Whiyd1NWt+wi8gfCzxGu4IGRRgoBg280ZONY95h6AgE8Wf0fNeZ8kcscxjoVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=E6tJ35Nq; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="E6tJ35Nq"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CAA864E0526;
	Fri, 18 Sep 2026 17:28:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789745309; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=0Y9J5x0tYH+0hJYFkpp+HLGTvqzSO32qI3TlQ/QV85o=;
	b=E6tJ35Nq9qwYkHaEqZVHc2gBjfod0K2buyZuZkzK+LuvP98NuXzJkEBgq7WSjBI88vsan8
	nKvMwa5bQl4wcw12qsTUqG8l+4Rb8uNiHJjGpKKoBLuopxtdY0j4SQ63XOIEUyBKGah2wu
	3A5svhKGTMkt7JgZy9LMqnhF9A7TNmrorHu7ZPm0KxaXOwJ1N4TbT4yCyasy53S/ZvNl9a
	+pceUULsLrWYnlPC6SjWYcrvL17AoxKsTYBO7QB4yzDUzQ7OMDz1NfL2xzxXgDWx1Ouwog
	5EJ+P+Z3jHMX9ypqaJ6P2P8CDG4bJP6YFgeNMwV7CmZQSiBGBKm+6p5zw2qAnA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: conor+dt@kernel.org,
	daniel.lezcano@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	naseefkm@gmail.com,
	robh@kernel.org,
	tglx@kernel.org,
	grandmaster@al2klimov.de,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v8 0/5] clocksource/timer-econet-en751221: Support irq number per timer
Date: Fri, 18 Sep 2026 15:28:17 +0000
Message-Id: <20260918152822.343811-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This timer appears on both the EcoNet EN751221 (34Kc) and on the
EN751627 / EN7528 (1004Kc) SoCs. On the 34Kc the interrupt controller
uses a percpu interrupt while on the others it uses an individual
IRQ number for each CPU timer. Add support for EN751627 and EN7528.
Add support for IRQ number for each CPU timer under the
econet,en751627-timer compatible.

Changes since v7:
* Use %zd for logging with ARRAY_SIZE to avoid compiler errors if
test-compiling on 64 bit.

Changes since v6:
* Rebase to tip/timers/core (base-commit below)

Changes since v5:
* Integrate patch fix refcount leak from:
Link: https://lore.kernel.org/linux-mips/20260526184105.18962-3-grandmaster@al2klimov.de/
* NULL econet_timer.membase after unmapping
* NULL check dev->event_handler in case clockevents_config_and_register
  failed to fully register.
* v5: https://lore.kernel.org/linux-mips/20260516233943.49502-1-cjd@cjdns.fr/

Changes from v4:
* Fixed incorrect compatible in DT schema
* Bracing in out_irq_free if statement
* I did not move cpuhp_setup_state past the point of no return
* v4: https://lore.kernel.org/linux-mips/20260516215720.4160831-1-cjd@cjdns.fr

Changes from v3:
* off-by-one in out_irq_free
* Gracefully fail if too many address resources are provided in the DT
* Allow fewer actual timers than num_possible_cpus, as long as they
never start
* v3: https://lore.kernel.org/linux-mips/20260516182648.3987792-1-cjd@cjdns.fr

v3 note:

I decided to take this patchset in a slightly different direction from
v2. There is a certain amount of initialization that once it has run,
it cannot be reverted in case of error. The original driver init was a
mixture of revertible and non-revertible code which made it too easy
for code which is designed with best practices in mind to in fact
introduce a bug. Therefore I start by making the init process more
legible but without any business logic changes, then fix a race
condition by keeping IRQ disabled until after cevt is setup, then
finally add non-percpu IRQ support.

* v2: https://lore.kernel.org/linux-mips/20260514000601.3430262-1-cjd@cjdns.fr

Changes from v1:
* Split changes over 3 refactoring patches + main patch
* Remove driver discussion from dt commit message
* v1: https://lore.kernel.org/linux-mips/20260416175101.958073-1-cjd@cjdns.fr/


Alexander A. Klimov (1):
  clocksource/timer-econet-en751221: fix refcount leak

Caleb James DeLisle (4):
  dt-bindings: timer: econet: Update EN751627 for multi-IRQ
  clocksource/timer-econet-en751221: Init teardown on error if possible
  clocksource/timer-econet-en751221: Disable IRQ until cevt registered
  clocksource/timer-econet-en751221: Support EN751627 without percpu IRQ

 .../bindings/timer/econet,en751221-timer.yaml |  31 +--
 drivers/clocksource/timer-econet-en751221.c   | 181 ++++++++++++++----
 2 files changed, 159 insertions(+), 53 deletions(-)

-- 
2.39.5


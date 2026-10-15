Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D8C3BED79;
	Thu, 15 Oct 2026 14:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076035; cv=none; b=JEA4tqZ2ULK1Ctkdt0Ymt7mQxk3XGfOKP9rNeE3lDo/8FUjIxJ4sGCvdmPQu5+CUImxO4Ly9PVSRhI0iq/JYAq7hcati3V6xz9HasuR01oFI9dcv1l8/XY/UFsGwCHzy+kzA9/jU6MpmlKYEV9/s8oSMiF4100+DBOTnjWoM0XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076035; c=relaxed/simple;
	bh=bqcfBCgYsB9ZtE8OlSD6Jglr+qUCARckYjJJsi63qfA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aGBnfktT1BZO+lt3mFHSWC5AZsNFpu/CK079+hrXYTQNukorhDQug2eCzhkgcGo+cTJ/rHsaHasMdR9YWP/UZrDBGe8Q6yeZ7pwUeMt7FayFdVpu85nZVUdJZFRI0W8RoWeoY8pQhRF69Yq3O0KANhEGbHicoci79XSHjn1x4eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=oMVm8ZSk; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="oMVm8ZSk"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA9865AE6BD;
	Thu, 15 Oct 2026 16:53:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1792076028; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=RXL920K2AccXRK21o/mWNGIz7E5QvJkjVNn0WJ8HmE0=;
	b=oMVm8ZSkYN56FUZyvT9Uwk2pPXqkPsv9UqsMRJsUi4vA8sBbA9VRZuS/4RCl5yVxwOicrX
	c+2ur4y7M8xr46N2DAMJZtV5X/NCnVVJ3Dyy0IS/8rAuEpvL6CKOJc5me86i2AR8run84P
	8JV/tF3yqKlxCzGyuC2NyJUt9ZdO0Qx0+9c0GZ11+c1w1KvUcJvy4y78Ijw0V5ryHs45MQ
	AOFCcNUU3QOiCc4V30Ee9XbP+bIODvMWJvY878jXnyQ6zFweVXIg01nCYfxfBRnLC6qY0V
	KXSW2E5D3t9DV/OqWonHL4wcNJMQlZeE4z6oOcgDQeerI23RpjXRCilO6YVUIA==
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
Subject: [PATCH v10 0/5] clocksource/timer-econet-en751221: Support irq number per timer
Date: Thu, 15 Oct 2026 14:53:26 +0000
Message-Id: <20261015145331.453837-1-cjd@cjdns.fr>
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

Changes since v9:
* Use dynamic size irq and iomem block arrays based on DT
* Update commit message explicating that CPU hotplug is intentionally
not supported

Changes since v8:
* Actually git commit changes from v7. Guys, I sincerely apologize for
the spam.

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


Caleb James DeLisle (5):
  dt-bindings: timer: econet: Update EN751627 for multi-IRQ
  clocksource/timer-econet-en751221: Init teardown on error if possible
  clocksource/timer-econet-en751221: Disable IRQ until cevt registered
  clocksource/timer-econet-en751221: Support EN751627 without percpu IRQ
  clocksource/timer-econet-en751221: Do not use NR_CPUS for resource
    array size

 .../bindings/timer/econet,en751221-timer.yaml |  31 ++-
 drivers/clocksource/timer-econet-en751221.c   | 204 ++++++++++++++----
 2 files changed, 179 insertions(+), 56 deletions(-)


base-commit: c40b76c8cf580466d9e56223f7f74beecc165480
-- 
2.39.5


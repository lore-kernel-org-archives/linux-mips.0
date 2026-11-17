Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.135.140.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909085;
	b=psur8lSVgwcimu+09EmbcI6mKdfTq6lnmDs+Q1Mk5/2fbyWkbzfKbXe4Lf9gKz2coYlW
	 CgeMFOGpRYgtopnf7iwUEpu8UKrOIhLGIzeaAcQ9ZOefghjcR45d2ZCAWQUzqoLoBG/fl
	 zgpO4gXWZKlUeThiiyCHQZKCwnRVQzBVOUZ51u2Y7SPxLV0YCRlKTjc2CAvZeMuC8Sw7T
	 U93U2VwmucpQlmZuoG+YfhgjDo7116kzrHCy/zSYGLpWFm1POqUg656zalLtKRAzmN5es
	 v09guc6zAt2G5sjBeZ36vXEHD1M7aUs6lnP5ERurBHo644HOKUr7hzKwpeB0/2Wa6UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909085;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=8QGRrjtcy7R8vfKCbp56fKR8ZrLT6epmRKadFazehRA=;
	b=BInPFUbAmQzdGvRvm2omN0RdPT0jBDPTZbOUaWMYXLX7tZBkgVlab7gPKTv1oM1XWF4P
	 FLugcm/nsxCj03bBamRbNr2K+YyP0sT9bS/QO5geZOIbYaoXK4E9mJRXKo1gOkg60km5w
	 8i5DkPbMQy9PcG975j7PS6wTb86ON5EddO/oErJZ8DHsBUHx0vcUKOFG3NEFdDH4KGjZK
	 pVESJ9HZF4YFbHnny6fGlk39RDjgrQa7/hBVvYUyob6IeOEQAyf9oh3Fzq5QkRodq/B1v
	 /jrKhDsBy9cGUDb/biGkHHCiCOfde01eLTLQOwRfRMBR27m67k4nK2prv6I5JPmnScw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cjdns.fr;
	spf=pass smtp.mailfrom=cjdns.fr;
	dkim=pass header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=a+ZMPlz2;
	arc=none smtp.remote-ip=5.135.140.105
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341D7606A31C;
	Tue, 17 Nov 2026 09:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 341D7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=a+ZMPlz2
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61254518ACC;
	Tue, 17 Nov 2026 10:51:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1794909082; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=8QGRrjtcy7R8vfKCbp56fKR8ZrLT6epmRKadFazehRA=;
	b=a+ZMPlz2loQmIdRt40DR2Mo4KxW1D4Ol8rS+LL8GH1DoWKtLYBob++YZQ+FGatUdAFBGoy
	JqCkSgcTUmeS2SH2cuzbkZfSfYt/p7oSWtQ9GS6Og84wztxv52Ih+KNmcvMYQMlFSP9/nT
	uIRkJK1x5ZuiU16B9tGW5nrEW2/uECy7p75tzACr1LvBvF+7kjUoAqXUPUBrkKLlak0ZzH
	iuYlZuud6+TnVCxWFskzlGYCRd0j1Sw3s6TPEHpodBBCKsCAzx52MDDkF4LwO1L9rib5Y0
	aQ4kU7Vt0My0ETwPwk2xUHxciKLn4mKAbyInbrmYRH5iC9s89G8Tx7lRKfdghA==
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
Subject: [PATCH v12 0/5] clocksource/timer-econet-en751221: Support irq number per timer
Date: Tue, 17 Nov 2026 09:51:12 +0000
Message-Id: <20261117095117.173316-1-cjd@cjdns.fr>
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
X-Last-TLS-Session-Version: TLSv1.3

This timer appears on both the EcoNet EN751221 (34Kc) and on the
EN751627 / EN7528 (1004Kc) SoCs. On the 34Kc the interrupt controller
uses a percpu interrupt while on the others it uses an individual
IRQ number for each CPU timer. Add support for EN751627 and EN7528.
Add support for IRQ number for each CPU timer under the
econet,en751627-timer compatible.

Changes since v11:
* Update to tip/timers/core Nov 1, see base-commit.

Changes since v10:
* Unconditionally setup clock_event_device for all possible CPUs so
that error log will not access uninitialized data. Identified by:
Link: https://sashiko.dev/#/patchset/20261015145331.453837-1-cjd@cjdns.fr?part=4

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
 drivers/clocksource/timer-econet-en751221.c   | 206 ++++++++++++++----
 2 files changed, 181 insertions(+), 56 deletions(-)


base-commit: 0359ecff58853a491dd0f09792fea8e87235ae06
-- 
2.39.5


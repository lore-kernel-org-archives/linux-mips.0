Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616DE47B43A
	for <linux-mips@vger.kernel.org>; Tue,  1 Sep 2026 15:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277999; cv=none; b=o2E+UYTNe1Th/wBvD5mqPAQjTPeC3YBM3/apONOAyNogXFZa/pbOz0XjgJmbd+PPLXMfFMatbODbBr9nQneLeuXGZiCmXmQc4m5sw8ZPQG7qiR3WOepfUeA2X2d5ERG2Fm1cwM/T7voFTzdMIIYilNVqYMBu5eYqLG3cWlQOEWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277999; c=relaxed/simple;
	bh=0JXQFUmcsNd4avtn3ZtfTwCk4B5wNAMtuWRh+fHF0Cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z+cUJwkDTxP59KDdnZriLJkvAjITtywTJYaofsLIDUgyWCU+RrJegLSDBwFeSEzcsLT6O6B81BwhDm6T3xSh/4VCxC6wHzLgTGdjV/Q4MegN01nCvbZeWs44zDjG0MjpFbWfa4XJkgDORr23lLrqmhu/wS88Fhx4e38WH2z6et0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ISvsPglf; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ISvsPglf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A361F4E414AB;
	Tue,  1 Sep 2026 15:53:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FE366053C;
	Tue,  1 Sep 2026 15:53:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5916E11C79284;
	Tue,  1 Sep 2026 17:53:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788277989; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0JXQFUmcsNd4avtn3ZtfTwCk4B5wNAMtuWRh+fHF0Cs=;
	b=ISvsPglfVp3adi7qh3VvOLaUjGFLPzHqwfFiAZGivSxD70nkHQD1p5+pcxKXVBR8i2mK7u
	Fr/1zf2jtVG47A7SA/06NfkIXzHSuF8dVkm7q13fgqHQ6W9IFjg1hVLVF00MV/IPGxMCbX
	pgH2y5h4Ep38kVzRG8+BjEMFG51RZ+kPY7J6nRoik4Ekhi1+WJWvuHhvGnJYgELLO+6SC5
	xTXHMmd7S+egDvRNTm3giNND5dzdYxd9w4tc2wUbJI8fZEx322m5EuLFw5N7o2FWyDTZJB
	UjU5XeLpSp4UroGONo+V7K0bqPQ++aycx4cl9jIUHA9ogCBS4mmZSpoWFwY0Fw==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
 Chao-ying Fu <cfu@wavecomp.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Paul Burton <paulburton@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 4/5] clocksource: mips-gic-timer: Set next GIC event on the
 correct VP
Date: Tue, 01 Sep 2026 17:53:06 +0200
Message-ID: <-6r_yDA2RwW_Yn6kas-7SQ@bootlin.com>
In-Reply-To: <87o6exi3pi.ffs@fw13>
References:
 <20260810-sync-gic-counters-v2-0-dfe8b2c376b0@bootlin.com>
 <20260810-sync-gic-counters-v2-4-dfe8b2c376b0@bootlin.com>
 <87o6exi3pi.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Thursday, 20 August 2026 at 10:41:29 CEST, Thomas Gleixner wrote:
> > gic_next_event() programs the next event on the clock_event_device's ta=
rget
> > CPU. When that CPU is not the current one, the compare register is reac=
hed
> > through the GIC VO (other/redirect) window, which is first pointed at t=
he
> > target VP with write_gic_vl_other().
> >
> > On a multi-cluster system each cluster has its own GIC. The VO window of
> > the local GIC is what write_gic_vl_other() redirects, so when the target
> > CPU belongs to another cluster, write_gic_vo_compare() lands in the
> > wrong GIC, overwriting the COMPARE register of a VP in the local cluste=
r.
>=20
> The MIPS GIC clockevent device is strictly registered per CPU with the
> cpumask of that CPU. See gic_clockevent_cpu_init().
>=20
> The set_next_event() callback of a per CPU clockevent device is _always_
> invoked on that CPU and cannot be invoked on a different CPU.
>=20
> So I completely fail to understand what this cluster and non-current CPU
> voodoo is about.
>=20
Going through the log, here is what I found:

The commit 414408d0eedd ("MIPS: allow GIC clockevent device config
from other CPUs") was merged in v3.16, its intent was to make the GIC
clockevent usable as a tick broadcast device.

Also in v3.16, the commit 0467811e9bdb ("MIPS: mark GIC clockevent device
with CLOCK_EVT_FEAT_C3STOP") sets the C3STOP flag. With this flag, as
I understand it, the GIC clockevent cannot be used as a tick broadcast
device. So the set_next_event() callback is always invoked on the CPU
of the event.

The `if/else` was added later in v4.15 by commit f16ff2bdb135
("clocksource/drivers/mips-gic-timer: Add fastpath for local timer
updates"). But the `else` path was never called.

I am going to drop the `else` path, should I also add the
CLOCK_EVT_FEAT_PERCPU flag, or is C3STOP and the cpumask enough?

Thanks for the review,

Beno=C3=AEt.




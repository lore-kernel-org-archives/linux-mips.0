Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795275183;
	b=0tedPuYt70lmE16cbtM7b0lM0wkkMoa0nwyDqlHoAaqjRyAXEINPIXSH7uYgKlxy+jqY
	 Px4BzxubU6EHBediIzG05Ih6CrdTEliwBTHObPVzvumzLv7QPMcZFMF1fLZqlRborKnl0
	 C/hCr43OW0vVcrBZ1cVKVoQRBYb++7GKnMs5rSj8fMGzF7eZau/S7Mv7B1QsBqpUUbrwZ
	 u3JmUwXJjwKO5YisQ0e1+HBJM9PAAd/+TZJspGfB7di7xcgpi96i6IC6+RYWyLfkDO77M
	 4rFeyp5m5R9li0d2kaPzfLWvpXezs0mkuPlXPWmpxjA7oj9mrWmAMDy3Rv3reCOSA1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795275183;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=7HyyXNTCfn/npdExKG7fu+OYbQyYVLSOwuM2ZpnCsh0=;
	b=urJSCgc7abhPMaHN73uK9UqPCKauqossiAj+ParoYjtR52GA7eA5MVMLNWL0ANYhNJEV
	 tcBtq46Noy+zYSumx1LZBJcCVlxQfip9GyUoRkEXPUTlTEod9t2loUC/r4xe60xC/KRat
	 RfpMBVuVTewWLGkL5F8iRWKZm0yGKxt1REjzlWesS67KxI5kVe2uFl3QBtZmmvgACSxfO
	 robmVhm2ZESPwJ+nSfekz6vjvfJkrqJwtHNdIZnsiwkUreJRWh/PF7YB7ljkOs+gjLY3g
	 nIHWCvWVX16HfscfvNQva4e42M0Khzc3vxyLVGjDezY25FN9KeT/6OLS+C290RG0wCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dn3pqRIY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655F6606A32A;
	Sat, 21 Nov 2026 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dn3pqRIY
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795275182;
	b=Ok6lD/ewgKp8HSzWgq+y4NOLgLGO+wD32Lqdlco7unbQVk8HV06KyCrcnSclp4C9NtP5
	 +Dhw64eWM/JCjKeD99p4Rpsodt7EmriaxU9qAeC09mHGEeGRoQFBxeetMOLEZ/+Q/4Gwd
	 bEJSh0epRdy1ifcgKVFSIm7KrL0UpE4pkR1kMQ/I1jU1qnGwOQ0poGlZcRnHfl9tSLj1V
	 joROkKPRgJ7BYn/UPJOXZCGydrknxyn4f9rlC2SMywR9oAC2y/SuUQrVRezteAt/qnbrk
	 YLOXemOtwJT63kUkR3U3a9tabiEAUxhAgRDvmLpR9Qqv8wQvuSTd3dfgYTnh2S3k5OQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795275182;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=7HyyXNTCfn/npdExKG7fu+OYbQyYVLSOwuM2ZpnCsh0=;
	b=iCGz5ZKu1Im6p325TZpVQL23WP7L8An1cNVvqFtFioe0qvlxZXBxM+h695uuQA3HPxky
	 UQBtL5K53sroZ+b0jqbVKsz4Te5Xc/VxEHLFeVSQR2shWSDBJFtacwxhaNjODvgOmHp6H
	 1nwfIaFuuMTw2jlQIjA0vjxgM4lfC+0qSdH3gVvPXEJL0A3QvRFUbVNBZFt5E0Tp8wst6
	 MOgxYmG0QH9hNaCUYRPSENrykkNTkvtraa75RSAeSD9U9iGj5lbA0Vp4fJba5ut9zwSGe
	 jvIu0ohWQr3IpqVMBrRj6Z2T/ZqaT6ZXuhVnnfoX2nPAg8zSxDgPX95OIYcKTWmZB/Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A4551F000CF;
	Sat, 21 Nov 2026 15:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795275182;
	bh=7HyyXNTCfn/npdExKG7fu+OYbQyYVLSOwuM2ZpnCsh0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=dn3pqRIYtRthG+NUp4nYMXL/8tUKY/HtHEmuIcrF6gXNJFjGPIco/yRT3nIzpaI5k
	 lZX9kCUS3nwIKhbqoKEHCqI6/r0tB9gBVUaje7sG/RVz6ZcR54M8sK5mHkCTIGhkOs
	 RbbEMaMSR+1cJhXGdzeR/7s3JohKKE0vOg1OyXWSw2DSDoL5xbi+DKa8nheHQG8+/L
	 cICqJPd6Gp6oK979i5z8tfIWQMx/cvaAy3k903VksN8G8jlq2d2NNEP4TjWNNqTqMR
	 oQPWvArKM0ZJ8ZLEaGBvSBK+81LekoxcYzYgwUZs0Kcr4c3ntme9m55NEHkXVCpqYR
	 ZlePbEjx0E2+g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9332C4BCCC;
	Sat, 21 Nov 2026 15:33:01 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Subject: [PATCH 0/2] MIPS: rtlx: Fix two error paths in rtlx_open()
Date: Sat, 21 Nov 2026 15:33:00 +0000
Message-Id: <20261121-rtlx-v1-0-bc05d6763ec1@gmail.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKy5AWsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyND3aKSnArdZCODxLQUS2MjMxMzJaDSgqLUtMwKsDHRsRB+cWlSVmp
 yCUivUm0tALaT/YZoAAAA
X-Change-ID: 20261121-rtlx-c20afd932646
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795275180; l=610;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=gp+9Dc0zHizgJ22P/f77EmMig+HbauItSUwqcGIjs4U=;
 b=GGINSRPN+mZuBMoU53CX9Fq9yNb4S116+enwuhSEKpuryV+vY0YqeruzQmljk4tRXNmCMKhra
 4y7scOPTFvHDymskfAch+vU6dqPT+rdMKBG/xe/23azWlfOSY09cJEC
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

Two error paths in rtlx_open() leave state behind: a failed
rtlx_init() skips the in_open decrement, so the channel stays busy for
good, and a signal while waiting for the SP program leaves the stack
wait entry on the queue.

Found with a static analysis tool and checked by hand. Compile tested
on mips (maltaaprp_defconfig, W=1); I don't have the hardware.

---
Suyuan Wang (2):
      MIPS: rtlx: Drop in_open count when rtlx_init() fails
      MIPS: rtlx: Call finish_wait() when rtlx_open() is interrupted

 arch/mips/kernel/rtlx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)



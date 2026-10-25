Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792956091;
	b=w3F1d+Ox7kNRNgrP0KNXjo5rlVFhYPO6RPWVI94L7+KGzDPRQ1+3hbwNLdoDkoYLg1NK
	 SOQ9cntNpi3MYW8a0rOfhz9FYVVY9XT0r7ETFrYqtyeGmxIakQsau59AHEZjaxRr+5nnr
	 GJCh8DZzEQ0wI/JR3YEDS/P4iIYieO8k8AMUFf3teFadDgOISmF6I8AOLEHaumbAMmkVp
	 x8ItVx64aw6O4CCJOVXyeBoIQmrIbrIpxKq9HPzNj7SLh16r5U+wapAoy8LUYYPU429I9
	 Z2KXpRMRzK2eCGuyws1/WcITP0gEavSpaXWj4mG631/3Zw+IntArr+C8wnX6urhtX9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956091;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=109EU7K31vrMxgSiDX3Jfe909NKoOXY2SRpLxQWDJgE=;
	b=BgUt/ai7j3SreMElHjFFOImUX5LlRXM5cnr1SIxuGP/xXaWh5o6iP/MrvQ7Mq2M7stUe
	 Qda6N2d2bvTmp9yVm79UvhJlHxt/4NNamHaa4fliGkkrKRGqKKheJmLHcJ+j6zaZK0Z5A
	 FcWMqVGAidLD3WZm92qgkPdpGH06QGqF6eAYujyn9I7aQesfYdNlnJW6cBeTJm00xqSlG
	 mg9Lr9P/0YctBuecZLWsJK4ZZ1F/JA0g2oH0PrAUqzGpxra8cEbuOm/6gYUqMhJBCUN0L
	 OO1xp3mizLbVa85s0H6tiOpgj8q7xN3I1TLzNsjBBn4iI3gdzJgDZ6QOG9+/YBjmerA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=RP8xxFsr;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=M6D0qwra;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.173
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [81.169.146.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09E0606A31A;
	Sun, 25 Oct 2026 19:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B09E0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=RP8xxFsr;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=M6D0qwra
ARC-Seal: i=1; a=rsa-sha256; t=1792956062; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=EIay1K7K2kJhCXIgoGwMn+Vnv6m/AJukRCh4ZDvdiCVD/WMOIT3Eu6MeNGNJ5Hymk3
    OYDx5wktRVv1Th6YOaJZ68LNPgp3HiJwEhAXZ1SE5ft4K7iS9e7X0FcBumBNGrHa+jWR
    2PVEBXpp9DSrCt1NIZVp1FsF8otMsYcS+yF3aC4fTrY99fTnQAJIXH5OIbQIeiForLlG
    kXjmNRCZeD0ZBClkXsPxY+jdk0Hvo0/h+mqIES0kUNxN0S3om1UFwDLU9ebcayeyt27Y
    rXUQOFvDj9zdw5CSfg0E1soyRn01bEChWgK4Kg9+qgJJYBM3AwRFYrWKAM04nvgDTjQW
    bVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792956062;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=109EU7K31vrMxgSiDX3Jfe909NKoOXY2SRpLxQWDJgE=;
    b=BnrXi8Wen9cZr2rpN1Mv8YuTIHobKM6negu9hg1c1h1pYmuMP0fTrFOjqqzd28MpgS
    Kz9KzAZq32vwiOPXJcLrpK6HJXu42S1G20UDkcQfwQvtUPJFcM7BiJizuYRONzBj3C5Z
    tOWOyzEhY/5Pq1Kr61PtchJtUnEjrCz8kGlYECtKG2AIY8K3AlzrEe+ztnriNSQItyMy
    nyTric4TE08w0DVo7/hrTEgQs7YJEb/0gkyn8sszZM0c+nvTZVEYt18SePFMesKFv1z7
    WxoJ/AAg1K5USrYW0v1XjoaH/LaLoWhWLkyc+Ufh8+1yjjjxz+tbphjw7bHndcgw59ug
    6kwA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792956062;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=109EU7K31vrMxgSiDX3Jfe909NKoOXY2SRpLxQWDJgE=;
    b=RP8xxFsrCWaJ8btzcIl2AKmzxCvNJkkNH+2+yeKj5BB8RJPbKjhLFFO/zAhnhNcD0H
    G8UJYgDbQg0N1dLmrbalk4Qxu0FFu7NXAmM4ph1G3fOd++7wmdsXuzI5S4b2yr8lkZA+
    Cd853M4IChf0TvwIffZonHzih3z3cCA5SGBpbvmwaYIpiy/FN6fojFwyIrRn3XiMW7H1
    6X8fXzBuXFBgD68CIfSl7gk+me3vcjvrpUtIi9GC8N+tDRqEBnjQ/lF3/awmvVs5tz4A
    y+qr/dHXRKizVE0k7qQh5NocbKbTzZkHSXfjdRn4vd4O85/yL4qMX6he80sEzhO3btu5
    gGSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792956062;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=109EU7K31vrMxgSiDX3Jfe909NKoOXY2SRpLxQWDJgE=;
    b=M6D0qwrarG8IfHxdNrxDNxJw+qV9CiHtU8ZX8CiQaGRm9Uob5su4vkT5s1eBAYKlQr
    Uh/sKD4DL2emn8BIKRBw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2poNy8iNoc+LWkugLIF0fnfvFgpgbBBt2w=="
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229PJL1zRB
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 25 Oct 2026 20:21:01 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Paul Burton <paulburton@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 0/6] MIPS: Ingenic: Add XBurst / XBurst II infrastructure and SoC support
Date: Sun, 25 Oct 2026 20:20:49 +0100
Message-ID: <cover.1792956055.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PATCH V1 2026-10-25 20:20:55:
The series updates the Ingenic platform support to allow clean transitions
between bootloader-provided Device Trees and built-in fallbacks. It provides
the foundational Kconfig, PRID, and CPU-probe blocks required for newer 
Ingenic/Lumissil hardware generations (X1600, X2000, X2600).

The first patch corrects an inverted Kconfig condition regarding appended 
and built-in DTBs. This fix is necessary to allow configurations where 
the kernel relies entirely on a Device Tree provided dynamically by the 
bootloader instead of forcing a built-in fallback.

The remaining patches implement CPU-probe initialization, correct PRID 
mappings (including vendor-kernel values for the Ingenic A1 SoC), 
platform load addresses, Kconfig updates, and generic board match updates.

Structure of the series:
1. MIPS: Ingenic: Fix inverted MIPS_NO_APPENDED_DTB logic in Kconfig
2. MIPS: Ingenic: Add and update PRIDs for XBurst II R0 and R2
3. MIPS: Ingenic: Expand Kconfig for X1600, X2000, and X2600 SoCs
4. MIPS: Ingenic: Add cpu-probe setup for XBurst and XBurst II R2
5. MIPS: generic: Add MACH_INGENIC type and compatible for X1600
6. MIPS: Ingenic: Add Platform makefile for X1600 and X2000

Testing:
The series has been compile-tested for generic Ingenic targets. PRID 
values for jz4780, x1600, X2000, X2600 were verified on real hardware 
(CI20, LX16, LX20 and LX26 boards respectively).

Please review and consider for inclusion.


H. Nikolaus Schaller (6):
  MIPS: Ingenic: Fix inverted MIPS_NO_APPENDED_DTB logic in Kconfig
  MIPS: Ingenic: Add and update PRIDs for XBurst II R0 and R2
  MIPS: Ingenic: Add cpu-probe setup for XBurst and XBurst II R2
  MIPS: generic: Add MACH_INGENIC type and compatible for X1600
  MIPS: Ingenic: Expand Kconfig for X1600, X2000, and X2600 SoCs
  MIPS: Ingenic: Add Platform makefile for X1600 and X2000

 arch/mips/Kconfig                 |  2 +-
 arch/mips/generic/board-ingenic.c |  3 +++
 arch/mips/include/asm/bootinfo.h  |  1 +
 arch/mips/include/asm/cpu.h       |  8 ++++---
 arch/mips/ingenic/Kconfig         | 35 ++++++++++++++++++++++++++++++-
 arch/mips/ingenic/Platform        |  2 ++
 arch/mips/kernel/cpu-probe.c      | 14 +++++++++++++
 7 files changed, 60 insertions(+), 5 deletions(-)
 create mode 100644 arch/mips/ingenic/Platform

-- 
2.56.0


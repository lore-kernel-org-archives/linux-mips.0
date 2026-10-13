Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6693DD85E;
	Tue, 13 Oct 2026 09:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884819; cv=none; b=fwY0U8n+I/4woXXzhC1k2WFoyYdZxQ54/bIWJGqY8lVicQBGJEiH05oemhmIkpL8L/zZf5/jWpRQHQ1VCZhuGCeEbzILJtDCZwehq8VYoQgfT/3g4GBgHWhkDRGwmGc/XRQKtkG7KFwKLcDIBGcTDexstEAKbr0w+VLFaEgHUAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884819; c=relaxed/simple;
	bh=11JvhVAviNlqN/3pV7OpL8dr4fa0SL1d5is+begCjXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cy5MJobGzdfJJHXEpwMnGcqNTf0Dw0iVcsPgXVXrxg41eFFsnGcfjwqSsxcVnlYkxu22EuZRTE96fiSpuPcLjn7mFGcRNDO4FKFJAKG9arja0JAs1r/M+2ur+CDvPTyp1yr3YVWExS/4hk8muQ/+w9MaVWDhd9DkhPJvbq9TV9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgJ60sM0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgJ60sM0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CE91F000FF;
	Tue, 13 Oct 2026 09:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791884817;
	bh=VL9RjhaeEiFwzot3Y/ih2ePcqTjy/Hx4aXEqd5qlyA8=;
	h=From:To:Cc:Subject:Date;
	b=FgJ60sM0oHpADzSGf3tvNvyZh4RFcSjgSuDE9g0DsOi6ucGmw2FesUqKJol5XAJ94
	 0+TffIxLAndzVRhTEDrffVpuzdU5EBFvPo8qwQ1g7Tn86R/ldAGhGrD1ATa+dHwJb6
	 LRM2hfL8s/aR6UeYosrpN91dGukT2LDwNYlnSJKROz0TKJv91QS3RT+F1LtAZ3149S
	 wTZ2rvCpQ/44TwnhvzESavNs2rN8PA+VuTAP+qJMWcrgVOmp2yVpeqsMflw75eK3hf
	 jcLXYtYeNAmDF+YXwRHJOftzISihGOLl+bsJbe7rEoFhxixBIVhxolUe5cM50iupeZ
	 Y4x6GNRKWSvyw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] MIPS: SGI fixes
Date: Tue, 13 Oct 2026 11:45:51 +0200
Message-ID: <20261013094554.16804-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes for the SGI O2 (IP32) and a defconfig fix for the Octane
(IP30).

Patch 1 clears CRIME errors latched before the kernel starts, which
are otherwise reported as new once the error interrupts are enabled.

Patch 2 reserves the firmware memory listed by the ARC descriptors on
IP32, which now ends up in the page allocator and CMA.

Patch 3 enables the 1-wire drivers the Bridge probe needs, and the
DS1685-family RTC driver, in ip30_defconfig, and drops four lines
that savedefconfig removes.

Tested on SGI O2 and Octane machines.

Imre Kaloz (3):
  MIPS: sgi-ip32: Clear latched CRIME errors at boot
  MIPS: sgi-ip32: Reserve the firmware memory
  MIPS: SGI-IP30: fix the defconfig defaults for the Bridge PROM and RTC

 arch/mips/configs/ip30_defconfig |  9 ++++-----
 arch/mips/fw/arc/memory.c        | 11 +++++++++--
 arch/mips/include/asm/sgialib.h  |  3 +++
 arch/mips/sgi-ip32/crime.c       |  4 ++++
 arch/mips/sgi-ip32/ip32-memory.c |  3 +++
 5 files changed, 23 insertions(+), 7 deletions(-)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.47.3


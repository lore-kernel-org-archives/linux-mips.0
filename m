Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626685218B4;
	Tue, 13 Oct 2026 13:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897551; cv=none; b=TC8Hnqwsg7/tvRyiGNPl256of+9LIAxjhEyV87LW0HCuue5wUFJKtW5Pw2MEw9ANZyajV9xPEnaLudiamcltFjQQqG9bN9NnJzP/LVm51D3z4rJ73WZrXIRzU2OoRb/7iC48pdb6xdRe+ZOcjy/66QNer0Qs3r2g/iSLDTgk3Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897551; c=relaxed/simple;
	bh=wSrELT6+sjhbjyiW5BUYcAuK6hQIQfF7DIAbpMEKDZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tSnipKU9Hf4LCVD/bnZe1Jose2qQ8ZNOxRjSPlDSI/n7HO1WQQNWoXfVjxvE9Ei/JeuhAyFdjZC2b/013hjeltNCwsIZmLVPXUiaJjR4stFtq+o4l0vgRoos+0jp7SiIpbFWBPg+NKKO4yamDvaO3wjm0AuvZCE+3CQtwM2O2pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPmaBOlr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPmaBOlr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB741F00898;
	Tue, 13 Oct 2026 13:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897550;
	bh=3nuZZMqTUR9ik1K+bS/lSh6+V3lpBnjptzggzytIWvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IPmaBOlr2+xxq3VlLUCIrYHA70OdKmpAJrW/Lmyvv6OfzykNmoLKDTWISd2CD9umt
	 U7lORY9KkNC/fzgeRC7gtf0Qx0P26R7sMu7HEgyyHJeS5mOajxEH59ooMGdux57HlT
	 pgvme+wmAsdx6CFIZKAmF2W9vTwANGkF/wXEC4yvRTQbXWwHNkXOI3rLia0pnp85D9
	 BMNhbsFg268LeLn4plyye5wz8/0+4duhiSMGFFNPz/QxRleAi8T/WM6ZitiA76U56o
	 bVYdHtaOovZ/uxt9IIz+n5+j3I1XcqR3W/J+wK7Bfes0cBJkcAujlcEJ/abJR5+F4x
	 83d69xdmsJKjw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 20/53] MIPS: SGI-IP27: take a CPU's node from the CPU table in per_cpu_init()
Date: Tue, 13 Oct 2026 15:16:40 +0200
Message-ID: <3e3d0343b98eca6c9770db23c048fd09471ffeb2.1791890466.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791890466.git.kaloz@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpu_node_probe() records every CPU's node before the first secondary
launches. Take it from there, so a CPU coming up inherits its node from
the boot CPU's scan instead of reading the hub again.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index 88d79c50d9a7..15811fb3cdee 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -81,7 +81,7 @@ static void per_hub_init(nasid_t nasid)
 void per_cpu_init(void)
 {
 	int cpu = smp_processor_id();
-	nasid_t nasid = get_nasid();
+	nasid_t nasid = cputonasid(cpu);
 
 	clear_c0_status(ST0_IM);
 
-- 
2.47.3


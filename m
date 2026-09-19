Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6EC03769E4;
	Sat, 19 Sep 2026 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789830884; cv=none; b=o0ltxtEi4/7LQZ4TXxmdEbrPc1ZqhMmpwpEHloPHdvYV2pd6zvBXzJc5STbwvC8tMVR6055nv7NrgF8Pe0Ig9J6KPPyCEzrd3SbKSW9KYk5Zzhv4tm0kTV3pV1VpNLLQ5dpTlV6hhCZBWK496FoloaapYNJv5uinp5SqprfyCdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789830884; c=relaxed/simple;
	bh=Soosyl9B8kUIVH2X/+A8VPpLWlb5U7glSU3x00Pe18E=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tp73yDpNq4RCXN4Nizy6knRcTrFA8cL1ma2euJF2Zz8MIWJ/MsVoke5SvuDI8z+pPFQcgj2suaqwmqa58F00mo1bJmwgdogs3+ukYlCxMaaXWMcoRqPHbLrOj6HaStIDCRalZAGEeezPopmkAHlBFcOIM2APjltKuLv4xEH1n8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 63C4D92009E; Sat, 19 Sep 2026 17:14:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5EA8692009D;
	Sat, 19 Sep 2026 16:14:41 +0100 (BST)
Date: Sat, 19 Sep 2026 16:14:41 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: WangYuli <wangyuli@aosc.io>, Chen Linxuan <chenlinxuan@uniontech.com>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] MIPS: decstation_64_defconfig: Compile the kernel
 with warnings as errors
In-Reply-To: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2609191549521.27665@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

From: WangYuli <wangyuli@uniontech.com>

All compilation issues with decstation_64_defconfig have been resolved, 
and it is safe to enable CONFIG_WERROR now.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
Changes from v2 (6/6),
<https://lore.kernel.org/r/2AEFB36427BDF18E+20250422102253.137944-6-wangyuli@uniontech.com/>:

- Slightly reword the commit description.
---
 arch/mips/configs/decstation_64_defconfig | 1 +
 1 file changed, 1 insertion(+)

linux-wangyuli-mips-dec-config64-werror.diff
diff --git a/arch/mips/configs/decstation_64_defconfig b/arch/mips/configs/decstation_64_defconfig
index bf579866cf4b..12415c5dd28c 100644
--- a/arch/mips/configs/decstation_64_defconfig
+++ b/arch/mips/configs/decstation_64_defconfig
@@ -1,3 +1,4 @@
+CONFIG_WERROR=y
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_HIGH_RES_TIMERS=y
-- 
2.49.0

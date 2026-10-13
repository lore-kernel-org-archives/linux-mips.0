Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A92C51FCC8;
	Tue, 13 Oct 2026 13:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897533; cv=none; b=fChaqC7lGcy9Q2sFhMt8JEFxefuCsw85b9aqk5V/6g8WFL9SNX4lijaTY91Awz946NZ+cL5uKikuYCkPlhDT5N+W/RSfPvmcGcvEWipOtsmfw7gaVoXaa5t5hGC48o+mxYs2wWcLfD402yBkA6NW3/77mNzw7zGcJ+/Ycwr5nyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897533; c=relaxed/simple;
	bh=t2DzBV5qCeWG8x4yE7qVxeg2cZ6qIeToyE6MNg6E8MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YVwLQjD/hnQY8J14zFLMVmKDImTFDkTlC8doT6WRr4SaXDBWbmsn+but1rEIVgn/aACzY1IhloPFj9oDlDTRgFwQ1zxYE8Ijwe38GogHBaWhX9Zc9nHRQkxn5wdiyzZnVvSKSoQ+R6G7NGj+uLkGMIx8hoGjAGXDVLhHIifwHMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ty4HiOlg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ty4HiOlg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1ABC1F000FF;
	Tue, 13 Oct 2026 13:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897532;
	bh=0O/DKwOCZ39vSgMW4Jthk69Pl6CLLQvj8NV92aSGb5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ty4HiOlgYu9HWZanySsFAsw+5/XneUeflTgHvh/kTZzhQ59JWwl5b+hmkpU25Ttcm
	 boLLQSGgZ1YCP5PXVWozupKlYF9AP/gGfTV7zCn3O05l5IDzuoCaPMvtd9wrQzJ19Q
	 412tl6Gew1eqjF3Czhasaw3SPL2tzLB4m51edNsV4r/WODOv3NOyD3sTaYF0PNK10v
	 mGsEnj99RHzG+sFKFhDCv2Nd+kY1wOC3nbp4jFc0L4lqqw62VLU2Qvyhg9dTjHHmvt
	 xhTl14EJixqyB0WOKHujG0+lhwqJOULCv/XZa6skGFdSVQBY9OaqOAxOwB65IuFD4A
	 n74RuqNbiFztA==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 11/53] MIPS: SGI-IP27: fold the dead SN1 arm out of klconfig.h
Date: Tue, 13 Oct 2026 15:16:31 +0200
Message-ID: <ef9cb5852e98daafb7f71b034435c5d0f829cb53.1791890466.git.kaloz@kernel.org>
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

klconfig.h's CONFIG_SGI_IP35 branch is unreachable: that symbol is
never selected, and the branch names headers that do not exist in
this tree. Fold its shared includes into the CONFIG_SGI_IP27 branch
and drop the unreachable rest.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/sn/klconfig.h | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/mips/include/asm/sn/klconfig.h b/arch/mips/include/asm/sn/klconfig.h
index 3d1670b3e052..433d2d05aba3 100644
--- a/arch/mips/include/asm/sn/klconfig.h
+++ b/arch/mips/include/asm/sn/klconfig.h
@@ -40,26 +40,11 @@
 //#include <sys/graph.h>
 //#include <sys/xtalk/xbow.h>
 
-#elif defined(CONFIG_SGI_IP35)
-
-#include <asm/sn/sn1/addrs.h>
-#include <sys/sn/router.h>
-#include <sys/graph.h>
-#include <asm/xtalk/xbow.h>
-
-#endif /* !CONFIG_SGI_IP27 && !CONFIG_SGI_IP35 */
-
-#if defined(CONFIG_SGI_IP27) || defined(CONFIG_SGI_IP35)
 #include <asm/sn/agent.h>
 #include <asm/fw/arc/types.h>
 #include <asm/fw/arc/hinv.h>
-#if defined(CONFIG_SGI_IP35)
-// The hack file has to be before vector and after sn0_fru....
-#include <asm/hack.h>
-#include <asm/sn/vector.h>
-#include <asm/xtalk/xtalk.h>
-#endif /* CONFIG_SGI_IP35 */
-#endif /* CONFIG_SGI_IP27 || CONFIG_SGI_IP35 */
+
+#endif /* CONFIG_SGI_IP27 */
 
 typedef u64  nic_t;
 
-- 
2.47.3


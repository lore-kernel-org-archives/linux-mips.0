Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBFD3ED3C3;
	Thu, 20 Aug 2026 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787230166; cv=none; b=rlcibJ+/ZMXzCekPcccpDT3uEukBpYRzH2Vw8VILQUCuwq3vMJqK50DX4rkFMJZ3x8zbjd1Wp0PMl4uTan+Ozd2zn2Q8aKPoGMBvhSNLYwZbkH0ikWzuDqp/5aUHoRFM/Q5VDZnDzBtwDIzNDwAHzed0rcuX1NDGiU4Z5vbl2hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787230166; c=relaxed/simple;
	bh=+4V8TDtKSaVp5wezAD44TV9BZmFTQ57b8DdD1R/YCqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QuGHTkfwVqA0Y8423MZ8C+qBPrfAq35lr9uft0MZ5touyZ7y0KmMUANEk5/wgJbb1B40l8rZnTvBE3sIymrpoY9NbaDRmIGzFIgGfRanPcJsQFfQPnPe9v6CnLvFhX2fScB5Y6V1Z0JT6pZutF61pxp+w7py0oXPvaymYxBg46c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=PANzo4Lt; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=N5qKQHdv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="PANzo4Lt";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="N5qKQHdv"
Received: from kunlun.suse.cz (unknown [IPv6:2a07:de40:b306:2000::2])
	by smtp-out1.suse.de (Postfix) with ESMTP id 5BC968508B;
	Thu, 20 Aug 2026 12:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1787230158; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DLdg1B2FcKw0zrAXFuKK98ecyrUqZSM8FhTFRvrMHoo=;
	b=PANzo4LtOqBrDret1iQQiDiSdCDlAb4bOufdKECLrXrxPg12z9bx5HZ4VwsonLcHuXG5dl
	fU5f6oxvrLQbMVPawVKnSNweKv9LTRPGmS75wLZxHwGsaj/sI84jD/KGWt67do3dkVZGXE
	XsNwWn26UbxiV/RgltPrL4d7VtKjhgo=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=N5qKQHdv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1787230154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DLdg1B2FcKw0zrAXFuKK98ecyrUqZSM8FhTFRvrMHoo=;
	b=N5qKQHdvgy8Xj7IOfan7rigt6syaheizS/3urFqGhR8lLY3RTTF1PgCENnAJvNUrsY/B+e
	F9qtkayJKNN5EVkgx1z5qXuoZemNj4yvgbsYlQDhvLGVw6JGbFysKZZSQZJwjPM9DNhBGX
	KkF0t/PvK+dpEHsBSZdHK76oH6bAnEM=
From: Anthony Iliopoulos <ailiop@suse.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: remove unused setup_profiling_timer function
Date: Thu, 20 Aug 2026 14:49:04 +0200
Message-ID: <20260820124906.144352-1-ailiop@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [16.69 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[1.000];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_SPAM_SHORT(3.00)[0.999];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[kunlun.suse.cz];
	R_MISSING_CHARSET(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[kunlun.suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DIRECT_TO_MX(0.00)[git-send-email 2.55.0];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b306:2000::2:from];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spamd-Bar: ++++++++++++++++
X-Rspamd-Queue-Id: 5BC968508B
X-Rspamd-Action: add header
X-Spam-Flag: YES
X-Spam-Score: 16.69
X-Spam-Level: ****************
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam: Yes

setup_profiling_timer() is not used by any code at this point. Since a
default weak implementation exists, there is no need to keep this
arch-specific definition around. Remove it along with the now-redundant
profile header includes.

Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>
---
 arch/mips/kernel/smp.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 0f28b4a62e72..7f4b395b090d 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -10,7 +10,6 @@
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
-#include <linux/profile.h>
 #include <linux/smp.h>
 #include <linux/spinlock.h>
 #include <linux/threads.h>
@@ -487,14 +486,6 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 }
 #endif
 
-#ifdef CONFIG_PROFILING
-/* Not really SMP stuff ... */
-int setup_profiling_timer(unsigned int multiplier)
-{
-	return 0;
-}
-#endif
-
 static void flush_tlb_all_ipi(void *info)
 {
 	local_flush_tlb_all();
-- 
2.55.0


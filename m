Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022416;
	b=vf9gTKh5IaQHAjxdijxBS4m29Gb1oAtAW5mqU7ptG8RASmNUPMDnZaipjo9VWA/7QlUw
	 ETDpaprhgWEPVwUdi8OAxRoVsLpmEPmaKWUo+ueia6J40mdw4HqnnnCMms4uCMO2GrX3o
	 SahH9dB37ipd3uZcmFCedYtthl1YYUaIkRF6hAC5nudOR3SWvydPMfoXKk2SI1484MWZY
	 aqD0KPwts1NVAY+2gVCNV5cX+maOUmKTY8bEND+tqCLGLqlZQYe5dREHAY5zVUyzGPahN
	 vMeZS8LMOrAdJfqFM5ZvsvsjEzAjBcGsvX5SH0FWuAc+rBazHPWEltfjclB8tq5irrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022416;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bmwv4gigpUDMy3A8o+L3RtROVo0l7agY1BTDAkgMEEY=;
	b=nx6LaKex5IcFj/Z47De1cRBU9jmi1cIKpqHYpUtw7CztAU4LX2Y6XJFGLtpjiAJcIWeO
	 UdKNq0uKkvW/n563S/kufSdV7XVeu59RNefYvcYB4sk09SXOu1sKwOkahHq0SSw9SF3Jm
	 kzAcU/URXlxQUu0Obw43Bck4qbXYO2KI5usXeIVP7IuUbnvICw60EGXSf0NvmuHGfkvCz
	 +pbTHBNNfTDD1X/CgzRjoGMOx0hHZb26/8IG3sUnJgJcGIjhgHttokRxHVlRSyZJyqmN9
	 FdmNM3HvuAjriFs60C8DboZXreG1C3p9Nob+sEkkHMyjylOoWSiFMAWxtBEE9Ez8Syg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fpTYI5fU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6DD606A331;
	Mon, 26 Oct 2026 13:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fpTYI5fU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28801F01828;
	Mon, 26 Oct 2026 13:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793022415;
	bh=bmwv4gigpUDMy3A8o+L3RtROVo0l7agY1BTDAkgMEEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fpTYI5fUOxcG3qLGrT9NaJrGTo4p0A/4zQdzG3WwvCOVpK6N/BYXNR7A4ehtt+Ygi
	 1senAsUBe0gvf3ryOg8hBxd7S/ydVrbWikRj2ugfTDNIKwS4JYpI8uxf2YcF1Yhkc3
	 0NVnUc65OW4teWxmC63QLmn9G/CcNpb6qXAB87R9sCbzz4VBXmZ3sT9t5ArtXEYm0T
	 eRvI5ZWXaVvBsIOOcTrevOo+wJyKJT5hYf5awxAOkyN+yATkZbQw22x+H1/fDJmy8P
	 k+UBrhz4rjavRV7B6rxwcg7gaM9TjYR/7maP4smGAZdVlysv6b8PGKJ1/LP0zD167/
	 7Sv8YQIta6l0Q==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] MIPS: lib/uncached: fix run_uncached()'s stack switch
Date: Mon, 26 Oct 2026 14:45:39 +0100
Message-ID: <20261026134543.27207-2-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026134543.27207-1-kaloz@kernel.org>
References: <20261026134543.27207-1-kaloz@kernel.org>
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

run_uncached() derives the uncached stack pointer for FUNC from $sp and
then spills $16 and $31 into a frame of its own. The compiler may read
$sp before the prologue that allocates that frame, in which case FUNC's
stack starts at the caller's sp and its frame overlaps the saved
registers.

Move the uncached stack pointer down by the two spilled registers.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/lib/uncached.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/lib/uncached.c b/arch/mips/lib/uncached.c
index f80a67c092b6..acfc489698f0 100644
--- a/arch/mips/lib/uncached.c
+++ b/arch/mips/lib/uncached.c
@@ -56,6 +56,13 @@ unsigned long run_uncached(void *func)
 		BUG();
 		usp = sp;
 	}
+
+	/*
+	 * "sp" may have been read before the prologue allocated the slots
+	 * for $16 and $31 spilled below; keep FUNC's stack clear of them.
+	 */
+	usp -= 2 * sizeof(long);
+
 	if (lfunc >= (long)CKSEG0 && lfunc < (long)CKSEG2)
 		ufunc = CKSEG1ADDR(lfunc);
 #ifdef CONFIG_64BIT
-- 
2.47.3


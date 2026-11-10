Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794329630;
	b=beMMBg/zGSXF2VJDhsXjKAIitbnhzgwM/so9R1RLXTsnTJcvFnqnSK28+vFD9baICA7L
	 YjSQQcVs/aoBTWzfaJxiaDKMBHiE/ZcaZyMSGBVFs9LmaIuZlaxcagV7mO5I0Yg9TMFnF
	 BZbxcEP8DRzAyp+jVsf3vgy87R8QWeaEOxMxiADxhxRRYbJG7oTp0bSNhZJ2P/ut6QakL
	 fZxJnAIujAzZHUbw7b33qTqMNaFzB8LN0Ekb8fTko4qn1+sx3rcpqVV8L/RwpDsCLg+o9
	 XS/l33vNecElszac5dUsVa22cBJsvBClMcMaVNGX0dpJG7u2AustpVd+HuxzgGzSs0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329630;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+xqDpbGUYXC4TyhDNVi9zLIdQnEHzlDVGpM9HtdKOlQ=;
	b=UMPP4sm8/+8plSkUtWStRE6xPuCRoT2GmVgAEPe/Y7nx34NkR0x/At0Qpl6+IKNremSO
	 4xz8LqBXpgxTLzEymK5ZP2fLJiuxlAiWQ+cYJvq0eCDtw85WhEpQ84XtGKn2OE+i60csn
	 UVQX+9zkKk4jaszN1eTXwfnJfwlLGk3ohb2OcW51tkiWPASBOz60Lu39KE5u99Qk+87Be
	 rmd0CidGw48m3nsg/t4IRYN5c/euiMcINxY7hX/j1M0hoPSUg6Pr3bqjk23i4zRm1f2DF
	 +Fngxp/or7KSbxTrYS45+O+p6cW4MqM5Il9y3cGGQcxQzhOcUiH3eA/C0zqmFh71EIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DlM1K/3i";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69A0606D22D;
	Tue, 10 Nov 2026 16:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DlM1K/3i
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794329629;
	b=NpQVMrU/KEIkBFGhk/ngb6Gx7EbENDRPUG0PqmDt39AvbNCZmqHvbsZoldafIGFpznqS
	 8AKrXbNJWQcAtIRLX11PqN96GffKr7nhDRi2rBmznXlXM/ht5wn/TKWm2MVnnKvDh4ADZ
	 K3YOOXsuecrmzq+msVhwN+pVot5eAP3rN5ia63KqfvhHHzjW+RderKk16NM0fCBLww3JO
	 bYp5ILhLCt4Aj6R7bYcWNlgMNyNo/DhyAYnCRXcj/ruQI2kCUXJbXnzap9DNJC1sPiMNg
	 JH7ML3jhCjdH71kIgK9zM+IeB65liHFyjJNDpiCb3I601clpSkX/mYZ5dN8b7ss0srA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794329629;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=+xqDpbGUYXC4TyhDNVi9zLIdQnEHzlDVGpM9HtdKOlQ=;
	b=p0jjw3kOX34OTlapZReQo5y0lg166kP/ZPZD4bKHvspqEiLCAf1TibzDQ/uMjPBaKEK/
	 +wUZ7bZu7euAmo1sF9QPwpCa/MOqLhSBRPK0iAJBLQH2kOY2Me25BmU4f0V0CcFpnLg1d
	 C9mTH/Ftfjw4XEtYInoEFP5bYwA4g6e3+saZcFWx4BmpRRMhmsz+J7BtnfzCMuN+X5VYJ
	 HsRzrprh2jroth/MM9iIEfyPrdfclM9nbnSyUaoHpHN73E9IZ5/fjPBkc7PcsOceBiNSs
	 OEqhzWzL6E1qHgRSQD+UMpg8lVvanyi7mv0/4yr+LjUFuYnqp1Icd3aj8vf9gSvAPow==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9A181F008A5;
	Tue, 10 Nov 2026 16:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794329629;
	bh=+xqDpbGUYXC4TyhDNVi9zLIdQnEHzlDVGpM9HtdKOlQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=DlM1K/3iA80euenAv3CAFmiGmB6+rUYRElgDYVs5PMtqzbdYMCBOHpED5AwXGqKG/
	 pTvb4x+UZbthTciBM/p8Csu5VoILrLVMzj9Iz00ycc0IHzIRKz3MFi7+8US/QnCdg0
	 fx4PpOEbXl2Ch2FN1RQc8sRrEFIT5Bq5wqnza1Vk7OIgJBIPTVokUFgKekp4HYD/ev
	 2ZWp56Ym7ZtVV0yGzTR4VdP4aQXVDuVlJlA376vLKF/nhyHo/+jj5fTR4hOjshpcxg
	 hpOLqAFGbsSJEZS2w07/DKN+9fV6Vy47edUwuLwicjitEEAtNQyLFaVeWWdCqX+NG6
	 BBdKg0ILQRqsQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5720848BE6;
	Tue, 10 Nov 2026 16:53:48 +0000 (UTC)
From: Hunter Laux via B4 Relay <devnull+hunterlaux.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 09:53:47 -0700
Subject: [PATCH] MIPS: kexec: Fix kexec on 32-bit non-EVA systems with
 HIGHMEM
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
Message-Id: <20261110-mips-kexec-highmem-v1-1-a42c73f840f1@gmail.com>
X-B4-Tracking: v=1; b=H4sIABpM82oC/x3MQQqAIBBA0avErBtQqYSuEi1MRx3CCoUIwrsnL
 d/i/xcKZaYCc/dCppsLn0eD7Duw0RyBkF0zKKEmKaXAxFfBnR6yGDnERAkHO+jNuVEb4aGFVyb
 Pzz9d1lo/bWp78WQAAAA=
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hunter Laux <hunterlaux@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794329629; l=2359;
 i=hunterlaux@gmail.com; s=20261109; h=from:subject:message-id;
 bh=8a0ywquQKIDmQQiIIGS2OKCO8sdfm5iRqpZglhcUqIY=;
 b=tE2Kb3U5AuklJRYLNk9v2s7W2tML2nBVds4XA7Xi1+S+zVsABdw+a38/d/vn+kF/KRJTcOHFE
 79NhsMf1VYLDZNKRAoseGyUmmtTETVKNyVjrDECZ70j7fdp0bqnL8b4
X-Developer-Key: i=hunterlaux@gmail.com; a=ed25519;
 pk=Z5VTsE4CAwditt0CNeG+rpPk7xDUVh+oHWDZlNNm8FI=
X-Endpoint-Received: by B4 Relay for hunterlaux@gmail.com/20261109 with
 auth_id=1476
X-Original-From: Hunter Laux <hunterlaux@gmail.com>
Reply-To: hunterlaux@gmail.com
Content-Transfer-Encoding: 7bit

From: Hunter Laux <hunterlaux@gmail.com>

Commit a6da4d6fdf8b ("MIPS: kexec: Relax memory restriction") lifted
the 512 MiB limit on the pages kexec copies the new image from and to.
relocate_kernel.S reaches those pages through phys_to_virt(), which
only covers lowmem. On a 32-bit kernel with HIGHMEM, the source pages
are allocated with GFP_HIGHUSER, and one in highmem becomes an address
that isn't that page: physical 0x30060000 becomes 0xb0060000, the
uncached alias of 0x10060000. The new image is copied from there and
the jump to it fails with a Reserved Instruction exception.

Limit the source and destination pages to HIGHMEM_START - 1: the old
512 MiB on most 32-bit platforms, and no limit on 64-bit kernels, where
HIGHMEM_START is beyond any memory.

Platforms with more than 512 MiB of lowmem, such as 32-bit EVA
systems, raise HIGHMEM_START and keep the larger limit.

kimage_alloc_page() keeps the highmem pages it rejects until the image
is unloaded or executed, so loading an image on a HIGHMEM system now
holds most of the free highmem in the meantime. kexec -p is not
affected.

Fixes: a6da4d6fdf8b ("MIPS: kexec: Relax memory restriction")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Hunter Laux <hunterlaux@gmail.com>
---
 arch/mips/include/asm/kexec.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/kexec.h b/arch/mips/include/asm/kexec.h
index 69e579e41e..5f57bbc8c3 100644
--- a/arch/mips/include/asm/kexec.h
+++ b/arch/mips/include/asm/kexec.h
@@ -7,12 +7,13 @@
 #ifndef _MIPS_KEXEC
 # define _MIPS_KEXEC
 
+#include <asm/page.h>
 #include <asm/stacktrace.h>
 
 /* Maximum physical address we can use pages from */
-#define KEXEC_SOURCE_MEMORY_LIMIT (-1UL)
-/* Maximum address we can reach in physical address mode */
-#define KEXEC_DESTINATION_MEMORY_LIMIT (-1UL)
+#define KEXEC_SOURCE_MEMORY_LIMIT (HIGHMEM_START - 1)
+/* Maximum physical address we can copy the image to */
+#define KEXEC_DESTINATION_MEMORY_LIMIT (HIGHMEM_START - 1)
  /* Maximum address we can use for the control code buffer */
 #define KEXEC_CONTROL_MEMORY_LIMIT (-1UL)
 /* Reserve 3*4096 bytes for board-specific info */

---
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20261110-mips-kexec-highmem-4c47bdd57a0f

Best regards,
-- 
Hunter Laux <hunterlaux@gmail.com>



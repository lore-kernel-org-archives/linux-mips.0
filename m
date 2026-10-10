Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AE63905F9
	for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 06:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615287; cv=none; b=hpCk1ze+PN8UJ/v5UP1KN2Z71kw0232q5bbgQK9UsilUi0x2C8gOixQBLagLdDHfOpPb3hIVIcmnBi9GnV5ugyhGhNNaMx6a7yxgNzdujlB7YwwBS7dNdHDICHXOwnLq4vKubcfP1AiDesenVvyx9SrSg7V3T4xMeW0y0c73KB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615287; c=relaxed/simple;
	bh=sfjXwrCLUFpqa0F5rhC8QwgJp7yKmgMaW7v/NSN0evc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q0nniTy+/DB3u7IocgqeHLIy3aphL58tuMhAQX5V0a+1N3M+xJ2QLOueS2+WNSJCBRnITglOZbKc3VmJ4CBEGTa8LME28ZFLtjozdj1BhibFz9xvEAyVhXy75GmqITJQrmF5qhkcOzkctxBcIPYGeUkmjb7DgvAnGsXdDF/WS3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxx2zuCX; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxx2zuCX"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab9268d90eso72874a91.3
        for <linux-mips@vger.kernel.org>; Fri, 09 Oct 2026 23:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791615285; x=1792220085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSyfVGop6O0UsffgvjiWEIMMvzYiB5cagcZXil/wW1o=;
        b=kxx2zuCXTcq+X8Fvz0pp3N7mtEuRv0zHM+tKlnc4U+FXbPxOcOeX+ka5y3gzKVDANl
         Uo2ZSciVpaLYlfVJSE99g8BJ1zUxWav5N0Uqouopy6E9vuzjVMeAMPTveJWmPjPaal8J
         zcObmdwajA4ND/MuqdkKH2cUpTd8lexKRr6+eYI4riGMDJAcR1jdEiU1N/zW+hpuENDt
         D965jBixK27vIV8SYm7zb5+T+LRKZ7OJ1GShehUVen1bcM2nziXn5nc3MRdRAzfibC3o
         o+RRDLvkF4qwecIz/7MCZeZK7m+AWnQ8Ag8pdJO1ejgEiny3YCyawfeeXgN+4N/D5azK
         1eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791615285; x=1792220085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSyfVGop6O0UsffgvjiWEIMMvzYiB5cagcZXil/wW1o=;
        b=H8cazAPdaOFof63+l3y/pO+cJIMIpCIt97bUfp7wr5YzB7zZwhI4yanvn18kUYhv7V
         cyibOcpo5YwhnObrR8IUbjCKJ+wJOgPP40iRxHASC0dUzZtkU09c5xxtITJkOyIUnyJb
         ozhs8M+wU5vsxf1WSWXLs1FMwevS/4xSvecCifxSmqRhMOYT798J/1en8I5mEKMY53CH
         iSLYPn2Ho2qKq31T/C9Et+iagz0FBAjjCQOiIMTFbJVMJE8UxeJQi8Kuw1HsPsHHuT6y
         OGbYIW2a5sVDdnqX46c9Dl1fw4mxVmHGseAtd+TsH11NywDrP7bX9PIkmOI280ClTUCu
         KIzw==
X-Gm-Message-State: AFq9FYJG18Ep6/EFQDd3akzfyjyFBGKaa7YyhpUeYbBagYx84NwFrnEJ
	XfHf+i7l/eCLG7A/fdylhpKAGN+eDRE4rlkrY9K2W/FHlsCemFR0DjaQIB30YT8Z
X-Gm-Gg: AYBFou3lvkomRMgCv0fOA0oEqzXkb0NtEoqkUWOWZpZWSFNs6e5gZIIvuLafDcFKcjt
	sxIqaVLxsoBHT7RRDDNKHJjFdQLaPzDleapbRCG+aXs4aLKyKqDBFrZ7kwM+J8TPd4XhXLjJUyb
	CYFmJyPFuA0EMo/q/Ws60oyuTYSatsGgmVJHH0/JBMHREn/4JZZOYM0E9r6clIn/7O3X8nCqfNu
	tHWpS1ZX8Morg1jfrOKfXZAydPxYJc2EpG1knLqQCrRAwrAalkboieuR1iL3F9dLSe70XkP0S7t
	i6LoyGg0NqlZcxPAIiilcGGPBKGCSX+D6DiT+//tnuFYjsnsIiZREQm1o0Uhl5o32mI4cm3myGz
	T0qILrOrvaBLs3kQXv4IhFeOrGFglepaHIFQbULr5/jXNQ6Wsbbb90BBjrgJXY1hn/+p7br797D
	+8TjuItn5oqVEYElq6womWW1Lb3GvBiRf+Cg9i3NC/XZmse+WBo3xdU9CYJsOSSS2N9DkoclXUb
	jH8LEPBATC6BWkOeEsbm7ZW9wS9rFX9WcwNRga+D6QvbW31AFaSGLJti8gq9i6h/OaVTJM6NBhn
	3WY4fd8lvGZ5iWawsAQK6Ru7nE2scup85N6u/F/bUBZH9KlE
X-Received: by 2002:a17:90b:3c8c:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3ab3a99b4d0mr3172803a91.21.1791615285209;
        Fri, 09 Oct 2026 23:54:45 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b981b9sm6801595a91.5.2026.10.09.23.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 23:54:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: lib: prefetch ahead in csum_partial()
Date: Fri,  9 Oct 2026 23:54:42 -0700
Message-ID: <20261010065442.23780-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

csum_partial() reads every byte of the buffer once. Cores like the 74K
have no hardware prefetcher, so every cache line is a demand miss, and
after a non-coherent DMA the received data is never in the cache. With
GRO enabled, validating the checksum of forwarded TCP traffic made
csum_partial() the top entry in the profile on a BCM4716 (74Kc at
480 MHz, no L2, ~80 cycles per DRAM miss): 13-16% of all cycles.

Prefetch the 128 byte block two iterations ahead in the main loop.
Unlike memcpy(), which disables prefetching on DMA_NONCOHERENT
entirely, only prefetch blocks that lie inside the buffer: the 74K does
not need a post-DMA invalidate, so a line prefetched past the end could
belong to a buffer the device is still writing, and the CPU would later
read the stale copy.

On an Asus RT-N16 (BCM4716, bgmac, single TCP stream unless noted,
iperf3 median of 3, A/B in the same boot by toggling the prefetch,
two rounds each):

                       without      with      (Mbit/s)
  local rx / tx        220 / 194    243 / 212
  routed up / down     169 / 140    187 / 154
  routed, 4 streams    65 / 79      69 / 84
  flow offload bidir   253          292

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/lib/csum_partial.S | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/mips/lib/csum_partial.S b/arch/mips/lib/csum_partial.S
index 3d2ff4118d79..f0ec47259ef4 100644
--- a/arch/mips/lib/csum_partial.S
+++ b/arch/mips/lib/csum_partial.S
@@ -190,6 +190,21 @@ EXPORT_SYMBOL(csum_partial)
 	 andi	t2, a1, 0x40
 
 .Lmove_128bytes:
+#ifdef CONFIG_CPU_HAS_PREFETCH
+	/*
+	 * Fetch the block two iterations ahead, but only while it lies
+	 * inside the buffer: on non-coherent systems a line prefetched
+	 * past the end could belong to a buffer the device still owns.
+	 */
+	sltiu	t5, t8, 3
+	bnez	t5, 2f
+	 nop
+	pref	0, 0x100(src)
+	pref	0, 0x120(src)
+	pref	0, 0x140(src)
+	pref	0, 0x160(src)
+2:
+#endif
 	CSUM_BIGCHUNK(src, 0x00, sum, t0, t1, t3, t4)
 	CSUM_BIGCHUNK(src, 0x20, sum, t0, t1, t3, t4)
 	CSUM_BIGCHUNK(src, 0x40, sum, t0, t1, t3, t4)
-- 
2.56.0


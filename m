Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CFC3E2AA1
	for <linux-mips@vger.kernel.org>; Mon, 19 Oct 2026 03:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792381762; cv=none; b=XH/8XfEwVHoGME1Kn2Ul85Fwy90Rii1dheW8YYFvxAweooV8hK7r41jV2aRps5Kl96S+pEXeCdyRP0HT3QiXNXaPdAwnqIViaU3Gnn14+Jq/qvSgefYyIFLUaOueYK7AMmr7Btrq9bvGD9UWh5U5jdpnuiN32R0LRrdeGBSMiMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792381762; c=relaxed/simple;
	bh=ABJxKEaQtZ0QjZwBCK3+8g63pPMNurXD9XOETuliAjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EU/raSGliPRB80+MgDgG7BxgIfOuHQOZOM/vaa5b5BVQeGee40Cnc52atUQTjdOhBd+WLc58IxRaQDMWwE+tAO5PgcJZiFGRLWcgIsVK3JfFdxkPqkFS03E12Z4d+Y/trqCzpBoi96+CM0uyr6bH6dWYbzaiteXVmmAXs4gQfvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXNsa9Je; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXNsa9Je"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so13928595e9.1
        for <linux-mips@vger.kernel.org>; Sun, 18 Oct 2026 20:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792381759; x=1792986559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fVEYd5MjejeQV04NBe4mWPXzx4IqO3UlJ5AzV2FYsCg=;
        b=dXNsa9JeW9+l5uAhfkbZeJOInEKkjNA2Zn++6jGanWfmnhM964iQ3kafAj+AI8KLOK
         glhPgQFkFwGyuCh/lU7t99Eafud6uy1Zd2lLb58e/jrJC/UmMVlEbhajheOJWbd+UknQ
         KZ1yM4mtMK6EnR7shioxy5ZRInpmSJgo38Sd71wAWvZLzxyrN56eqy11lPnOpMyB/vJf
         jxcVbWyYg7MUPdxoMKbjnXQzJrHz33AVzE0Z7+k4OsvAHA4Z8DNkUsMX5RjlHRnMzbMe
         sEDbNTlDrhfFqaNsBUnmO4s9eRwXXVx/a9g5dqWq0rOTsXCRn3AbTTWgdk0Ya4Emtpis
         tPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792381759; x=1792986559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVEYd5MjejeQV04NBe4mWPXzx4IqO3UlJ5AzV2FYsCg=;
        b=Q/QEoNkB/uavtX/TuZ49DS8w8SF4xvMiIobQQZZ0e9Z36Q/2lCrwOEMuhXc8RzTaWn
         drpn0CigObubbDpsVQ7t8g8Ug5k1ePiDxjuOmQ2B59WiK2sQBOw0w0Ulr1Mq/XA49pfr
         116cMHXCJ9fCffegB0KFxTpFgng24JULN8dW/8GKqKgwJf9g0AnyD+XNKE9xUzL/tGbJ
         CM2oMcDipFzHLxQAg/SFY2IymzEZ7K/6yMoDsSTA9Wpfcer6UddJkK0eOgGQmsMvO2VZ
         EHmvMeYQCbaiTbbr/arelg7+gy/8KJa/Er1e4H1jYLqw4jGWel5OxAAHqz0srJOb6Iob
         2SOA==
X-Gm-Message-State: AFq9FYLWFYgj7Ig/0a8W3AVADUxla9W4jhxZgcYN/jT66EK6zPxjbnjR
	eif4B26vkpEGvQ+hrsVGgFJGZLjG2HUC1II3YmogOwHJamufqJIYL9olU5C0zQ==
X-Gm-Gg: AYBFou0bbYhe0qnjq/mNh8Hdd/FVceS72TuELLv7YEg/6CIy8+AxAKtfAOmnM6fchBS
	xHFoIi1ilDsqViyjva5ix4aw1TpjyanZgyjPC03punEZBOC2iiuN8k0F91g9KcPf++An2WPxEHt
	tu1iGXJ0hLL+viAnSJvhhmq0Mfa6KuM5y0WWf2QMJHjbwwkBLWw5rU47I77BSZCBmY/TL0DEEou
	JV4cy1FsH9sQDTTvI8/dygoPq4YlOqn2XADQ0pbC0Oxv6fhNoRymqEdySN4syLS4BvrTdHyH2u0
	Plr2WC02q1KN1y7bnxCYLbnb/cy2h8yCdKP5+6yB1dskJsK62RxUgjzVNtR3ZknxsdNTekam+sY
	rId3Dfj+Ka6vG/0IDtS4akxbDoQQsIEvS+0kUB8NoWhL4aKiWtvdhq641U5Pmvw1put17aelWsL
	VJ2Ky++VedYhtyxNBb+VjAEnxXOoUjRmUXwgyLxK9XkXBGvu76+u4OVT2VDz1bu6uqJxnMgx1dv
	lhNbTopyAviyJ3sBlvCs0RcOianbtpjpUcSByIjcEMbIFq+sUPw1ccSDBODESREpPHBCZsdTBCA
	CiQAOmG8xU+i+VTzSA==
X-Received: by 2002:a05:600c:a05:b0:4a1:813f:2a57 with SMTP id 5b1f17b1804b1-4a1d7608058mr139978165e9.13.1792381759297;
        Sun, 18 Oct 2026 20:49:19 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8b5fsm371302795e9.9.2026.10.18.20.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 20:49:18 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: OCTEON: program L2C_CTL on CNF71XX too
Date: Mon, 19 Oct 2026 03:49:18 +0000
Message-ID: <20261019034918.3805764-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit bd978130307c ("MIPS: OCTEON: program L2C_CTL, not L2C_CFG,
on OCTEON II"), cvmx_helper_initialize_packet_io_global() writes L2C_CTL
instead of L2C_CFG, because L2C_CFG does not exist on OCTEON II and
writing it hangs a CN6335. The test is OCTEON_CN6XXX, which leaves the
CNF71XX - also an OCTEON II, as OCTEON_IS_OCTEON2() and the rest of this
file treat it - writing the register that commit says is not there.

Use OCTEON_IS_OCTEON2(). OCTEON III (CN7XXX) still takes the L2C_CFG
path, as before: I have no such part and do not know which register it
wants.

Fixes: bd978130307c ("MIPS: OCTEON: program L2C_CTL, not L2C_CFG, on OCTEON II")
Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
Found by the Sashiko review bot on the original series. By inspection
only: I have no CNF71XX board to test on. The Fixes: hash is the one in
mips-next.

diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper.c b/arch/mips/cavium-octeon/executive/cvmx-helper.c
index 107b1be..c02448b 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper.c
@@ -1028,7 +1028,7 @@ int cvmx_helper_initialize_packet_io_global(void)
 	 * to the cores. This avoids conditions where IO blocks might
 	 * be starved under very high L2 loads.
 	 */
-	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
+	if (OCTEON_IS_OCTEON2()) {
 		union cvmx_l2c_ctl l2c_ctl;
 
 		l2c_ctl.u64 = cvmx_read_csr(CVMX_L2C_CTL);

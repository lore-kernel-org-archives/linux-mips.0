Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794350219;
	b=mlcB5jy5HPSAl0hBRjlCwmTVbDqpPZFmWR5QIdDcJIY5iLRkX1JtylU2FHfbtXatQeHy
	 9Sr5hw3+1Cb4YB0RkGPqkcPwDU2erqDIcZGbHO5yCX/8Z3izVVSK8RNbDIjBJert85ivZ
	 evxqMP8Bst1KthCHCKuOgfxoC1pr4pXX71WHJn2pPqXiSP5c10wNLL+deid2HhzsfIt0b
	 93ll65vH/rZUUhaBjtX+BbQ0uzjblDxJdIWAJYqkJorw+H14VemFislJDrRI6VzMzXBPj
	 N4DlhHb/DC29RfLhV5GFRJxmk7ZS0g1BuFBdlcbUjh23MMc2Ad4WTjssN3AgzFmDX8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794350219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/4es+9r5XF9AYP6NJAJvSrimnD1eLpHb3VSUhrghCnQ=;
	b=OKqIEY7B3ig5oufcU7SSskDeWZo6CUpAdh6vxZSkHZ5d0aPj8La75qSi9J5dt8MdIpfZ
	 EzpP39PFYOfcI+/p2UiQKIseJwnkOyL7HWyQK2z0lN1pfljyAD3cEGw+/xd20MRipupiF
	 WnUzRDkjC5BHQnyN4qmCeVk5ZPjvfE+PdEE4uBlzMgqAVj4YNAwYAH44oN2nS+oY5dAUK
	 8WC+F7xh8ueu+rVUF45N34DODKjrjdRv0hO51bKOX537S/DW83iowVaSwi5c8f4mfuaWN
	 I0mOHIsPcD7/n+oLoXc8RK9QrS2YK33ygObqorxUOPtN4BRVhxQOIqPfD1bVfrVBY9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sDBVko/L";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A1F606A326
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 22:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94A1F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sDBVko/L
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3282db206d3so1933376eec.0
        for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 14:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794350218; x=1794955018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4es+9r5XF9AYP6NJAJvSrimnD1eLpHb3VSUhrghCnQ=;
        b=sDBVko/LfR8ln8Zr8Y38Pxzg51jwK2plYrNXW7n5mbgOGhNWe1kNBDthJyDN93EqGj
         OunJ6aIz4kFCzVzGtn5uVdKcZBSgW7GHowvio1A7eSECbVBT6c9uNOtrMh78yf+LUzpL
         Z1Yby87Ot3lkVAOrZNqy8fzeY3Zdy6fSs7sc8AOh92yVczhVFptoW3AcxMSJfuMk3qYB
         Y6o3UwK7S+4gPRzRQRIsk2p3GzTj6LdT0+BvU++D9qk0Gwps+iSMs6cb1SZicrSzE2e4
         859/9/bKGXfg7FiQs1Fnn5RDlJ77YDkFsgyFNQVzpHVdu8fdL8+sCo3wabIgqcq3I5lt
         QOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794350218; x=1794955018;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/4es+9r5XF9AYP6NJAJvSrimnD1eLpHb3VSUhrghCnQ=;
        b=tcuP5rEnf/mJr0DnkgAuDdErBEas2GCoMkrzqSlq/TCdW1bfYv8UOKJY1YqN9xnXUv
         XlTWY0Bt7KwQ2CRoQqNBDGNEgl1ZCg1R0oE8HMz8W92yupQc1XyyVZbYaxPHkwGE/0Gy
         ZShrzS9TxzVz8okfWO00xrsvmKLMdYB6smMq/Li+8dq3luacSx3efTfUPJRLyye+0aiV
         caOVHsY9FRgRXLpGC35chsaQiaOQAAHBbaV65MclplJp5UbJO7SLqSwMNf2JNivYMyzd
         g+aMZbWHCIvuMEayJrKf9IWAwpqsdfC4cnl9u3bvI2WZu3ppoqcrS94pxtMkWFB7jI5s
         PWWg==
X-Gm-Message-State: APuU4Z976nTxmz1Xusn7iTFvkEy1gy+ujw9ex8F2xmKVw8zyLHL0GYWM
	yqmh3SvOijFVcCfSg8lGVFQe6Io7mJ2//jzYAcAVNYN/vjYg4NC/a1IDMQMlfQ==
X-Gm-Gg: AYBFou0Dn9Jx8AOuIlS/JqkAueHwBek/9AyHq0cfmzy28vAiKOi0cF81VOQ1c1/lQuM
	6RXiTFcJEIxICbXEW7+qpK+gCEGQBz/e4yJ9LVzO6E6lM0B3qrH84F3vGdsX4E1b0FnmvRetTPY
	2zjjaPws/nSLsDn4dEut1r/3f0jmMCunKf075MOJUMropPuhOBxYoI+250LrcxK5WyHHW78CzXL
	MG6UuwMbPL51Zjuxnhr7vjVCi7MGmXaphUULS+D04PDXzqN+UEoLz8LpMiUvUhQ5WFJ/iH05Atp
	Wn5O/9CxYSWI91PBa1ybbOr1OfFV7ea5BsPq6PILNmk07PTkTMEwzmnhtPMWlw/f+M41juKKzkj
	l4+t+xMUoYLfySI9NIFpkthwoE3atwTdM5wDYP4B2RRNFDNrltqxl/qZ0L+2F2y2NSwdQ6VdsYK
	t39dcnrvXdJW04EGHaBka3BOij/AskzaAkOktg93RpRLvtEb1vp0CaL3j/4I6NnXb445ToUobj8
	TKZTNFYYhLrp6mVqKjr2LBDWCfjkcBmn9ogQJhckpdEGziFu8G4ymph6ZODjB47KnM5jSyVgA1T
	xW2qF6hYoTt9VlM5RzIO7zEpqVavGQ==
X-Received: by 2002:a05:7300:560e:b0:376:972f:afa9 with SMTP id 5a478bee46e88-376972fb1dbmr671243eec.9.1794350217569;
        Tue, 10 Nov 2026 14:36:57 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm11488863eec.19.2026.11.10.14.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:36:56 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: macro@orcam.me.uk,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: SiByte: Add missing sb1_cache_error() prototype
Date: Tue, 10 Nov 2026 14:36:49 -0800
Message-ID: <20261110223651.2698860-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Fixes the following warning:

arch/mips/mm/cerr-sb1.c:165:17: warning: no previous prototype for ‘sb1_cache_error’ [-Wmissing-prototypes]
  165 | asmlinkage void sb1_cache_error(void)
      |                 ^~~~~~~~~~~~~~~

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/include/asm/sibyte/sb1250.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/sibyte/sb1250.h b/arch/mips/include/asm/sibyte/sb1250.h
index de4b352256c8..e42b3c9f4b53 100644
--- a/arch/mips/include/asm/sibyte/sb1250.h
+++ b/arch/mips/include/asm/sibyte/sb1250.h
@@ -32,6 +32,8 @@ extern unsigned int soc_type;
 extern unsigned int periph_rev;
 extern unsigned int zbbus_mhz;
 
+void sb1_cache_error(void);
+
 extern void sb1250_mask_irq(int cpu, int irq);
 extern void sb1250_unmask_irq(int cpu, int irq);
 
-- 
2.53.0


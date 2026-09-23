Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681303B0AE7
	for <linux-mips@vger.kernel.org>; Wed, 23 Sep 2026 11:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161864; cv=none; b=nFuNhBZidd46/4rXBrlrfsYyI6j1dvMlNu4su7aBDdXgvH/BVRVd4GOYkvxNL8cA+98Oh/Subs0vkN8akgKpj6YV+zDRHBaUJhYQqJQFqsDpmUb6G3tCdQEIHNIPh/uOvAPLXt5kXl+2nc4Ulro1vrCwAQVPXtX8MWwAn8FoEeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161864; c=relaxed/simple;
	bh=Y1MeJjIUqtIcD45CjDERSrfL5qZNM44AZrKbswPZd44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cAgASxpS3UgKB73AMT7SpMNnWiXstKDDDc4LkUd15CtgMsR5RtaXMkmWkhEDqPD6v/lO5jZnQdkR8/XoiK+Mbd14bdBWHJW7ILXQUvte87m2Qf24qVV1xCBiMISEJofzwkW58cyJ1YDyukYZ4qspey6RbjVdmNIc6NQ68+kJ+Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=none smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b=kQnWQvwV; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b="kQnWQvwV"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so848890e87.0
        for <linux-mips@vger.kernel.org>; Wed, 23 Sep 2026 04:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20251104.gappssmtp.com; s=20251104; t=1790161858; x=1790766658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6F6IrMVbkAxuPsXSBU2GCL4E74W3Y9sNczvVD9Ex120=;
        b=kQnWQvwVasq7adqWT9Slkc7J5ZkUUv3mCOWZ2r4wpRIgh2pxTcG9W4NsX+Sv5cu8iY
         c2gbdKY/4/78qcUAHWsVYKmUAKlPcjBjVQUwRQn3KKT1aXTGqVBod9Ky3tlX0B71WY/P
         UE2Zv0FkFJMS9D71T04+MqQeTktiSgEzlu3Ewme40FIDQpLwb9Lv0BsKSuPqOaCEMV2W
         YcJboTJB1bZzjicaUZNnJ5EX2At5mwC7R1XQQTA6rLKEB8GXneG6wdjz+7US/Jp92AV+
         e+qb/l8purEmF+266z4RkQGyIw4vUZ9DIS0FprE2ZQ7ACi4qvQUCYhFG4t+WvC9sKiiw
         TorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161858; x=1790766658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6F6IrMVbkAxuPsXSBU2GCL4E74W3Y9sNczvVD9Ex120=;
        b=d/6KobhLwZAQnijWDnA+vDQIwIBiutKegfa+OCXUDM95zs9G6LclLTAiOBOGAxxagj
         XPPsC69RVK6D456UKXWJsRsYdlw6CMiPVtNHCpEdWw1+R/o3greBVuNcD/TUUV013/ex
         8KycXiMOB+uKGWT4ZyLOwRlRa0Eis8F5sGXuzz0Qq/aRrW/jX0gYZ0ZDYHmY6ZxgY0rj
         k3r3v0o2vp9c2OPHkwQxqU7ivJVAwfzCgRiUT3gQP9g8Fv6tN/L7Dgkudoubg3E2L22s
         AivGDSo00aiJiK3Y7AmdjiDSWTBjnq4tHPIVjSw8OQBEoBZOIzBRV7ukZ5ni69neDX5w
         XubQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGwgMdZX1JOGdDc/wRPB5MEHrv3exu65+IIOrGAUZeJuIFLhO/kXwO0uU7wx+yrihVp3vlsDSBmlYs@vger.kernel.org
X-Gm-Message-State: AFuF++nlwpfVZ38Vu3whAtU9+FeDwDqqTRSZ34Ay13GobNiMbUU+DENj
	gGIlRe3H9M6bktOyF0f4/lfo9prP0ZBfH11NYDCV3SnPK/vQbx9GuVJpVlZdK2hihT0=
X-Gm-Gg: AYBFou2shMPi+QJvQEf+89CAw/4/WiVFka3hAMWQGr+WsquJzhBcWY8DrNJWFM7g1pU
	7a3xlzz19o5X/NnUixM/UxDGECArckSfdG1vPfjDAuukOEPiVOELo2CT9WBhRTw1KBSrQ+OrcDx
	09V6JHDQRd2Tag9LWxdgvibD1qajGr/oIqKem6MDBnRHaKahX8QIoVJvKR686SdOFr6V4RvDSxj
	xD2SpgHY1ESyXqizFBkSoaxn4Y/ccGbQcbCYlHaZVGQf38oA4dX3DHN0egljaRszkASSt33tgES
	xPORU0QbGzuvHp6y+6A5hw6yZp4/rdpYvku+aKTNJ5NC3M5flp4OeziUOjRlSktvSCazlqVhyDG
	L7T7psC6zieDZQZkw0nmdy1Bz2C4vV3C6wEbSFGVy5iTn+Kl6E3ZyQnTqDcGnITMElXwaTfLUJQ
	h1phNzBkn4dJZMu9WXQ7biVPmIjxBwcZvrkTysUrTGsaRc1cot+YdFJlVcCMi4gAP/P4FqxELui
	VHWiTovixSVX/I82E+SV8cNOKPMhjOchZ039X/t8qw=
X-Received: by 2002:a05:6512:3f26:b0:5b6:4ae:5b83 with SMTP id 2adb3069b0e04-5b8d89b6f07mr733196e87.33.1790161858572;
        Wed, 23 Sep 2026 04:10:58 -0700 (PDT)
Received: from nuc.. (78-69-188-101-no600.tbcn.telia.com. [78.69.188.101])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8589783sm507873e87.51.2026.09.23.04.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:10:58 -0700 (PDT)
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
To: tsbogend@alpha.franken.de,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	paulburton@kernel.org,
	main.kalliope@gmail.com
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	philmd@oss.qualcomm.com,
	Johan Almbladh <johan.almbladh@anyfinetworks.com>
Subject: [PATCH bpf 2/2] bpf, mips: Fix BSWAP 32 and 16 on MIPS64
Date: Wed, 23 Sep 2026 12:51:58 +0200
Message-ID: <20260923105158.3514342-2-johan.almbladh@anyfinetworks.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923105158.3514342-1-johan.almbladh@anyfinetworks.com>
References: <20260923105158.3514342-1-johan.almbladh@anyfinetworks.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 16/32-bit byteswap implementations for MIPS64r1 and earlier do
not have an explicit zero extension afterwards. The input is first
sign-extended to 64 bits, and the byteswap sequence can then leave
the result sign-extended depending on the value of the low bits.

Add the missing zero-extension.

Found with test_bpf on MIPS64r1 emulated by QEMU.

Fixes: fbc802de6b10 ("mips, bpf: Add new eBPF JIT for 64-bit MIPS")
Signed-off-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
---
 arch/mips/net/bpf_jit_comp64.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/net/bpf_jit_comp64.c b/arch/mips/net/bpf_jit_comp64.c
index fa7e9aa37f49..6681ccac9dd9 100644
--- a/arch/mips/net/bpf_jit_comp64.c
+++ b/arch/mips/net/bpf_jit_comp64.c
@@ -305,8 +305,7 @@ static void emit_bswap_r64(struct jit_context *ctx, u8 dst, u32 width)
 	case 16:
 		emit_sext(ctx, dst, dst);
 		emit_bswap_r(ctx, dst, width);
-		if (cpu_has_mips64r2 || cpu_has_mips64r6)
-			emit_zext(ctx, dst);
+		emit_zext(ctx, dst);
 		break;
 	}
 	clobber_reg(ctx, dst);
-- 
2.43.0


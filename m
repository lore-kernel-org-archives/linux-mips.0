Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934985;
	b=z49ec6iUV1GQ01UHNv5x59rw+EYD037gPXu+UDQtn5zzRxwBsG/YnQCHb6oEDGZX59bS
	 eXv+tKGYXdxB2opPPtUjwx4CSdaTYbGOvPPXJL5sUci5bjRjrgMRkevZSGdSOdfu3ygRb
	 j7m6DZv4BrqVWsdxSesXQVvbbHX28a91B6oR6ncCL/9Cmoe9GDMDQ0MLoyHJWp96HN0Q/
	 VRmFknGulvRnUp8SIR/FDiLodoxFJAs2asI+6ZfUY8TS57QwzRMO5Ipmjz5BWMIQHbamT
	 EwNt2NUvPJydWtWY4Bkjj6RgFD+RyBPP5tWpHQwhcdYCQk707ZxzvzVZoW772XnTNHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cXKJvLQbWViEWohJKASkSdg80qUy3PIEchKzzU/+Zoc=;
	b=OdsKzLMMH88Y+WNFGX+zqvM6aFU2mQSqo7qv3NCa7T5wdJ0GD06xxpaozsBKQMWmhjGu
	 EGeHfoN07/nnaTBmXZ5kZ6+9H1AXziC3ZilLe0NXKS+7sKid9ealIcuRskSetklNihDQx
	 kRoogfwJhmM4xom7Ia6LRfUd5XLohZhybOnGBECaVhQtWfaBjvHMzkDHFFN5FxyJ2/Q7p
	 Okmrg6Zg7+DhjLdQioGa0NSDyun0KhOqlLJCc/zfVOBK9t1B+gizS0OwKKGCmntg0d1ND
	 HxZUjt85KPg8hNvzh0NkwlllwNu8JwtaOYYFB7ktiMu+dfmT8s4itxtSUncIJBgmlBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WvnU9wiD;
	arc=none smtp.remote-ip=74.125.225.65
Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BEC606A88B
	for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 17:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85BEC606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WvnU9wiD
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-48e345608cfso1071353f8f.0
        for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 09:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794934984; x=1795539784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cXKJvLQbWViEWohJKASkSdg80qUy3PIEchKzzU/+Zoc=;
        b=WvnU9wiDkdjWE4pNa4YnS7DMwPrKzqAEkzJ+N3Rqoji9xFli16/u9ibT5EThhG5UtM
         dM7/fS9CY9/QU6uyjbejNeAlcTZ4+IKWg83dfxwhpEZYMGLkWILqDhoeZAntH1ELw6Ac
         3mUqTO0159tp/eq5kOIcp90+EQhEiiXPVk9wYUlRKsFsJdYAP2jmWNy7Ntd+8c5n0vJ8
         wAY3rgtzJxg7uQ7TyoNlnqXTgsEBkws9O3gnu48kurTg90mY1kVRGNopzboSO2f/EZ33
         Bz2/6QdXLGKc1/b1S9B376f4iNq+0/zkVRtx56/t4vbeAvVadWSi0sphdF4yUnfrZ00/
         /5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794934984; x=1795539784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cXKJvLQbWViEWohJKASkSdg80qUy3PIEchKzzU/+Zoc=;
        b=Kwf+4co+PcUf0zIj7nCmE3uxnSaXg9aLidNVbgKETOBOdggfSf0MUA4VmML/Uk3Wnb
         PXWSWNcVYtEKhgFOywULiGB/GsHwjq9ZFXblP1oXqZeQL5aNYqQ4MP9kF5otZgYCj3pE
         0YEOd7ksWnzeoos5K4DpbhTQuPde3QDh8Zs360qMlU2mR030oSy/e/aEo7Kem2Eq4p1e
         5UHEeldhlWfbw8gqv8lFShfSwXz1x0NgHt9K7rHotjo7mEtZDR3OiEnMxdgVv3jBcusF
         /bNivqV7GKJGfC7bZ6g2fBnkEqTLIvdPUZHva2QJwzxDkoyQOL8KuqJRB3cUOsLrBVrT
         +fWQ==
X-Forwarded-Encrypted: i=1; AL+hErFZDyWAMtRAsAVIQOTFhwqML891Qv9FstA2jZKGmKB/Ul2VB1QFY8naF1fq0EWLG54uuFkppKztuzkF@vger.kernel.org
X-Gm-Message-State: APuU4Z/QqQoIWFi63Ccsm/PNDVa12eNaVENDyI2wgz6P8fRuYP4lFeSS
	lrBztpqeJ/yJpXmyg2XPkqr/KRV7wk4ZVl3aMPiW6stwSmA0bR4pMDWK5ebmomMC
X-Gm-Gg: AZFdTZcfkPJTjCxKkWkF16ac52uAyLDrRevoYZH0HTjEIuqg8C2EJrwzxwYisj1D7xS
	oVGxlSbpC3phygB+4gCKfhNin7dJ66CbLSCyde6SmJfLwfrMOTvvfyOaRimLMWADG7UJpTI3Xx7
	HJkDkl1nPM+XWWicFUEOsTrf8wJBmuit6oorSr6KtUb3afYGhanihMdtSPU+gNfOitCtsHzx6tm
	PM1Q1iu+kiOHsPQhUC20T9xukVyNX9Ke19cUWcUX7Mxtvmkgo/oVliN0Iw0+P7anfnv5Rk5qjEg
	zHLzOtYPoQI23JfZ4yTw/cGLsMBuSi9S9X1iw5jfcJcPg22pNciN4Mu1QnaQlY0kabAbaIpPqkg
	sfOoMHT3l3OSfQQqN2soen+46GAhOljaZ+sVXd5qdb09Mr3LS1GKhmr62Zfn8ZdZG7KL8OtrQuT
	DGr3TyGSRHWmC3jRYu94QgaBgJ+32wQCCGkVDmgcrkbpWrIWnPzkspBlfeQo7bOzTXPCfhqpJ2f
	R2sTVqb8IMhHVJRxqlDDp6j7CcuWwkNisjNUXFt7ajF7LPCeh+N+ovjEzrFno5hYJJD1K3/4YF4
	j9B9s0tEM/DSknHUpSRUlWnrZVJyc6G0gNuJ3HOLHMxjYfk6gsoZ
X-Received: by 2002:a05:6000:2087:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-4a63e223fb6mr42941f8f.50.1794934983703;
        Tue, 17 Nov 2026 09:03:03 -0800 (PST)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f77fc47sm29339432f8f.22.2026.11.17.09.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:03:03 -0800 (PST)
From: Timo Joannin <timo.joannin@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	orgads@gmail.com,
	timo.joannin@gmail.com
Subject: Re: [PATCH] mips: cavium-octeon: fix missing prototypes
Date: Tue, 17 Nov 2026 18:02:57 +0100
Message-ID: <20261117170257.576913-1-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <avx9enOXbOGmpirP@alpha.franken.de>
References: <avx9enOXbOGmpirP@alpha.franken.de>
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

Hi Thomas,

Thanks for letting me know. All the warnings are resolved,
no v2 needed.

Thanks,
Timo Joannin

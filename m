Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792877125;
	b=S6GD2aVH2gEyuEgLskZoeg3usxxGOzuVRLx7oZSDrvya1ju/swlpde/1FHUS6XPIBNp8
	 5Nduqy4IENay/km6xNOkTkv0wR/GJv44vffv4i0y8BPn6YMnVzA4J6T+NZ4zPWp+NC5eT
	 LpIJfRWjApuFPGFHrmMalLM8mpMwAzb5anGb3JVoC+BoiqciaRcFrNqeQP+A0ia13lRP6
	 OxIV892FsTZemsyJFekftUgRZwN6pd74LeH1BBTJAFJTqq850KXkDjhfVhxf0mX+AcZQz
	 l6Mqd+KVP+uzEw6aIDBuX0IrlsnHP49SwQqg9d5GmXPW/QR4eB06QZgckTjV6z1F6zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792877125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FT/A/DgEc/1PdtmIuuiz9qA/j5kLnlOWpR51oppuUm0=;
	b=yfnMUD8wJl5zV7+ioLEsF1fV5AKZ9c8iRdlBLkFpwQRSfWtmG4pjWb4Cpssmqozlfx6T
	 1tTvt35GWpQX0lRmhAlLKJ3XB8qJx2dYsOoxzUkdJGz7wjHrx0i1UtBnT+2RwE2FHqRJV
	 6B0d04EWZoPWGeDbosSupI8h0gVXReKngkqOulPMigPynxbTmZxmiCViD4kb8b4aOhLgh
	 qg1O/TqPPpbLzssM+z5xeOUVVSE+8DPEMNLM+udve78DjHxf6LM9qHdq4pF8bxMUgAPGX
	 4wwaYyCytDmVOOJR3m+qIQv1mt84WWVyU6FaUgHNJpwN00mSCNqOECSC+JD3hbWLO7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=FFY9UXC4;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06180606A328
	for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 21:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06180606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=FFY9UXC4
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso17662425e9.1
        for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 14:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792877123; x=1793481923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FT/A/DgEc/1PdtmIuuiz9qA/j5kLnlOWpR51oppuUm0=;
        b=FFY9UXC4nEgSwxaS/SuV8AKXzuWttgHbi8x3huR9cAIRIERXXxOiOL1H4056S67fKy
         YHJyipd0Zk8OCh4mygo/AW5Zq4wNUSa0/srwX9oh9WnuMfdpOQpCL7idhjBfQhy4pBGH
         by4wi+S8CG9zXPl8BkJXA9ZOB/bjoDoc9t7EjDySRlmH5FGqzzFnXZsiAdQFzD0biWxA
         gxQL2k2L/AkwbBVc/RT3vdzBLteAzUV0wwaiEGrgXACrd/9+QHw4o94TgVrJS/8Y+8b3
         CxFw7GgFGWvkbup+GIdekR39+ntWGKaXKmbhZHI0e2jCQGhigvdv/mQsQQRqkzhVACoD
         Zcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792877123; x=1793481923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FT/A/DgEc/1PdtmIuuiz9qA/j5kLnlOWpR51oppuUm0=;
        b=dQxumAdiZpBDGLqO+XeOBYCWrVY1gHM+9WLjb0nlpEpsE9Y6QW2Eqz8gXDT2Cl+LGF
         wQPCs4qrlY67KM5XnR7J1RNVdTreHi0eNd6GK+q2Cf/bRSGYJ4XeQ2tmUpFjYvCmc3uO
         xXnkaM3w8kETklWMksGwJ2W8buoZ6tHAN+iIDx6/x7x/jIe/q1aaHRGSApJLJmLcw41Z
         Ay4Wog2g/9gp5+0WTvqLGi5bR5kHY925mqvc8qDzIjEOXw/aW9wtec+jU4hJ50Tp/fTL
         DmGXc516oNsHRSdrw3Zw0cmiDZaWikly9E0OmeDGbA8/5eAZi0AfC2OTqvfXH/kNVMYH
         5gZQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3cnnbu+yOGf2f2GOW8Lt3QCvZwYqXM7HMT4mlNinn92XqkYYwK/iRzf7vVCAc/bletpPlBOps+lJJ@vger.kernel.org
X-Gm-Message-State: AFq9FYKivdmGkfqCN98MsYENYi2VuWVuK40N1Prwkohen+JbAJGrxTBz
	ywPw5LmZmuDVgspF//CEC4jSPUEjntnS8qsB+loiTRN2wWKfsYOK+Y4VilWJLjGZ228=
X-Gm-Gg: AYBFou3kv987xQ6QYlWV3yqGo8SFHRj2cASp+MYRP6fp0I5HnnZIEZ2TGnuiBaqZCQP
	BELa3OkC4F+l9keEC8kIVFjz8Ex+Tc1hDJynHuOEoBc9/25R4E8Myfzz960aTZSX63BFZmvOvGL
	ReotEYI5g60kBniwGWAixF6Sg3q+UPlB9cw5S5ZyuM5E/0wCkYfuoT0IZu+c8WO7emCqSNTcy+k
	ntmfhJfhNA4op01A052m8tkt9N187Lrx8z5tekzzMwnhb64fPZsSrMdm4Oc5EdowN3YS/LU3caB
	FDRpLmVQUimL7b8UxZRErWInOJMr6fPYLdZq6/aTQM7RFZD6tDjo1GMW7iCdiu1HQv9O6VSMvxe
	pYv+2WaO2P8e056+Alj2LJTkOPSbiS1SsIu4a3MZbaih8aC/jrlibW8PnvVcTIff/wUY/KBzdON
	EBtbKtpWBH9ZyAAU6o74wDU31DcDUPbAYOcfDhwYZZu0/lhalcfm2sraxUT5Doiapul/N93rW01
	Ad15pCZzPmvW0RUVNNvjib+FkUAWrNDLRicWTsnvyA2s31N/R3TSr7hywY15ZjHSJVfSd46kULW
	RBwFzBTxv+LOmFgRM/m2CnvWTb/vg5SHBQBedgdJO9UmBiIO8xSDA+aSfUhxmKuXm5C+Z5m1u+1
	/RqFpvw0/7rZhRr8SFDQ=
X-Received: by 2002:a05:600c:870c:b0:4a5:4589:24e2 with SMTP id 5b1f17b1804b1-4a545892686mr2153365e9.7.1792877123471;
        Sat, 24 Oct 2026 14:25:23 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm79597135e9.15.2026.10.24.14.25.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 14:25:23 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 2/2] dt-bindings: i2c: ingenic,i2c: Add the X1600
Date: Sat, 24 Oct 2026 23:25:20 +0200
Message-ID: <20261024212520.91401-3-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024212520.91401-1-olivier@mgcrea.io>
References: <20261024212520.91401-1-olivier@mgcrea.io>
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

The X1600's I2C controller has the X1000's registers, so it falls back
to ingenic,x1000-i2c.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
index b61fdc9548d8..9004f9799fd0 100644
--- a/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
@@ -24,6 +24,9 @@ properties:
       - items:
           - const: ingenic,jz4780-i2c
           - const: ingenic,jz4770-i2c
+      - items:
+          - const: ingenic,x1600-i2c
+          - const: ingenic,x1000-i2c
 
   reg:
     maxItems: 1
-- 
2.39.5


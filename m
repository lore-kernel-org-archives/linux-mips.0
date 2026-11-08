Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175069;
	b=adk5K5QB8xmI4LAw+5bIzIxck4no+F1hLXmKibrxAL8a0CySr8+5nq/yDqYhJaxb8v5Y
	 CPxL9npSLu6LI+7Wyf8Q07vW1pQt7DeBmJEpbFUyvZXFO2/mGyrpmJ4VvwbqAoHuVhq5T
	 CA+if7YuBnvH5ufR3U7HzzkjEq49AJZ5lAa7xjds7RommJ+QZm2ySfe7saTek4yEaNDu6
	 L/rN/YK3A4SkKaqBFG5riVpDge7n9lqU+p1mfsBuoL4Roe8tI5P14np+WX6ERjwCQ/PuS
	 JE1vmh8vtGHuNmOquVg8ndrT4GDq0ypg8k2SfSivx1Cekk/BZ7wFJSuU7snFQXaYmGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AyS5UId07S/P0XVdwD+qagOLSX4Ppdf3Pa4ETDTv2/Y=;
	b=KtmkpZy3hk0k07BGMfyam6UU/WE4hxsVYa2qcDWTauvy/rnBB475xStIwH6pTTp9TEJU
	 tUnAFFS77pB+BI9jbhVGvR1MFw1vZwC4iXmSuat+L7IcBD9FATyRoC2+++Y3aid0JJkWc
	 buG6a7ydZlwpT9yunsCxkjRpQUcVL9UoKahxVjYQ24N7IA0/fsJb9tbrGZGsuSksdFMrV
	 eUKcBXs97rEjqEMNj6+cev4etivdM24x8W/cc50TMpYOZ3S5UpntVDDTIjrz5vvdbu01v
	 m5rIf9Tdcs8qi/0Q5kpo05WXRBiUcc8Kcs5EQRMLfEgutVTrLYXfCQhFKnVqWyOGayQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l+4hqDev;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACDC606A33B
	for <linux-mips@vger.kernel.org>; Sun,  8 Nov 2026 21:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ACDC606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l+4hqDev
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso163186a91.2
        for <linux-mips@vger.kernel.org>; Sun, 08 Nov 2026 13:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794175068; x=1794779868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AyS5UId07S/P0XVdwD+qagOLSX4Ppdf3Pa4ETDTv2/Y=;
        b=l+4hqDevVqPDmyPVmJXMFgwoBBedr+Pp7izQJcKTkuT39n4zCq6+mRX1ImEs2AOP2T
         oWTKx86o3IAS07Ip4U5tc6jYEwAHWPG/EO8wzpg+PNxh/mDPZCZRRqNcntxJ/xr9ZwsG
         p0b4MumJjGCyEpcb/xTNEeaseSPMyP/DhwlrYxdMijLAKrLFYtAnj9qMuWvOTsTBq/dG
         bkyJmPjGVHFNW4dPMZDlRKGwdakOCx3GfmsFVIr8LyyDzsFJKXbhhbDi9DDq1scsV9ZM
         aFmvnp0xAFEkBuuE33Ad5TJCbu/1Calqgp3gvCaXOVmZEAbOraQzmTkuORshr2wxPYmC
         wSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175068; x=1794779868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AyS5UId07S/P0XVdwD+qagOLSX4Ppdf3Pa4ETDTv2/Y=;
        b=TU3a/T8JdOXjN6qojmTuTXsdq2amSms7vd8EL7xqm6+3Exc2QXBfs55pl/yzmL9F5k
         j/U8dM6YhbtYL5p9aRon2Y1i9NgTwEkyMrrTQKnUhgIVctHtFI7ILFIoZfCVy9r9hjiO
         FiJ9qK1sxuh7fwunQI+jMGJAJN4jzFhSMfNpcHEqgfkqV84d8sQhA32k7qNUnAyBy4Q5
         QqlkoVyBJilkVyOHbTS4CdK742X9i1JtpAg5VJH6pZKioAv69urL+YV7DcMs6Oy6zu1g
         te5imwEWDkuCzo/jspLK22uflH73gSA1vzs4AnFpCxVLx8mbravDKtvKBcE41ElPz9W9
         SGmA==
X-Forwarded-Encrypted: i=1; AL+hErHzyA0bw7oAwqhXI0OS/ek4qimMVS4m6fuBTSrriugv8CLsgt6xZWdVymwcPdXImBvHq5rPP49+1bLI@vger.kernel.org
X-Gm-Message-State: APuU4Z98HrqXy2HQu063f8UiGK91IL78cfbyHiw1IPQM5HMWZlpj1EC+
	NQhbnzgkgX0XJaut6MxDweLACJOvzsbpa7EzVNZUapcflO/+4V+K2V06
X-Gm-Gg: AYBFou3S1LNQTcdwRGHszycrr3du8azstgA3eTTGSbd3+pyrh1Mfk4oowhjlDC4yp8N
	fwGsO6XZ0wGrfBuB6EUAjTS9kvZmNiHX4AOUcrYv5KlQjW/pqttNr4EIpoOMcLvlFT47dlgNUkS
	iDv4ppH9mMVXv2w6BrUeyt8WabO/ptrLZPluPFdeXx9m44Fe3g4ByahuPaJOX9WdKBVcRX+XMLS
	+MfFeTCdmJyXQ79/vcy0heYQz47MEJdpjTD903CKGQ9AS6+ugwdBuVZ8S54jbxhgJy2FqixUDVX
	FGcfEBBbOHYbjrGNmXmB05/x/nwTWNvpXkrhAIDqb/swtKpuvXT8xlradkq9FUjOtt3DM5d9s9s
	m6letYZ8SmPIhdxf/f18FK7xFbL4Y5RzX+C9XSFtbx0Oxd6H5XL09MnQ147LrgKRq1DZ2YwRV9N
	JeSu7BQ7QYT2MxCs8zZa2qWf3yYWWMpzkvRfxOTM5uDcxSYGQ8Lh5WVi/bzVHOpUUxHQ6uOVKtD
	Kc7vEdlvsTPSTRVFrDklNy0teM5t/ocDBcP9vjAVyHM4X5VtMcnZfoSr5Y12lvS3R1sI4O5PYGS
	+HYIfA2qhOIyidicIX5aPMlbg5hTr75V6tiTKCbQ5zmjJDOhjhkchWL1CFrD9/8ixdMnUr25ure
	PLmyOsWYyZVBbWFG3pheRbCWDBkJYVMW13RlBT3INakkxGB3JiLRfbJCpGrA42nzhl7+bZ+Ic2N
	3Csg==
X-Received: by 2002:a17:90a:ae0e:b0:3b1:3598:f881 with SMTP id 98e67ed59e1d1-3b13598f942mr1243857a91.53.1794175068525;
        Sun, 08 Nov 2026 13:57:48 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1152fa888sm5692976a91.9.2026.11.08.13.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:57:47 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Alban Bedel <albeu@free.fr>
Cc: Radu Rendec <radu@rendec.net>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: interrupt-controller: qca,ar7100-cpu-intc: allow shared write buffer interrupts
Date: Sun,  8 Nov 2026 13:57:36 -0800
Message-ID: <20261108215738.113582-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108215738.113582-1-rosenp@gmail.com>
References: <20261108215738.113582-1-rosenp@gmail.com>
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

On AR934x and QCA953x, the WMAC and the PCIe root complex share CPU
interrupt 2, but write to DDR through different write buffers. Document
that such an interrupt is listed once for each write buffer, and that
all of them are flushed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml   | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml
index ab32a91af4c4..becec88061d7 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml
@@ -29,7 +29,10 @@ properties:
     const: 1
 
   qca,ddr-wb-channel-interrupts:
-    description: List of interrupts needing a write buffer flush
+    description:
+      List of interrupts needing a write buffer flush. An interrupt shared by
+      several devices that use different write buffers is listed once for
+      each of them, and all of their write buffers are flushed.
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
   qca,ddr-wb-channels:
-- 
2.56.0


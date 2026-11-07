Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011271;
	b=GYU1nHC475SirLi0OftYZg3NpHcUkctsfM9lhHmSUi2UhCWoyEOMV+mCGiMhCliwDW/R
	 cduIM52yua+x1dvp9XAv7kqcxyh9rmJJK4OB6E4R0Rl85DqX9fkoJ/BmffilPCJW1kvG/
	 qw+T7F++GgjPyPHnl8XZ9ck2SRLHE9WDuyakTzLP75PGfRBnEjnrj9Ix6MfaFfJGOicwQ
	 VNdkIpDHkSlxgScQkuzeIzK5ojJTv43bLdQevLOrR75svUcz2DPk1XkAhOLmX+EbPaAF4
	 ulPY9yc5BFGoM4iprb6vWBTNntX7rqjmgimoruL2+6CTgZ7JpUL7sPX0BGqydrD8YTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011271;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uaMRO2fzvzuS1ux/KmjGKqBbaSfv45k34PkBtBvjTNE=;
	b=gyuJO3FViH/n5XbKVyOhDZ9/Sd4xXAAYjBiYjC4aVrxRxoW/j1uQOc267b2VPLNSSEMQ
	 DhUaQkJmND+XsjSHLQIGdGQAxM/h12x78CzlLcqetmylGOYjKO2h2eTAzUxzvgzxBQGIb
	 W0ILuAYKIa432TT6qxkYeKw/NZowJQQ00eKiEK+QkW5iPor/jsajLwiQ1M92ojcMYQoeG
	 FfoNniHuUwQA3K6Q9DwmkIhqmsPtMw1A/zWbQPAJ435p2XH+YwiMqRRq+QOShSKkZ2Iz6
	 ZSroJMerqgXwlGqHucQKdlGjnzeJal6syQL0bVEjCbQaIysotLOEPRkAyLQmJRUmEiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hlX9jjG6;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="XRc/9wth";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B70606A32E
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 00:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52B70606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hlX9jjG6;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XRc/9wth
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uaMRO2fzvzuS1ux/KmjGKqBbaSfv45k34PkBtBvjTNE=;
	b=hlX9jjG6dO4tjoODEJnGlQHpW/aTDV0BEHi+LTfTUfkalxlg8R7wqRPb5dFNPPqS/z6ehb
	GqAG9IcWbNOZNyonOrPkeObT126dMoersEP4fCHybFhQvzJQ19Q2d6JDzc2g+E/5yMo9Pi
	AAr51GfBmtIL0YY9OWcGzXCZV7tkDsM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-zoobhkkiP5iN5dM9YrTGMw-1; Fri, 06 Nov 2026 19:27:28 -0500
X-MC-Unique: zoobhkkiP5iN5dM9YrTGMw-1
X-Mimecast-MFC-AGG-ID: zoobhkkiP5iN5dM9YrTGMw_1794011247
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so319484885a.2
        for <linux-mips@vger.kernel.org>; Fri, 06 Nov 2026 16:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011247; x=1794616047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaMRO2fzvzuS1ux/KmjGKqBbaSfv45k34PkBtBvjTNE=;
        b=XRc/9wtho+AlA/ao6oK3x8Xa9FYeG9zsWUjW02/au1f3alKP58W9CD0VYRLBzHGhBY
         +EZQnOKB1uOyLI90XYyaBbAq3yUy01h+uCqci/J7GgfyQ8X1FJFNGaQhChGWgOXUVaZy
         SZy3Uy0kdByC3rhz/oueukC6F3yBMrrmXA7OE8UgkBAthqvC54gJNLgdgBoHpBW8uuE0
         IWrwxlmo+/PDCFRLoN82jhyRN6M9k4iZIxZ0Qq+owZsybIQd46jn3Zwz2fwU4PHRSCvn
         Tza9BGTgwUbapRprZNj7K/vtjXd5UrUxfQq30QRRw6awVYT7GE/kYdS/MkgC2A8Xe2fh
         Xk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011247; x=1794616047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uaMRO2fzvzuS1ux/KmjGKqBbaSfv45k34PkBtBvjTNE=;
        b=jNkDOFwR8dHv4MWokZS+JufTFvUK86VCZy1gWlZOLIHBu+s7krgj8Hns8LB3FGxScT
         LQgkL42MUhUZas5XQ7uu+uESVqEx1AYXCKdpX1KO56YkDJwKT5sEurRpS+UXRhDezsQM
         tC7A4mTqi5ab5X+Bn+aA5wRqRlXF4JXd/VAeoWa6jrxMVWYxQRG07KJ/cUR+nqoNqu5Q
         1DNL510DMPW/WiQ4DfPb2LRX5ZNR+hXsXnCyPaW4Z0j9m8BDWVvvWmVvhCZODk2bCyIc
         NWESUu7Z4rFSt3tOVfHXXNzf2Ij3HgRsqKv9EDw3Rl/yHfxDk7juwazfGkaUbr4GengQ
         dYRQ==
X-Gm-Message-State: APuU4Z+UMRnZIp2/hVkO7XqErMSQHcoQ2vPlDJj7v9K09siQem2Kk/JB
	oCELbQwXCE0idWfMAanpbMCce4g81Y28D9QlHkkH5mUswMCleur3h9rkumvKikRE7fu3mJPeYIm
	Whx6yXyyTyByJ1z1AZXqR3batKpYYLWawqPoAu+2cv1bZihRwR5ET3bMDCAQVRd0=
X-Gm-Gg: AYBFou0FvPuL8CeW6ICmuUOwJiNKriOZCCldYLn6tXa3/PadafWK5RbdNAZcjJdbIcv
	u4VBcOwuKAkudK+pQ49JrCJselPIDJWIEnES8SkbJEY72njFtV+KWgaSjdgo73P3GTcmtvasv+M
	MVLma8t/FoKPc8JeZKz8yv4UIhqNCApeMLm2kyv7WNN4h5tyUCl3VxApCHBFprwrERDtMD/I/FF
	CvCU62+7S3azR4mBjtC6YwU7F/lI+zooi5HjU7eytSVE69rFoMGGrVHv+RP73oydV2WtiHHJT02
	d40Tz1NvgFEVLgg7b1V61HJi7XXWRZCYSaeou8V/FnVYA/91EFY9ANazgS3JZh+lLgz8hUv07PC
	bnyMXxmI6L1Xqty7HbCbOnBXSkkezDGP8O935Reui8tt/JD0PC8MvTnARk4vWMwMwf0QOnOdwtu
	Q7XBODQU7Y62KlyGeH
X-Received: by 2002:a05:620a:8006:b0:93e:d5c1:da49 with SMTP id af79cd13be357-945f3638186mr601942785a.82.1794011247489;
        Fri, 06 Nov 2026 16:27:27 -0800 (PST)
X-Received: by 2002:a05:620a:8006:b0:93e:d5c1:da49 with SMTP id af79cd13be357-945f3638186mr601940585a.82.1794011247091;
        Fri, 06 Nov 2026 16:27:27 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f5a97aa1sm254122985a.8.2026.11.06.16.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:27:26 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:27:12 -0500
Subject: [PATCH 1/2] pinctrl: ingenic: convert to
 subsys_platform_driver_probe()
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-pinctrl-subsys-v1-1-f17582f32aaf@redhat.com>
References: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com>
In-Reply-To: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com>
To: Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linusw@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=877; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=qS7kwaZ5wh6601gIdwcEGb6zbpvJGdxwP4MG7PQygYA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFWTp3nPdUTrPJvBSdKhO/ZnvHFMFpqiUzJGS9Tv4Z
 dmbtWlfO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhI7UtGhkm+j/8kuD6sSome
 09n+9tHBlVbb5tQlz9FQ3iKUMe/so4UM/yumeln0B6hXrmC0vWC46/dB0fglDgpu5z+GtnCeW6c
 awwoA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use the
macro subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index d8ee489897ae..bdadb343c7cc 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4698,9 +4698,5 @@ static struct platform_driver ingenic_pinctrl_driver = {
 	},
 };
 
-static int __init ingenic_pinctrl_drv_register(void)
-{
-	return platform_driver_probe(&ingenic_pinctrl_driver,
-				     ingenic_pinctrl_probe);
-}
-subsys_initcall(ingenic_pinctrl_drv_register);
+subsys_platform_driver_probe(ingenic_pinctrl_driver,
+			     ingenic_pinctrl_probe);

-- 
2.56.0


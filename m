Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792877616;
	b=OoPh+I83WrkPOdNtmOXHFbDuH9bupiO6+y9079zcwP6itDpwOMNQQ5cbHyCViwuwY0UU
	 BSxAUs9TH+2aT+7ZwtSE4bGc5xX4JDlf2wrmQpZyWwXu1Q1SntmseSSjXH17N9KqVYzRE
	 e4/QfYxIh7w0/PIR3WHSVKTcc5o2uepInBhRVZ/YLij2D6KNrWqD9AfruC48OzMSHhBhN
	 aS8vKdHBsna/HiTtYMRb6tJcjeoCQyfR/yYjUUl+471Xgg2MtgmbhP4Ha3lj7ESkrX72z
	 2iXOOW9zioj8C1e/hX9n/ydouVYEoF8Qc9g4RHy+THgKudLtY0a+CtD9pvl6I3ShApA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792877616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0KswdmbKVSA5fjmS6TP3KWbeGyCgT1MgBNiKyDDfZYs=;
	b=EW9BMYWjGBbD6cP9racMOyQeJB6zrsIIt3n4/H1ejTXeq0QPHc5woUODgVA2hxxTGLEU
	 PO0WysM3ga5v8jWF9SnbszGeX/i/lIBBO/Ayp6S5N6zq2QRB0nRPaLIdX6nuiXc9AArgE
	 OQo+arAFsiyEvTOeo97Df837V9NA1eRvgsGHXePLOT9eJ/OJsLPyoJo565CbK5GbTilIs
	 CM6sQtp9pAb2oILpag/81awCBqfQtwxACBeUd8u7LzPqGpxE3u1SS83fAj0D+GqRmvb0C
	 TKF6lszZ0T8iqtXRPpB4dfHmJiuHM1hrDVyI6ZO0Ahz1kUpUr9rFDYbTRiIjsQFY7EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=zCt4oLyI;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C996C606A31D
	for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 21:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C996C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=zCt4oLyI
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso19726995e9.1
        for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792877614; x=1793482414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0KswdmbKVSA5fjmS6TP3KWbeGyCgT1MgBNiKyDDfZYs=;
        b=zCt4oLyIkkf1CqfeSXRB2mIw1vUURk2wMEQclBWujMGgge8xHAnWmq7H82vRauzL7y
         FAoerBqlzYJKFOkvh9Ejj4giXXpdZn4i7Ev5wI7xnyezfGiOdsRZ+AAGQdEc8q9gaayV
         k/cfAIp+VhKqscjhPf1Xn9g8odsIFHNKPHpCp6MFFGxo3Sip4v83pVWapXmdfIB2/ylu
         456rlPZwb6DVAzRr26myyhB6+uPJOEain+cKR9mpOXVbs9jeMyzm3hcJcoEPX8+82wSj
         k7H6pHmaYuMEbsDBCg5iqIEjpGworu3hpgfFHyvjNCu7joTAVwDp60xcOn8lZQvLwcby
         P5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792877614; x=1793482414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0KswdmbKVSA5fjmS6TP3KWbeGyCgT1MgBNiKyDDfZYs=;
        b=POe2K0FfOBobLTtopfOwT9M5KuAS5XuAYVW/Os5TUgXtMzGsCHWfFGBL7BTZZEudBt
         Fq36w/YCnzXJZpaG4iU6elNBZh49sWJ3R+0zMW9qb/KJfx2RM7Ve+H+3NdKxAnEsJp2y
         Zh67EYmRyobUaDW/ZnT5OIEUVQ2t8zssWZ1/Vk8FBcj+UrF0lAid8Y6un/QbNz1HIdZA
         1hsrtO7MfVYewPccibrclkWWKK89qNVv1djk2jS9Dqj1FUYPWBEdUo9CAPmc52v4uoRJ
         1yJnCCXBlbJZFWeHxka+xLCKY7A/07vdfmTF298hiSLwgFoMy0+kWBLQ4R608pbXPLQN
         V1sQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBYlmPgwSUbWmXHV/NrM9z7JvxYCSELbHp9PSin0D4zSlhaEgzw7JtxbFI7l61PcnlY4IFVj+RYOKd@vger.kernel.org
X-Gm-Message-State: AFq9FYLSatYKsi+G5XzfJI/4984jOWxDNqBMd2yjSCa6BhZGXxhaVPNA
	xYT1pm8ydhZiFObaiVMfuCgfWRad0bFv+XcHzAQ1EtUa2dYFxTqwSAcZkIjSQUOM1kY=
X-Gm-Gg: AYBFou2TJzlMcRHW+MhUoIqg2610TiWKN10U10jKkqvjMvN3xk0McOD2sAqIpPKpS4V
	88wJYBBeSGLICMYYPt/SoKQ8N/NBkdfDmRwnvAm0QIWTxFuBvcOq4sZl5v48ljijNpTDIIk/SRA
	60ugbkGJWwesanG8R1buMahd+yu5he0TBcnwaUfyT4KeLx5wC9EnU/P6SLq15XXyAc8TqeKPpvp
	EgBGj2LNe1gCOETkbxSglh7FaluhhxG9CuEYaStMptKp29uYiFc+9nZROHb4aqSy2X1CXli3Ovm
	fv62fJHeisQJoghdAZ71Tnm3hUF1Q+vFfNxOChTQQjfVNOw0w5pLhNFDDfWYoLug6bYkHrNAfDa
	lE5LWYQDrCzstUY18utDMSyieVznEwLF6QLH+GhWVp8K0oMzNkHw2ZWVTFD/Du7ncPdhbxgnS1x
	MnJYRtzWvNQz3sqWlEPZEmPcdPO4CMK6H/sDVoLobFbf15cdAS46yZxgcSiovkcuaXArqiT/duY
	tbnagFlM2JhQRbMcDU1yMaUp2ByjBuk4cqh7zQzneEhzU3lGufqPcpthLq95iNiZbNrewIHjmie
	PVzbf0lDJKzxoFIzwETPi0h2aCATcphUG2kogYlpmgJUlHuGCc4kZzlf8bAFQdvPH1kG37yUgqw
	=
X-Received: by 2002:a05:600c:3b93:b0:4a2:397:73fd with SMTP id 5b1f17b1804b1-4a35ac96004mr48075955e9.12.1792877614164;
        Sat, 24 Oct 2026 14:33:34 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bdd59sm50531495e9.4.2026.10.24.14.33.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 14:33:33 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: "H . Nikolaus Schaller" <hns@goldelico.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
	Paul Boddie <paul@boddie.org.uk>,
	Andreas Kemnade <akemnade@kernel.org>
Subject: Re: [PATCH 2/2] i2c: jz4780: Add support for the X1600
Date: Sat, 24 Oct 2026 23:33:33 +0200
Message-ID: <20261024213333.51569-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <465127C9-AE28-4F01-8721-8D819258D45C@goldelico.com>
References: <20261023081452.44118-1-olivier@mgcrea.io> <20261023081452.44118-2-olivier@mgcrea.io> <465127C9-AE28-4F01-8721-8D819258D45C@goldelico.com>
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

Hi Nikolaus,

On Sat, Oct 24, 2026 at 05:00:10PM +0200, H. Nikolaus Schaller wrote:
> Comparing x1000 and x1600 programming manuals I was not able to  confirm
> that the registers have moved or been replaced at all. They even look to
> be the same as with the jz4780.
[...]
> So your problem seems to have a different reason than the setup time.
> But spike filtering may have.

You are right, SDASU did not move. The write to 0xa0 only worked because
it shortened the spike filter.

Measured on the R1, driving single reads by hand with the filter set to
each value: 1 to 100 APB cycles works, from 110 every transfer ends in
TXABRT 0x1000. SCL is high for 102 cycles at 400 kHz (140 MHz APB), so a
longer filter hides the controller's own clock. When I first hit this,
the R1 had been started from the vendor kernel and the register read
116. Its reset value of 1 works fine.

v2 drops the X1600 entry and programs the filter on the X1000 and later
to 50 ns, with your Suggested-by:
https://lore.kernel.org/all/20261024212520.91401-1-olivier@mgcrea.io/

> But I recently have seen issues with i2c on x2600 above 100 kHz so there
> may be a general bug in register programming which may affect all processors
> with x1000 and above.

Could be the same thing, worth reading what 0xa0 holds there. A value
left by the boot loader or a vendor kernel that is longer than the SCL
high period at 400 kHz does exactly this, and at 100 kHz the high period
is several times longer, so the same value still passes.

Thanks,
Olivier

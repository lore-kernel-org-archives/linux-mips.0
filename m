Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795348980;
	b=lEgzCLHenLa3QA5vD7h4l0M/8T6KvYeVFuwwso8bcwub5A9ixzy/XGAtSh8dqgn9SWxF
	 OQLpP3nBDeo5m2H6nKVY1be/uEWbRpJcOczJetTCNz+EIWMGurbhfdCVsFdm+3UylPRoX
	 JwWKJ8uBNtrxkgMqdw7BLE24x9bvasqOXyjvlOduXiN/7FmpVHPldTc1f2mjIymeoZIdN
	 QIZE9OqV2SJonLh/TMwBA2b5y0KMMPN4P+gjl0LSkWiqGO4ihdI+T43+wRy4lAc7ZVusz
	 D7nhOmuFliQhmWeCiR4K3TG9De0ZQ/3O3chJbK9oqg4o2Zko3jtyJ2/3iWH16DAMH/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dxKNiMftVupVb5om+wXy5zkYQQ2Gh2XoL0QWLFEag50=;
	b=hp0InmmsFj2owBFbI+qLFVoLDySfn+0beV/VQCJkiViTc79fkpcCylcGdNDyvdplz7ln
	 44UA6dDp6fyvwjltIOk0IfAy4QnRrYaXTaKoRs+/cJsE6/Wgw9GBNEvir7dROE0iFt0I2
	 fxTCLPFdbtlM4Sdb8GpNab06ltz7IR1mniJqUcLf/83tR169GHH87CTU0syJFuLPQ+dF+
	 kDqh0VaBGPmyPB+CysD83sqtlVgrbmjgCEMsgWhb3dXZ6Fntm2rQxUP0sU9gKzG+y29uQ
	 KyvIhXGkziw4dQVpa+Ig1ve6xdPCubHeGH0Yn4+GSBp3Npv3ZLdLrV6zPBe3VSXfgKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB4B606A32A
	for <linux-mips@vger.kernel.org>; Sun, 22 Nov 2026 12:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DB4B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d05d51553so15695195e9.2
        for <linux-mips@vger.kernel.org>; Sun, 22 Nov 2026 04:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1795348973; x=1795953773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxKNiMftVupVb5om+wXy5zkYQQ2Gh2XoL0QWLFEag50=;
        b=h37WmvXlzeqJOg2skDXkuZ2+T7AUQHNgThGjgdFemHp3spzjs6KBY6eYQMLhocih+J
         vdEYZeECN+/WBbybSUhmDji0q0kGhSN7f+RdRRtaFsNi9yWY1lNGJn7xuB1cn5i/8ScM
         tk8BgynI/J3dvysUVS2moeOvYoAiSkA16sgDP4kNic15y1ifZ2XzRwI2fFI708nj/zbj
         k4sb0gC4CgEJ8mxFEo/8xTtmnkXiveyBTOdD35D2PGlgGGZgfKF8JiO/OTZt4Ix5WVAr
         GHqZITv4Qhv0YjEyHEL3stdQh8wMyhT/oJLoqFHi0za1Jcw0cgXO3wOQ8RQ8wuH5oSAQ
         kDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795348973; x=1795953773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dxKNiMftVupVb5om+wXy5zkYQQ2Gh2XoL0QWLFEag50=;
        b=VXyfs9f7tnAS2Mw13DI1ylBo1H7eW1nJxQYwYmZdzI4UfokdOpQzi6qjwMIyHqb+dU
         IiU4M8dC/0szV2FY/A15VTQewKAh917SHHVQg7Q0sh2kKz0gOcwNk4VZcE/nAlDcY8iB
         vPJ0AI+z4seTVS7YAVQA6Tf7eo/4AQ+D8mIMcsLSOyJ5HB8yBrK6rp2ieKjnvytdWrwX
         vJ0uczP5fSmaM+5j5oT8GQQfnE3eVm4ScAvw0gTne00qZ62lg0gvU/kGxPI6KrKmZKxh
         6Bsff1eNrxASi5c5fstnzfrRpka+38ajtSVh/+0hWdd+brfXVne1N8pdXNQitqaSk1gX
         AUGA==
X-Forwarded-Encrypted: i=1; AL+hErFQhrupf7mv6sQI1n2cbNSGED1TA/4fZOSGzKBjy2okiDTNn0T2025ape1HQfTBqR3wmap6aZiuzLw7@vger.kernel.org
X-Gm-Message-State: APuU4Z944cETWO7m/9usIPdpldOvayve2Oku0u+wsdDgrIejQD93fkUa
	aThKLZIif65uzHYRaIGcmJTn8tc9wSd/nKJGWxA0VyAbGSz/x3VeuvY8y3NWtGtVKPbwJ8zD6eH
	jYLFTSHPvoA==
X-Gm-Gg: AZFdTZcFhwS6UQhtb49phb4+MY9KU0RhDUJQ9kaJJjLF+fkcXfQSa8KDOtnCBdWihZt
	1MEZQhJcbbN+IZVGk/ConnsnBUEsfQPLn+6jhXv+egJvBomiN+hxrfnujcdZAMWfrcmqjZGwXzz
	8cL52Ropq+ambOBv/6SYVtVI1ahXAzK07OBhgVa3UqtXBgN52xSQSzbmxvL8Bf84AXrj2aPYNgF
	ec5cXUYHcOgJ8LHbpeupzaww/vXe5aY8fe6exeHhLgzIge3oWv9a+8sP7wGQS3kPWZimoUCGuhH
	WJBaXvYIh5CmKm+kKS+oCiFdExCA+zZq+Eg4X6g7r127o0VUQMoBDPDXRyGHg3Yx/RDl/weRxPV
	jGnYq4F349f4rtjaudR7r5qQuQrJKA5xQys787OdiwO59x0ILz8PY9IoouWUjY15i/FBGdqk4lm
	wDUmlL+/VJnUgYhD9EB4u4QDZkTgxzVmLCIhmV+2ud2YbsTQXBXTO4h4hY/vIUBDADXr05IXXA8
	vCvjBlcCwLcxvlj0F+RwyGKye4eTskaJepgHCHwIVnm4SBK0LDMZ4jTn6WgBd8vIGOw7PgjFr3W
	c8ttErsWWd+FT1nP2ew3GMdSko0GIR42mkT4t6ziJGWWEalsUjnoc/NS1AJu5wv9BEwzCwRoiB0
	KPa2hmSs=
X-Received: by 2002:a05:600c:1c28:b0:4bb:867b:f0f0 with SMTP id 5b1f17b1804b1-4bb88810708mr212949495e9.15.1795348973238;
        Sun, 22 Nov 2026 04:02:53 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:a5ac:a6f0:7687:6596])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm209160435e9.4.2026.11.22.04.02.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 04:02:52 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: jz4740-i2s: Add support for the X1600
Date: Sun, 22 Nov 2026 13:02:51 +0100
Message-ID: <20261122120251.2083-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179495557744.2707353.8222109296948133350.b4-review@b4>
References: <20261024214438.33342-1-olivier@mgcrea.io> <179495557744.2707353.8222109296948133350.b4-review@b4>
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

Hi Mark,

On Tue, Nov 17, 2026 at 10:46:17PM +0000, Mark Brown wrote:
> > +	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),
>
> In the v2 thread Nikolaus said that there are separate TX and RX
> dividers, is that the case?

Yes, I2SDIV has TDIV in bits 8:0 and RDIV in bits 24:16 (X1600
programming manual, 9.7.2.6). RDIV is only used in independent clock
mode though (AICFR.DMODE set, the "6line-mode" with its own RX_BCLK and
RX_LRCLK).

The driver writes AICFR in probe without that bit, so the AIC stays in
share clock mode, where capture runs from the transmit clocks and so
from TDIV. That is why both fields point at 8:0, as in the X1000 entry.

I could not test capture, the R1 has no capture path.

Would you like a comment in x1600_i2s_soc_info saying so, or is it fine
as is?

Thanks,
Olivier

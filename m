Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793838899;
	b=Ep+0j3iom/DObsmDFTC3zoznWm66bRiIce9D7OxMlMTGU+oQQhFojBgYzA1sQ4x8PS/L
	 Stu8Lgr9j5W0BmQVgZNFWdMpPpK21I66TOVXPUOxrxEQQ1BRPNyiUqRaSdrJTgPo0pzin
	 qf3ARE5g/wxec8tEb74RrtBLXZqpyZZrCPmiyiI1i3/K0dfQRvtqyHpqBxnBrEOlB7Mdk
	 sLtTVOHK3iSsWHqKTg/ZuDNv3DFk+6b8JTcIwLQFx+9j7nWKywR8boHw5ENeK0Y31NRGK
	 k78AMzNQkohQKbC5DSLAxUkbhDDG22/XVXdnyno+Olijubazs7gngXj68iU9G3XQsYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793838899;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=B55JhhT59YGsjYWJgV+XXad7EG0ayDNShVoZf8DxBWQ=;
	b=lAehrKNwLuJNI+tlhZd9EHS30qbPvEpyYMRE94MoLrgVsZ9ThinIJcnR/TKqPlFXhstC
	 gbM56LaPcZOh7zAe44H7AreIiE3dLa/QpmW8D8+0qjHKzKfJCKMNm3c6Ka3QG9Sgfy/7s
	 v4pSRuW/m8MokV1zgMPwx1DLS6uK2doLfkPRYycLCKg1+Pb6YO7zNk3LK1YDDXmA/WkIh
	 gv3g9mA3K4IaLvXDTPZZC1ICXvsXzh0CBPgdyIGQs1Q/XAJvuY9PtUYNu0lx4bspEV3pT
	 amgrZ/CVUGz76MH4vsnQgVK+2cglf8OvWW+zjyJLRkbn7YSxAdFvbrWDbjdiOlDXieg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817EA606A330
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 00:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 817EA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so925941a91.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 16:34:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793838899; x=1794443699;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B55JhhT59YGsjYWJgV+XXad7EG0ayDNShVoZf8DxBWQ=;
        b=N4cUlyqS2JWmeqIIPPMEdZ/VqGyUqqGgTnpj0rUVhZmZAfIC1MvCrel63mZY3FH+zD
         VvISSSrN5oolB/y3Hbk0qWyVaVN75LGKpiekh9jDp/V/pjddLEmUwpOkP/0KxdtEBtlg
         XTUJvftak5HvHDFJrHieRXyc52pwOlD1G0PoYoB56vqoiNjSlMcj+wKYJ9dup4Eksnea
         9dxrzwkqNxztFjUkQhMtd1KPPB/IKfJSiSfGHKUCNQgdOzkLRePkTO4ni3wrnx0QJCxI
         mezhyEP0Ir7+aCQhinTEJUsS1mIU/euUaYrp5n3UyNizqigw4wjhbSHusCtCoGC5G8Ec
         8w+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwyyuh06A6f2SK4AfEp1FGLbKqeHreSA0A5nVXNIBW5QlTQA/GqLiSjfGxR7/D1zYunyVQkInyMPL1P@vger.kernel.org
X-Gm-Message-State: APuU4Z/nyNylR5YQhsAphiKHxhwSZKTvSXsCtPakLpf3KCUJVLw+GIcO
	LhPGz2Chz2tJNF+h+C0OsDknXDcxpds9guCV55FbIWWdX3KP6HWR4jQ3u1xkiu4k
X-Gm-Gg: AYBFou1x2p4jhPR5ctpxJ+BBPwLTu6lfwik500G9r184Tt+MF7LLmdvhDWVhAeyO4Jy
	6jGtchsirpfOwH9XU+evsH9qBTUfq8z8aPpRQg8yJYe4F02tvLoaGSUWyz/JHtKrsxDQCJRJ8Ig
	2cx4SpRqMqwNqiCMwga/nL2C6jVytJM/cm4bNwezTH9wb8zVpdEugkVzgAo4yknepzOw3o0Hl8G
	zPmqe2EvORzXcZEs+SFuQOnbS4B49IJ9RPJXFOHm6qRKXdLK5LsGKFXHoRdSyl6OTDaL3cwnhpA
	TBAxlhLyud4wTahaLTLeaY7qmqkYppsvFq8OACskhpiMwXXKafo2t0SxkmCTY3KU+CDFvA6QZsW
	gLxVw+d3Y88SQMG5oPaYwoFRmHP14pFjUXE2O/+lLvgwFiVpeqyc55kI3wzRdevqtiVLoamnySs
	9VV5tWFL6KeQ462fgqPlHkBrRo2XehsF2LNDFT6X33Hybg8r3HNCQkn6tPBbYFmJp0GinvZJ6do
	+WnakCgt/YKhZ0icK1RweT19tDd3XMZJfXzbmoIga4sL5as2CDqDjM+rPic1KWNRiFNHiKKYlIA
	5bQm3FXVh71+6gGX2boAse5t3S3yryeU5lmOJfXCsmTJ37LsPfn196bho0U5LKEeARuoC4p+Kxm
	rNXhDo+N8q5EdHzxlnVOLdtLjEFOu7a+Hfc88zRr7ZJUctnyghOJT6bA0TUiz4W3A
X-Received: by 2002:a17:90b:164f:b0:3ac:9ed8:f310 with SMTP id 98e67ed59e1d1-3ae8984da7fmr16194172a91.49.1793838898693;
        Wed, 04 Nov 2026 16:34:58 -0800 (PST)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com. [74.125.82.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b326add7sm967823a91.8.2026.11.04.16.34.56
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:34:58 -0800 (PST)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3535a54bed9so1741824eec.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 16:34:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw9C/5MLAEf54WmiUOozcbH/yBcm0XFE3EQ37CEeTYsxLUdKCUZPKmpkWUmiDRgbTdml/a2wcn8MeUP@vger.kernel.org
X-Received: by 2002:a05:693c:42d3:b0:36a:1452:8dad with SMTP id
 5a478bee46e88-36a4244dbfcmr25290212eec.20.1793838896251; Wed, 04 Nov 2026
 16:34:56 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-1-a15965a49574@telaak.dev> <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
 <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
In-Reply-To: <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:34:44 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4RRuZcsObkF5r_bDacR3d0yjP4e6GWESksDPKHxK2u2g@mail.gmail.com>
X-Gm-Features: AclHuK-1vO168WRWmJd07mz7tA0jKpT7PGyfi_yQuj1AayEjOBkR4gYRSMoaS_A
Message-ID: <CAPY4CJ4RRuZcsObkF5r_bDacR3d0yjP4e6GWESksDPKHxK2u2g@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Siflower SF19A2890 GMAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chuanhong Guo <gch981213@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> They are the values the vendor bootloader programs, and I checked them
> against the hardware.

Correction: they are the board's factory calibration, stored in its
factory partition as 17 and 10 steps; the vendor bootloader leaves 23
steps in both, also inside the measured windows. The rest stands.

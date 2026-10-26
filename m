Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048745;
	b=M2uioRzQ0DrNS4lHX29s8jgRl4JUANy6l97kYjDi03BHz6ynM670i+gV7S9U2qx8C+bd
	 InugFZ5fdw2HP80m0MBrqJN4XZ9dIjbR6cxmVyHKGkh7htKE6WWxLppddWAJ1UkqkqhFA
	 pHg6tsriXplDSHKVa5XFoX8UU2XXuTx3zW75Sk+WG9xikVy9BtQ+DcscYL7ani8Kft8qb
	 Vq8sf1gakgehwnzL67Dy0xsA5PxT5iQlSwEy1PPEBpZsre6rXYZ/Krj5ipGnhLX2wyH67
	 jPBWjsSJM3kKU7IR48N7TbFYWXH/ogBJtBy5HThNeCpbqJ6OhF/u21Mma4ZiJ1LsTfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rD32K7ekISuMljF5aUzSzqVha+tq2S5F0ssjFpcpNiU=;
	b=CeOdvCfbXocF+p58pxwCpUZtcq4HqbdtdPOY/0xaxweNob8sWPs26VAjCFAvFX1bwN/5
	 e00wn0xUZy9754/paE58GP0jo5yL51y4NL4lWX+2Z8KKBzwu9CGPvMHR/+Bb7zamKHVnz
	 Vbsc6k2IfEOH+lVi7ILnt8coA2k1SHyrM8V6gqMxw0p+lU+nXLv+4+H5RxkRv6S3wLgSa
	 J1WBEUF6iWY31GMsaOx96BY82+KGlYMQacD7gvNzPeitGPm/CLD9ZvmQ6+4M+/YL4Qmdl
	 Us5jLdvLqDPs/X8s73OFZ+XrQBgpjO7Ry+3Kk6dBTTdY+DC/oh4XbZLSzZblq4QjhGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A76606A31E
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 21:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32A76606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso35219205e9.3
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 14:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1793048743; x=1793653543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rD32K7ekISuMljF5aUzSzqVha+tq2S5F0ssjFpcpNiU=;
        b=x/O1osm5M7zxTA9jZpysosF+ofFJypdYJ1I154osDWAjKnFrYbUbVVNIvJGGGKAcC2
         In0OXi44NjS3dGcRnDU0whIn+6EZR/bQz0DDCiPpWnkBnrmwKu+yLlf2i765eSxk7t2+
         IvNVOfNN/tpz7PoFpKap5Zk/YOyaSnEp2YjoSxsu5guic+vpAou1T5ajAGW2TqWBUW+5
         OVp2DSxhu9xgSSBJB7r2mxQrM62IXSAf9i/dahZ0qh8bZ18Sj9L5FnA0JGltkWcSfEnj
         Tl1/BvDhhVig8/XdIUgu3ceScuqAvT1KSRZtHBUSlq5/JzFG3p5V9adFW46sMwtBhNdY
         bEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048743; x=1793653543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rD32K7ekISuMljF5aUzSzqVha+tq2S5F0ssjFpcpNiU=;
        b=BskBT6VolX4XYCLsHmwCQy4qMOotPFGqXGJem+X63m9/P3uQqBim/GBXUVaWfgRYNX
         QEFaGpRI5yA7IzD3bzqCb5y+BaQ2x+zEiZJ+eVBhuaK6l8kWfUcHqeCeYVs4ufAIBuPa
         gi+OBTcDqZXhv/ZYKffwm3FBZ5x9FjJcfi/sprwQtEitnnRr/jC0pnlL7t7C5nnGl+CI
         LgwZ7NdFq7Pt/kfusqii46CX3xhiQcMaxlap+nFu+p0ci6T55MEwm9wX0lDGTLr7RADw
         4C9xLESBAX3/0WIAZcP3qqrpIyjWE++cunXNv3wK7b3IYiZi5evD/xslMO/ZcDZiyylL
         EL/w==
X-Forwarded-Encrypted: i=1; AKwUvByagAmEXOQeaKVEQvQpaiWqLtcmhf5clAlEB1wivLAy3qhQaoblCkACw71bf7POG3HxvynSvO7fo51I@vger.kernel.org
X-Gm-Message-State: AFq9FYJgm876qFavOo75kv6DYDzWJqtpigpH8/HINYP6pEKjzaNb3kEK
	vlSkU6MA9H28HIyGXwPi6WhALLAFxRLfP332sy4LIOHbLkdfnrYONQEAtchzfzFcPtM=
X-Gm-Gg: AYBFou3RINNl8k82vOH7RVu4+oANpLzBWgc6NTGbhIYcEyvuq1oqd+HQGFx9A1zaHN8
	sBEXGzF6WGQrrQEpxDYfAfE0bcuzAENAmKoCfhz7oPBLElgHbPNo/gnGFeSsjQonwKUomL0FzUK
	6bDfy28ty9/SLFecquND5ZJMjPYKvCvnPVd5HKsPYTTLUr2y+yr8ayAs80+BR0q3bgcM/G1MVGA
	KxDZDLjFpZ79vgCHmc6zrFnY0WYH14pfJb+3FO+x/P11NyAnJprlcS993HH5zHX7D7JB0Rm76Nz
	zv7fpJWxWTm58OCN/2B54l02xWSG1RY0e172tZYYc2tmchQ1TqVXYdLBGMa7iyixW9Cr9HgfYaf
	nbOoAoOAgXNgYLU9tH3p6dPZ8swYQidhHsPVzyJT1E5PDI79qUIOo/qENcfT3JpABAdLZTmbfcN
	35XV20HjRC8CNKQz0HlnIupARvsVjXY4rizkjOSUdvnSu5HPubfUW6KjZdDTZtF9EQTZF2OuF8N
	560A2dE+q6MUpjnKk22P3YjDRZ1jvgfhwxBjM55BKhcoyPEEMFNrG0tdHQm1aIH3LvwcWa9H9fX
	tk/FgKVU5/m2
X-Received: by 2002:a05:600c:3114:b0:49d:34:420d with SMTP id 5b1f17b1804b1-4a35acc7716mr138556935e9.20.1793048743445;
        Mon, 26 Oct 2026 14:05:43 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:258e:715a:5648:ed59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm258646975e9.1.2026.10.26.14.05.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 14:05:42 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Paul Cercueil <paul@crapouillou.net>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Matt Fleming <matt@console-pimps.org>,
	stable@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mmc: jz4740: Remove the host before resetting the controller
Date: Mon, 26 Oct 2026 22:04:27 +0100
Message-ID: <20261026210427.14728-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <48976ce134e26877200e8e1ef8d3f5c66f4fdcf6.camel@crapouillou.net>
References: <20261026083323.12301-1-olivier@mgcrea.io> <48976ce134e26877200e8e1ef8d3f5c66f4fdcf6.camel@crapouillou.net>
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

Hi Paul,

Right, my miss, adding stable now.

Ulf, could you add

Cc: stable@vger.kernel.org

when applying? Or I can send a v2 with it after -rc1 if you prefer,

Thanks,
Olivier

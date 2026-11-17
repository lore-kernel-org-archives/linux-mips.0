Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794878277;
	b=MkEl6BhtRW1f4EkatLID1M7q8IhOm7pMgVS80Vl7e1bSKBPpMyPq/4M4p1tQHHhYhQlU
	 nh+OIynDxMiOdoa7lIW4KzF6lHdzs8Y4YnXbtXupJw2AphMAzSYQEM/u4aWqUUgsTOxDo
	 icAQNmuDGBjz0TBXu5imFldDAi31UWVjHEIkyncwaf1/sfp4rB3bKjrZjW/NGQK+8KcAv
	 HI+ABz7eGAmODZl5IvspZoPzyy2p96hRgAGbDbwCwUV7DuA7kXTQL+d3gufSeD2fy5BVH
	 6sL/moo3BsSSVbhZIcPGLUvm9EbQDs4reJwpGrRmRXQwvbjOySEALWAsbSIrLkxlDCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=/DUl5nkubottrq+DmlqmVS5vhvOiDyY993sZh0Q2i6w=;
	b=YCcJIeZlvcTwVnVIOpDiTLS3tWHgDVAVMAP+QZ5KdzxleA7lL5z68/0o2D+Ag5lWD2Qg
	 1Uv7uA5bf2H1NjhdUynBHsmUxkWcizpxBFLkBXpkJeZJKVJcj/fhKYUi0Aqxv/JFjkrL6
	 KfjwkBvKnKFmog8LLf8qkM7ZVKRGi9HOCMcM/HAHJ45CyqRHkC3FvpYNEA3p+6+btn9G0
	 rwEoYh/+qmYITbbGjBWwU2fXEL8YuZyfSqYSRNd2BkOIrwiL0AYDOs8BdlmL3h2GT0ibn
	 d/Te9rINuoaQermmQcXQRRYFmsX7O7E7lbN5DBWKqdxf+X7Amh1aGMbdleu/34ES3tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P4YS2TRG;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E16C606A31C
	for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 01:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E16C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P4YS2TRG
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38133db970bso607509eec.0
        for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 17:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794878277; x=1795483077; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DUl5nkubottrq+DmlqmVS5vhvOiDyY993sZh0Q2i6w=;
        b=P4YS2TRGiYo+OE7Dv4hYMsPhD9R6X+IqEgqM1bI5izV7LBwohPF+81z9NiZdW67eJ1
         m7XeaVnppGN5G37RPH6T4BqsCep6GsYY0TuTU10oc53Hump2xMM+VTdc27Tb5RgdLCPV
         4+oL3WKazs1Amc+QYAp8rat3K7noIPd3NgTpasLSxWs7gpJofGMod6+CRuYQrn6DVHH2
         7vd8KdTZDK5fV3vLSUu9lYdH9ooZce6ooqD9KXYv4KUb/oPqMtZ7K6h2QG1pWwRkYu3w
         yku/uBmh7c6dXXJL6vgz+3VLjVaI/ShTyQT1+bs+4CNxmdDRq4Mc7GZ77BBRZ0dmRWKB
         +zAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794878277; x=1795483077;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DUl5nkubottrq+DmlqmVS5vhvOiDyY993sZh0Q2i6w=;
        b=VHUiaKxT+S5za6J1Q+pZyDj/b0Y8VWk38qy30Byo9H/rlmy/5Ef4jqr6lFF1V+CwdU
         5MGPilgANFnOAkz9TBpjY9T834vxGQ6u/+HyTWhpipo+LTMVgsxlUwvUtEahLWCZkUdf
         Pdi3lh6XxblqcH3ZjX9Avu8vgay6LNVFpqDkIUBbKZDatN9j9ZMs9/AQlU/IkhrQEZpc
         W1nlYkUE4YHqmTXJxCPz+RA3TagqFrRiLl+XLzfG+6u3oeDnMUJt+e06dFJoCvTWggsc
         KcD+D7CSEhEHrUy/yDrnlBC1lF7lAoJBqjeA21aBV4/ooGd/oPxcRytETXiC/AEgoKyn
         bWvw==
X-Forwarded-Encrypted: i=1; AL+hErGs3Xf2t14qx+arqB7ToAV6IgEUzLrAMBpbd0zv0kl9ai40GVU39p71hBVQxbnMZKPTnjH80qi+OKdC@vger.kernel.org
X-Gm-Message-State: APuU4Z8AkAcZliCGIYDVy7p/IJRkGnomIfPqVvehDhQZ6Ky/mXVlGdLP
	bytCEykhbwUNT9F/lbn+q29AZ6EITqC5qV/CacTHK02ugR2UsyDjLF5d
X-Gm-Gg: AZFdTZdjrIP+q3OATAsPVm7YTDGHipZo0VAfliV+AHXomZ5LSSX9xXOz5i4d4lRWokF
	vvufJ4L7Q1Fczf36iRU8RONWgLQnQipNcqNnM0j1JZ1cI6KfY674kz/eZyXJSX4DzNgz+kaM45M
	y+v0/7rb01uM2A0oTKcS5PGf8+v056IoD1YSBd1j2CktG0T4WNgSB902Q4nJZO0FDGtrNiOd6Wr
	9gXBWXBUnCVnWhe/8gwuSb70p9ZarKguJUVMqwOdcfEEywCGU1rkFIk8buMQ5FPoXmBPZI81Hpt
	dIHOvTCIhSMMZLtcnPIMR3hnp8ceB3ic4veVj4nPeDOACmCISolBWT8zOcjWOEUWoxLgXgIjIdW
	SCwZ8K+dSLFG6eOFinHfbGhBZb8QV9dVjna82AJ3aivk09HGBOQrbPC68VMtmk1Ym7NDvp4lius
	/wXfqFt1uXGApfW7c8j1uvyDZaU4M2e430wJXDTS1c8jxzpkfxDKTtGlIlrL866N20MO+d/t7XB
	vxdSrtpzIT/5//3VUx4RR3r+PTMtFW7M98sfZID9hFjPcQa5nvqedYTkSaGMrhhJlOODkAsZDAD
	Xa/rde8FBwBD3SC1Ds3xVyw3GnZ7MaP++T8WzGsHmjoTO7PfMbTcNNSWf8Wkk/J8FupqoHe2ADj
	ew3po
X-Received: by 2002:a05:7300:540f:b0:380:c3d7:c263 with SMTP id 5a478bee46e88-380c3d7c590mr2579893eec.5.1794878276258;
        Mon, 16 Nov 2026 17:17:56 -0800 (PST)
Received: from smalls.localdomain (ip-198-145-71-161.az.bambroadband.net. [198.145.71.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm36639201eec.22.2026.11.16.17.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 17:17:55 -0800 (PST)
From: Hunter Laux <hunterlaux@gmail.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 letux-kernel@openphoenux.org
Subject: Re: [PATCH 3/3] pinctrl: ingenic: Add X2600 pin groups and functions
In-Reply-To:
 <afd42cc2ca2c93501ff1769b7d7a25559ef68a2f.1794557697.git.hns@goldelico.com>
References: <cover.1794557697.git.hns@goldelico.com>
 <afd42cc2ca2c93501ff1769b7d7a25559ef68a2f.1794557697.git.hns@goldelico.com>
Date: Mon, 16 Nov 2026 18:17:55 -0700
Message-ID: <179487827555.2153459.1199232821591145638@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Nikolaus,

On Fri, Nov 13, 2026 at 09:14:58AM +0100, H. Nikolaus Schaller wrote:
> +	INGENIC_PIN_GROUP("uart1-data-c", x2600_uart1_data_c, 1),
> +	INGENIC_PIN_GROUP("uart2-data", x2600_uart2_data, 1),
> +	INGENIC_PIN_GROUP("uart4-data-b", x2600_uart4_data_b, 2),
> +	INGENIC_PIN_GROUP("uart5-data-b", x2600_uart5_data_b, 2),

Per the X2600 PM, shouldn't these be 2, 0, 1 and 1?

> +static int x2600_slcd_ctrl_pins[] = {
> +	0x34, 0x3c, 0x3d, 0x3e, 0x3f,
> +};

PB20 (0x34) has no function 1. Did this come from the X2000 table?
Should 0x34 be dropped?

> +	INGENIC_PIN_GROUP("pcm", x2600_pcm, 3),
[...]
> +	INGENIC_PIN_GROUP("pwm11", x2600_pwm11, 0),
> +	INGENIC_PIN_GROUP("pwm12", x2600_pwm12, 0),
> +	INGENIC_PIN_GROUP("pwm13", x2600_pwm13, 0),
> +	INGENIC_PIN_GROUP("pwm14", x2600_pwm14, 0),
> +	INGENIC_PIN_GROUP("pwm15", x2600_pwm15, 0),
> +	INGENIC_PIN_GROUP("pwm-trig-c", x2600_pwm_trig_c, 1),
> +	INGENIC_PIN_GROUP("pwm-trig-d", x2600_pwm_trig_d, 1),
[...]
> +	INGENIC_PIN_GROUP("wait", x2600_wait, 3),

These groups aren't in any function.

> +	0x000007ff, 0xffffffff, 0x7ffbfff, 0x0000ffff, 0x000ffffe,
[...]
> +	0x000007ff, 0xffffffff, 0x01ffff1, 0x0001e000, 0x000fffff,

Port C is missing a digit?

On port E, 0x80 is pull enable and 0x90 selects up/down (PEPE/PEPS).
Doesn't that make the X2000 pull code wrong there?

Hunter

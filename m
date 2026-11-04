Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799450;
	b=TGaHHz0osZym6Etk//kfllScGSostexyigjTl3CsPwDWnaKQcZuuxZhY5P4Gn1iVCOkQ
	 URtfWcxj+tdPMvm7fsw3tLrlYExX6dTYC8Yy8Z8UIavhE1GdkWxYr/2Hrqbuq8qyqs3RO
	 /PGzgYijgz/HkTrcKS91b9j+AvT1fBxY3sIEgfuhJCiMW4UkGToceEBsZ1AGgfX23Uml5
	 bfOpQ9rtI41+vEg6Kf8I7HyLzEfWkX5dh+5BvziYHh4nl+iJ+G5soOi0aJxhx45SPKBfx
	 7Deuk2anfdFw+TpljXwHvdeshk3rGc1F/rrTLgnRr2YC8C9l8ZUXUP0OQ2SnNRYA7VQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dTyqhH9cJxVsqLc2y1LUsJWE4gN77K97C9Wv2c9HyzE=;
	b=n+Bcx5AzUTBUa6nybM6Kg8NWc2le9POUcqwh7frIG5twSQ16t0sF01yrkZVvvNTYP8XT
	 tCpWSNdTMrFRfui5IY37JMUNxrLxIDz3Rv5rPxw18sgLNPL/PqdK1jaJAMrjI+TjraZua
	 fUpnKxeHa0M9Ov8KMNo4n6SXE+k1SaV6pPgWWFnfRt5tH38FelSdCqYuBQm1WhdBAevfG
	 R63DuouEe7ukso52f/xxpHryfUHD5l6GFdvlT8+jA8h/jZ6bKbCy2RD33cpHeuoyh8imz
	 Nk0AHqotunNdH/sL2Fe1KVBI7fy/wlKrXkANTr2hcwrsdTzogP3leyW39zUWld4RPIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HbJKKYLo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1BE606A329
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 13:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE1BE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HbJKKYLo
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8470d7d430fso273052a34.3
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 05:37:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793799449; cv=none;
        d=google.com; s=arc-20260327;
        b=PoY/VGL8fqNOnI8RWZPuTjpx9YTL2ujeHyhjkCYeAivi1pszyobN9UF5e26MZqMwYM
         cImQr0CWVV1PHlG0/s648wr7Jw1dhcjmk5p9VRHt8Wfoi2cyY2vgO8eHV+pSxPetuTQV
         HIlHN8ydmQWiGZ8g8CkXSxXqWKnAsyz6gzPzWNeOx3hke/3svCDRACF1TvVyoODaMHSi
         IGHBWL1r4D35UGhWh2+BZyPvn7GakzHYn7c9SO2EJVaI1qeHlknJMqkqmnANnQzGZGmr
         cambPldQ6aNnZEfP3vznkrxly5OGN6RMw3hoV0VNocjV8JTkRlztKY3uZOqwSQTQkZln
         i1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dTyqhH9cJxVsqLc2y1LUsJWE4gN77K97C9Wv2c9HyzE=;
        fh=Z80yXfta8sQ9WageRht51Xwe/qQx/wf4kG3g5gtGBT8=;
        b=JlFopE/8e7HKDOQ13LfEC0P+VkczGgMAfnE+ZLzt1XCfsIMYX1ir1D+SMEgZUdEv6X
         zz9VEPd1VpbAjGHpuCfdy8A8lN95DxscxDq4V/T0ikdVkZT7qTqpAyWwyUireqBB97q+
         HYDn9AS40qthhFpevuLbU0+/P5OMp+Qsc95XdiRlzSL4s2yBG6J7vzxCrEqErGBl6bO+
         ezLHHK2O4BIrzDtGulm1Zq0o8zgOkyNkDCSjyvGih2zqdxy6DQhgmStDw/yntQEFV0kL
         PeVys2SqrSQnE8qqEMtp4Jnt6Yl3ZXrHKVWe/Rogno6rYZ14RCpr6hvedM4caGdm0p+U
         Z88Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799449; x=1794404249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dTyqhH9cJxVsqLc2y1LUsJWE4gN77K97C9Wv2c9HyzE=;
        b=HbJKKYLoRFTbv88+u68atuiDsGsfEkhGD9eTclvuReNcQP7HDpMEPxVstZpud3wUT6
         md2aFf7Jl64Aqg2kr+73B+6+DSf7K3bLWhJo2zrkqk3pqlIOsIe9A5YSq6/f+UixpVjh
         VRGj/VMu4gDKqlk+/zOSkVxDRi+cM3RrjL8MChQV+8pukxf7tOoKwoPrgN0KaLN3/Xqh
         kq6Z4jqJwJb44vLVtS61kwDPbUN62SiGYDeByPHe4MWzzGtGKyBbmt1WBYpY8S8p/OSP
         kyeRQA0DrCZ2eFtyujgQ1eNKJGAaCSgkM9/8eaW/Sa5cyU8h/0N2xH4wH1qcQKuV0PSu
         uM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799449; x=1794404249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTyqhH9cJxVsqLc2y1LUsJWE4gN77K97C9Wv2c9HyzE=;
        b=u1PwPoSu7oEBv47jAJsrjUNn5CDfms1fwcR8MP6S6SrPDzu0WhCkx31LKRG3756+wK
         PxBc+je5CzS07hbgPptSz0olEoETRiiAasgXmWzWbvboxYZhmaac2T4bnrZVK7ch7lKe
         cAtus9urxQP4iNWorU4paDFnD+XapPjdjma5VITxdDoYvND6wCX5fyruIIMVp5DY2qt/
         HlQLOaQjNzIFpCsglk+TDy8rZ7OTjXOwXd9TkeHGCMjTbH8NVTWSz4drV1d9JS1+cZvB
         D0V4XNzAgGtCfUCHCxYe5LCKvBzsUEAlLWVnkIUW8dmbPyZoLBrx3sDo+MSlYK1KUqoT
         12Ug==
X-Forwarded-Encrypted: i=1; AKwUvBw66Ocean4TCFiSRM32LSsqQziku7/Vl4FfzDC+LcORF5TTupJVMozi2pXx/Rrz4OjokpmWKcPoF6dB@vger.kernel.org
X-Gm-Message-State: APuU4Z/eBduiZAOskaFvenfIgsfAEpAotrEaNiRgCvWawVMwv87VhCQT
	8Yh7hwNWIaG6VNb68VhiveiAjBOq3HeEtFipK4zmISkVDEPo/F9rSKhY1u5YAZQAYzlMjI9Ycwq
	JThqbpeRwYOSLG4F+IWYq/IfNeThxfoY=
X-Gm-Gg: AYBFou1GTynnMW0kI7byhBS5gc2uWa0FplGJz1jXhM8dZZLEWdqkUVJ9p0rr6/xT21a
	HbbfRiUdUP1K38iKMAzxETI7UjEbApF1n3JkLgpj6YXDNZ0gY3OCKh98iQ0e9uh06NabphWi3et
	M9GBKW1DUWKXSWGCJGItEhZ/OqW4yNK4AVPuvCFjROFOPwTOEpEZvR3PJoEYuUKaY2veQDN1Pm5
	IvuFb0lof9uOoHoC4+htvKIjiHNZtDWpJuELKsmGPbjyefa0aG2O1vdcZqfUI02gWPkAnhTvxgs
	O4b4o77S3GMDRaAwD2CmnF+rwlenxY6ky3UrKOZrqmdbFeHwGTKgPkFygUBvGV9sFK23A6VLceJ
	umX1g33suoT24pvdkNKpP5cQrQtqGTBifV0zcEHmlFn1VtOGKuDwjcrkqsfRN675ZRhhPLdK5VS
	4t2f77
X-Received: by 2002:a05:6830:2a8e:b0:843:ed9d:1535 with SMTP id
 46e09a7af769-85eeebf194dmr2565221a34.19.1793799448718; Wed, 04 Nov 2026
 05:37:28 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev> <e4474a7501c9e2a355dcc80d632bcfa10e1959e8.camel@pengutronix.de>
In-Reply-To: <e4474a7501c9e2a355dcc80d632bcfa10e1959e8.camel@pengutronix.de>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 4 Nov 2026 21:37:17 +0800
X-Gm-Features: AclHuK8-JeRODUOUq-HqZqaALo40tyoUFGXYArDC07Ims6VRBqfkF1PB6rfGKec
Message-ID: <CAJsYDV+PSoAU9qNyRoEKuFoc4oeBkw8b=vdcCap4Mx3dCA1kAw@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: joseph@telaak.dev, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yao Zi <me@ziyao.cc>, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Wed, Nov 4, 2026 at 5:25=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.d=
e> wrote:
> [...]
> > +
> > +static const u32 sf19a2890_gmac_resets[] =3D { GENMASK(1, 0) };
>
> Are these two bits separate resets? Are they individually controllable?
> Why are they bundled into a single reset_control like this? The commit
> message doesn't explain.

These are reset lines from the same IP block for different clock domains.
They have to be asserted together even though there are two lines.
See nUARTRST in [1] for an example of PL011.
The gmac lines are for two sides of the same async axi bridge.
Asserting them separately causes a bus lockup.

[1] https://support.arm.com/documentation/ddi0183/g/signal-descriptions/on-=
chip-signals
--=20
Regards,
Chuanhong Guo

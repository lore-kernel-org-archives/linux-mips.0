Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.161.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793799154;
	b=rphG/X1H6412xDVmOgt5tpPG0s7fVnh4AM2brz1B5w58sDBFw5xDMnjBawm/V4zJWm9F
	 q/EK7nZdRar5frOgO/SXiFJwe5Y0s1rlJbWTKZZLeroYxcaxTvKnifaWxvRfjUA+KzqHi
	 5MK4nvIzrWDiidxL6zuSbSk87mFBf9dgHm3a0H2DA1GNu74abULI8ZUlNH2PKqy8EoeDk
	 sWks6utbicdwGfUoGDvqMif91SUIX1sVIQsVF5DnmhT4DxfrWnGJaCbB9x+mL9iLZON5v
	 /ydnBwkRYRKQiUuiGsEEWchZa2lTQiUktJxRAb3K2Z5w8P7Rmjov+0i4rS9pRBiwlnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=flt7oH/ETh3Es2fb8h9unV+oYzs4yKusapEzarwUpgQ=;
	b=3BSkB/BLtVTp0A0Iyspd78Jpfj0Y4pcQ8bUBA5OZlG8SHjU4wENepz4PoOwYuvfZju0b
	 aBd+nJtaB+JCVU2oQ/bQh6t/TbHTGk/OimTImTN/arbBX1YHkCNtE2R9uxw4sjeSnshoV
	 mneQmPQfzxZ/dwrBq8iB/GYosCqo++0yjkHheFXPc0hTdp/zC2mKAH3Z1w5OGSB9qCR92
	 eVV7klV0gM4CQQ8gVy45aPXkjxFhnbBBXnglXBK2/Dq80ARqupR3VQHKMxyuz432HaBB7
	 1WOvT4B/zsU9jz9m6mvKPl2fChwDQ+Sr417dFsd06j0agZ3MlHvwx8vQWxif6y+JH4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qy9pS4bp;
	arc=fail smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4C2606A32D
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 13:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD4C2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qy9pS4bp
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6d290b10a35so283202eaf.2
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 05:32:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793799153; cv=none;
        d=google.com; s=arc-20260327;
        b=Xv5pEdNTA7jcxAj0YPe8X7yB0vEhxrkJRZDI3BlAYHtoIFJgi0FZZiHzcN+zWKf8Ht
         V2yRMRJ4OHWWhOwxNsTBzfoKGb/vEz2rTQAgPRc/UVyGfcDzbTg7gsBlcN9O/alQ1SnA
         swuxUKUPjNpHmLLrkrNgWPdIjL0g2T1TZTs6nAfyr9HRhsJeL/J9C68YHt4PoB1YWcFL
         bB3+bmbbeN+jvLmMy4Rw4PQ3DZq0kLSufpbCAfzTkwTC46+unTvXGJg//9hGD3isdu7g
         Be1U7fVuO9363vHFTVx2GJKs6ep+FhbYh9Nliw6zgUPyCKI1LU9FH6qKtKzW6KAp41vM
         mdyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=flt7oH/ETh3Es2fb8h9unV+oYzs4yKusapEzarwUpgQ=;
        fh=0eLH80NB7lEnqgxTeQfkedNgMjxnzxNQ1lC/NhjoyX0=;
        b=OtcOEphIMC1Yy35CCEDFsBDEdnasaGSfvl/KPL2FhVskU8zWe/oBau3/JUOEUzIj3k
         EZvVtPZmJq+yH9lzOFU39JLL4Zvb9VCleyntH34WCm/cNTIQNYBwZ9jMoLTx+Pllkr+u
         +tIoGZXCfhTLq56Ep30t2O7z3ZWBYeUM9mysJ23PWVgGNDVT37Se1yfNXx9y9LZJa9bF
         S61pXLLC+ZcbznwSzb5a6zHTI4oikbEo96m9j8FDS1fviH6vq0/2WMTc+LiZNZxN61/n
         jFCBRrzmEjCU0pXMADBpf1JeOuMiLz0LDpQXY1qellozNHgd1RbRGotPYCvqNgd4+tyN
         tH+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799153; x=1794403953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=flt7oH/ETh3Es2fb8h9unV+oYzs4yKusapEzarwUpgQ=;
        b=qy9pS4bprOjTsWRvlH9jkM15Jb6X9A27TdRPIVsM3h3dXuLNkrkluEELmjTLBM+V3P
         ncmegftrX1Jbf48M/GIiWSkyr9c2afUzcpyDNVJUxw2kErAFuFuiYBM0d4r2Z2WVe8/P
         mryc8gKuoM+SPz7kBRJsT3vcNUF1prKGEyid+vyji8hwjKqA/XununEaEOmNqxRbF7Ik
         Ay6P0FIY9Xe7oHKlx6qraSAP9Dbjx59WRcXWsOznu+IpcBB6lS5xl7kIb0TV6bN2rGXy
         D2jjv2adUgO9gp2wR1eQZMN2kZBuWpiOMzIW4Nth+vi0fpGicG3Y+McnpRkp2x+TqdRj
         /FeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799153; x=1794403953;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=flt7oH/ETh3Es2fb8h9unV+oYzs4yKusapEzarwUpgQ=;
        b=ybmx6EB2i1dErXj7E+fpfewAFO/+1eY41Sd9ufQzfzzUJNu+yESNUDpjwp03puLBcZ
         ok+n6nJWK3yjoCCxdQUXHyrbIYwIIphICLEA/8OxcWEZ5n1QERre8xYhdvEYmBKomSq+
         xKQuAoW5DY/XIdKOTczDracZn74SYa5PXEUmdCiYEpCohpX2kRmpNO8ktdr+M9F/UXPY
         yO/3ppAjy+7R0CJlskUJq9MNbd38YV1ONUjqgPghMvEAym6waPTkDIv0XVE17EeN/6Ss
         WW2NH2rPffk4hqO//jWAt6g9B/pluysg2xhcV4ayjYkG7UxnhUndsOmvvIAqRhcFGP1b
         DOkg==
X-Forwarded-Encrypted: i=1; AKwUvBzWvI2SQypUvBLu8y1LK4PLM6PgdyOU9dzFM36zkO3tlx9Qk2cFizwK/ePjQFy/S6RVYr5Wu+mn+Zjl@vger.kernel.org
X-Gm-Message-State: APuU4Z82y+TJOL/EIYdBwHivAyR+Qau0r+H1TjKHjeza9gtBTrhnoSR1
	vh99PMTZikySt+D/wMmiJ5EBzbg1JXQXdYq3Menl0gg6+049VDYry1+psbvf/Ve9YVACGMdfxEh
	SkQbkiWvgo1gZZqcx4TJwziFi2AOQkiw=
X-Gm-Gg: AYBFou2hBVRrZV07Wq9jHHvbo7LHbBJGd/+dNTq1pURer4sXXRRTZY+ZQCBWjpb0rmM
	Dz5Se144gR/f30YKcmIDi+7ImDhLyhEbuIuCstu3AyFnr2aO8WiV+A/2tfrJSwaYIWzQDBhc4vf
	IdhwtyinhJaZy5j5Y1HqF7mupTsituaoS+Igv1w2UsAKB4wvHUTGPk8KkGJSJGcfPE8FBKIQoV6
	yx5gn32aXW0i9FUzMMTeTWb5oKPdglnnq6+1EC+ZFjHHi/UkKG5qU+Yg8jnukW60h/D3DNjDmW/
	dYFhx9494RCVLp5OlNC8gN8D1g9q4L/xrUvF8d3+yNSveI03oN966TGFwHKcrtluHYNansSLtSa
	dlBP/+C2At4LS8Hcx/BiYXLBf5yGCLMubhT9gL4Bjeb8scRGQ+6t4Ym5a3wdOTQ==
X-Received: by 2002:a05:6820:55d4:10b0:712:c3fb:b4dd with SMTP id
 006d021491bc7-714f2a07b44mr6865589eaf.58.1793799152650; Wed, 04 Nov 2026
 05:32:32 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev> <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>
In-Reply-To: <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 4 Nov 2026 21:32:20 +0800
X-Gm-Features: AclHuK9KjWGPhCZrdzN2zSc99IwcSQrcSlYV4KRQtVdLRgeo4bHU_zFbKSD1vFk
Message-ID: <CAJsYDVJ+FWHJ9AaJCmQwwfdsVJJC5mPw-fXzr2n6OAsZFHJbEA@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: joseph@telaak.dev
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Yao Zi <me@ziyao.cc>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:21=E2=80=AFPM Joseph Telaak via B4 Relay
<devnull+joseph.telaak.dev@kernel.org> wrote:
>
> From: Chuanhong Guo <gch981213@gmail.com>
>
> Add a platform driver for the peripheral clock and reset manager (CRM)
> block found on Siflower SF19A2890 and compatible SoCs.
>
> Each CRM block manages a group of APB peripherals through three registers=
:
> a reset register, a clock gate register, and a shared Bus Output Enable
> (BOE) register that must be asserted for any peripheral in the block to
> respond to bus transactions.
>
> The driver registers a clock gate controller and a reset controller from
> a single DT node. A shared spinlock protects all read-modify-write
> accesses across both. BOE is managed automatically: asserted when the
> first clock gate is enabled and deasserted when the last one is disabled.
>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [jt: from Chuanhong's siflower-7.1 branch; one compatible per block with
>  its gate bits, critical gates and reset masks in tables here instead of
>  the siflower,valid-gates, siflower,critical-gates, siflower,reset-masks
>  and siflower,num-resets properties

Why? This block is one used repeatedly inside this SoC and SF21,
I think a generic binding with clock & reset description in dt makes it
reusable without further changes and also results in a shorter driver
without a table. This table in driver aren't simplifying the dt bindings
anyway since it still needs one block per node.

--=20
Regards,
Chuanhong Guo

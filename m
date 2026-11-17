Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944961;
	b=RaGrf2GLn+srHe3VefQPrYNhqfoA9e+uBAn0D+mZoOzcs+ohwTcGFm9LrHd7nM0GLQ4s
	 BMWE/E901Tk5Vwvwiv8U1l+3zinWzhWSV/OjrzA8ZFrM6zI/LLW/mQ1QiOFJyAF6GuKB5
	 Kz9gVi4yGhlahCDhWFFlTdq2VyI13nM56Tz3/jPWTH3IKNt4HKS+kJ1U+GorgE+ZVpjRy
	 D5UvySE0hWED6kE1lrQHSGIQbJXKhEdEb7v+DwXToXLjX9Kjb/L2PcXBAFahHhSiXCPKK
	 2rpkZ7jXOTaTJy2asZRIXoYtuzotrHFr/GXCUFB6+0kbIt3zPUrKO2qNQ/tmcIcPy/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944961;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=dx7TBIE8Mp4LTw+L9asay8YhTgGHn7Srtn+pY/iE7EU=;
	b=2KHmEmn3bdmAWbc94PlT+76L5pfb3uKYwQ5cNbjmvJSszRjBhXEeqUQQkJJcb5Bs9TG2
	 G5RTcpTbAcOfcJ4GkiGiJRKf3XoIRUCmxmN66nJdEco7zhWKfuzWrIT4F6I1lupMjI+FQ
	 hjiT5tk50Y85U8NbejSFq36t6KzWw4XGudZfx8EniHHVelduIhjCMbpQJ9mru7PDHzd1W
	 aF2Kz1Ikj79sd1+CcV4UMzPLviI/jukctkZXaRwQLddsIxAB82FevW4Wbpd2N6V790eU0
	 ysIAaa7g53wKVGPvsJx+ykXzL02NvNyfKlszH4X1tDyoOOEAR3cPx6vhA5AzUUPBuzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF11606A32C
	for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 19:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF11606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2efef1516b5so938835ad.3
        for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 11:49:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944960; x=1795549760;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dx7TBIE8Mp4LTw+L9asay8YhTgGHn7Srtn+pY/iE7EU=;
        b=kWFjoPuZWfti8COQugUmE7aF0xPJ036lHhPSh/n6J15x89kEqPT5utvkmfB9HYOKFX
         +riOCu3BWjsYOXK5M8JhtTqVXF1NGph00WiQVgfEbGk8L3fhGUqtYC8le1M9YYVKLvlX
         CpFIZfuUchh0jk/L39PonfnrH7UQ76rixjBXFjLHeyVsD49YmzbA+gEXCrpRb/HCyMmi
         6y3Ktt9gd/t4EB6YKVw3fLCwc0SIAVCCnJLbo2s+84j75dSCzEmZFSoYkdOa6DGQHJhh
         3y+BYpxLzLIRtfahkap8/1UF+S5oLD9C4dxXeVbH2HGCEv7TD/Xbd3JZK1LxNPzq5Zy+
         /ytg==
X-Forwarded-Encrypted: i=1; AL+hErEmiY+lw8QWyD03Ayx0JZYHo+r4aJJrQANEKuosIKrr4jJ1p7OJCZRYXAz7fbD8/uFvYcUuM+lyJ64l@vger.kernel.org
X-Gm-Message-State: APuU4Z95GZeC4YhmkE8c5qWrt6FtlfQrUIvpgWknfTT08Eoy3clsWSgt
	xogQa/6t0Ek5iRg9X1s0AJSDJvdfImRdxXoCB78/MVLQpKqOWPZyrtfsAhHgodoL
X-Gm-Gg: AZFdTZdDZEEC41AqnMpnlHh6LPssRZ9gE6AMYx2tQOmm+QLZmzTAgCt/KGXW1lWVaL5
	oxuuhVN4F/cFticrNqDngyErAC/ObsNrma1/0mqw3LrxQsyKTWCs6RP4cPK/hDwPUdXy4fVmbvz
	3qAPGKCacJrrR7BB9IHUUSVg51Ab/MUHBn+/n8V/UA0e+mFg6LzYQMLGGFyIEkjWbDTGuKR6tWq
	ejd1zJpP5mVf4inmXUygE1e6vtppBqm6qYll+afXp8MZaAiRwClv0iwmDpf6YvHqSHwiFyiqFtM
	VtJDDs452kzpfvCCCOz/ESQUNJEJozuABQxxTr2SJWRVaRby9JA/JRLX8olLIqStiwyWh41sh/c
	i3i8Tw2QFu0vLVOBJWNk74eK3hAZiyVuKK6HIZWFWFFRF8DmdPs5OLVFmLF92253SXr/24a6k5E
	R8Bge5oWJL4pv2wAbijiOTBc2SZOmUYeWybcjKb8/WQzs7QJfMXwR9d7aaVm9fsTYHS/oWlh5AQ
	E6usA0sLJLfNHb/uMZndK3h9XEOFuLJdEPOh1VHTZbqp4kLnUwQ0w6gsiOS+ZGqMhebxCL6ExFV
	byWDv/4LO5XTqHRWi7DtEsiSGF/mkUvRVnWADGkeORjRxm74qVYayR2vfthzO5TaCBPKiEa+jLj
	B3E2s1lnkrLgz/ilNEInLUihxsoCTh+w11zt7wgd/zOUn
X-Received: by 2002:a17:903:1a8b:b0:2e9:5507:b52c with SMTP id d9443c01a7336-2eff751f196mr3009675ad.34.1794944960100;
        Tue, 17 Nov 2026 11:49:20 -0800 (PST)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com. [74.125.82.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62d0068sm1915745ad.70.2026.11.17.11.49.19
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:49:19 -0800 (PST)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so584506eec.0
        for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 11:49:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGy4a3fblx1ZO6zNIjf9EyFWPAWID/RbWutIZG4JNxaLxAbEstoZASNN7pm7rjUtw0KBfw7bdTB59be@vger.kernel.org
X-Received: by 2002:a05:7300:e009:b0:370:a11f:dcb7 with SMTP id
 5a478bee46e88-3828161f1d8mr420423eec.41.1794944958852; Tue, 17 Nov 2026
 11:49:18 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-sf19a2890-gpio-v2-0-b885fbd84c4c@telaak.dev>
 <20261109-sf19a2890-gpio-v2-2-b885fbd84c4c@telaak.dev> <CAD++jLkGavE9jL_EbPB2iPH=Aa=4Vdwj4nvHgiauJtq-dbwKZQ@mail.gmail.com>
In-Reply-To: <CAD++jLkGavE9jL_EbPB2iPH=Aa=4Vdwj4nvHgiauJtq-dbwKZQ@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Tue, 17 Nov 2026 14:49:07 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ49c1g9t6teEK7zSnvig_iwNfa_yM6GP_WcJJkzQ0Oq9Q@mail.gmail.com>
X-Gm-Features: Aa3M54q2rRrfck_2znOo84tl7sC4Xfyn9RtGeBH_rlEOV0HSVp39Mi9qyquXGxc
Message-ID: <CAPY4CJ49c1g9t6teEK7zSnvig_iwNfa_yM6GP_WcJJkzQ0Oq9Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: Add Siflower GPIO controller driver
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 11:38:53AM +0100, Linus Walleij wrote:
> So this has one register per setting per GPIO line?

Yes. Each line has its own block of registers, 0x40 apart: input,
output, output enable, the interrupt masks, the interrupt status, the
trigger type and the two filter registers. Only the pending bits are
shared, in one register per group of 16 lines.

> This is ideally handled with select GPIO_REGMAP
> for gpio-regmap.c using regmap-mmio, see for example
> see for example gpio-mvebu.c that does this elegantly.

I'll move it to gpio-regmap on regmap-mmio in v3, with a
reg_mask_xlate() for the 0x40 stride and the debounce in its
set_config(). gpio-regmap doesn't set up a gpio_irq_chip, and there is
one parent interrupt per group of 16 lines, so the interrupts move to an
IRQ domain of the driver's own, as in gpio-rtd1625.

Thanks,
Joseph

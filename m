Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BC93AA4F9
	for <linux-mips@vger.kernel.org>; Mon, 25 May 2026 08:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699483; cv=none; b=iGVYpVLAormxyrQqhPfQLRibT38KfAsGFDz6lv5GcKOXV/7wIGcTkswA3Ja720qtFMD95LwmPuJJAqZ6DeFk09VLRDPDmdh2qtQ3fTVxEfQt3SMsOV6JlAlL9GMVBAmYMSZ8w8l3M6J+LUOD1gVVL+ZHeVBqFZSsG2/SEQNcYuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699483; c=relaxed/simple;
	bh=xXz/GYVV9QSNbeC/HxJ0KuDPx2s68Hc+e5zq10KEVeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oJhfU9NME2SdId/SEYFw2/BQmJd+JNg8w1ZbhSyCa2kNCspkr/a8HrbRy+00olFra/5e3FN5JJGcEjbmCtu2ZlNVPgsTGQ94TPHvPLVu2nYkNj9QgWiDHiEFnpyV+HQ6wzWi/hHSCGkZIgRmreL0w/jBmKm8vUOnEiUe7C9IWjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfeiRvvc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfeiRvvc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDEB41F00A3D
	for <linux-mips@vger.kernel.org>; Mon, 25 May 2026 08:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779699481;
	bh=xXz/GYVV9QSNbeC/HxJ0KuDPx2s68Hc+e5zq10KEVeM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EfeiRvvcJz6xWkXcu1Zqiy8BYqrrj2AB1npkpJYmOsp4ONmpqehWdlldS8DT9MWYa
	 80mgSUli4qxlQI+IMA8PfH31JrJCiFyMl8agCZoUaFcwSGqIwq+tp19/RVTGSQqIV7
	 owf81GQS4Y4smE9+RkXyW4nnuIw0TrT8Ed2pOubtt5ssW1ST4/FGd4VaA/xX2NZnDf
	 XfyigMuKJBQ1sQqlCQofTV6hj8hveITVkRtT0x017/2xFGStbn3vsL0CnGxEOtqGqY
	 97SsrAxumqIzrLOor+oMKR2zK7Edb4xCtnqFyfowEfGVw7Z5WQv349IEaid5hDmQFe
	 M6WfoC/+vcLnA==
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e5fe62fc87so2616270a34.1
        for <linux-mips@vger.kernel.org>; Mon, 25 May 2026 01:58:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+n5iV6h1oJMrajzByNWUEQip+iXftXSil5Fszn/4DsZEf4GYRdkUSyENucIIoGfj70dy5kvJ1oSQdC@vger.kernel.org
X-Gm-Message-State: AOJu0YwXHI4a9546ApcWONuKVomJ+1zqZruySCkUEF7EequNuEXv7KEt
	Xrdlkev+FbHauBJ4XSfhWZBETqhiByh0ICcBzV9kTrpcvc9gWD9kqayR240efDISkFoppiv1MJj
	xtN4/G6URsRJ7zkoPyiTLWMZ4csttMBI=
X-Received: by 2002:a05:6830:4985:b0:7d7:fb8c:3c29 with SMTP id
 46e09a7af769-7e5feeb63a7mr8912823a34.14.1779699481274; Mon, 25 May 2026
 01:58:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520183815.2510387-1-arnd@kernel.org> <20260520183815.2510387-3-arnd@kernel.org>
In-Reply-To: <20260520183815.2510387-3-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:57:44 +0200
X-Gmail-Original-Message-ID: <CAD++jLnYeh3GfEfNXfCYdcdg_j2RAU63TYewwaTx3tm0tM531w@mail.gmail.com>
X-Gm-Features: AVHnY4KW10_QvipgU3JqDhFdOUhRtRqnFXdZTNq6fk963CfrOH70VHOW3qgjj1k
Message-ID: <CAD++jLnYeh3GfEfNXfCYdcdg_j2RAU63TYewwaTx3tm0tM531w@mail.gmail.com>
Subject: Re: [PATCH 02/10] [v3] input: gpio-keys: make legacy gpiolib optional
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Christian Lamparter <chunkeey@googlemail.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-wireless@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 8:38=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Most users of gpio-keys and gpio-keys-polled use modern gpiolib
> interfaces, but there are still number of ancient sh, arm32 and x86
> machines that have never been converted.
>
> Add an #ifdef block for the parts of the driver that are only used on
> those legacy machines.
>
> The two Rohm PMIC drivers use a gpio-keys device without an actual GPIO,
> passing an IRQ number instead. In order to keep this working both with
> and with CONFIG_GPIOLIB_LEGACY, change the gpio-keys driver to ignore
> the gpio number if an IRQ is passed.
>
> Link: https://lore.kernel.org/all/b3c94552-c104-42e3-be15-7e8362e8039e@gm=
ail.com/
> Link: https://lore.kernel.org/all/afJXG4_rtaj3l2Dk@google.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799383;
	b=ebrDANE4p4I682YduXCPgtA54Fpwu3zsSFzpCEIy8xhDIVXNDmHMZ0CF2yy3MM/HyIIz
	 noP7e/EAmSuMgDS7dn0KJAAsXN0QxUUizmNL/bNc7GQD714cXu9h2cVFr/np9QaTcBTpT
	 AriGNfaB63N1Ax8W1rpywfl935L2AJl1whUdXGySzFpdbd5A7fidkBoiKQV7JAzrse19K
	 la2ICtCStwP5Y+oOh6xLqVY685KA7qu5rQc2ijdlCL3k6kbcRUwS5/+9wV4D5guu7Ghe1
	 hh1YQ2Lo/dIy2OgokUzdKZE2jFxS8mwuE1jxrG0bdyB8r7J5QfCy6pgPkBFxDBKGcLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799383;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1hljYAPcCiZEdzV6lTUsHkk6eQ4UAiZUWqjyMUm5zYo=;
	b=Lyxm8ttOMeaiBVTfQ67aa0NiDbnPg76yqI71p3eTQobjCY89UQOwUz7l28ZUv+yqgfr2
	 CBZNARxb7uFluA3coS0dP9VvOrokwefWfuyW7YpMFh5NXwt9SxrJBzR/vlXKXglDg0P+P
	 zuPq4zTygiIFwle6pIMiYUEwue+GV4ZwzRWEybLDRqJnnkNLAtyy5RsFwAd2oRTMFyEmk
	 f/Vyjozrk3Qc/RO8AcY6ZEbI1NHWee6LOMrnlsU2gPoaagZFBUsl44Wd6FgnhwcInrrJe
	 Pz60epccKmYlKuqpoUINqaArmHOrXrK7p3v5A/2T94xNjITcajMo6v9YxRGgKAH1FdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L7ayJxok;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6AB606A31B
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L7ayJxok
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685861F0093A
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 13:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799383;
	bh=1hljYAPcCiZEdzV6lTUsHkk6eQ4UAiZUWqjyMUm5zYo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=L7ayJxoknHfmzSsW4bsxnxf6wDzP3VLbkBDjeVeS7yw5+Q5jqmwgtnarJYTI2wTcG
	 LelrSbrhqVyWvMma5jFjn9ep30hlrxdvJkE64h7VlvWVc3dd82Aznkj8HeV5fFrOLc
	 JufP0E7YBEgWXVpCay9yQS8R63gTxPB6m3mN4lPnn8TPRDoWwV8IcYeb6p5/zhXnKY
	 Gl9AJMZbKP1/lPnD2J6IeZ6a2QcFuaaxzf/Vn41wP7o7zxTkHqyjtcu0O8KCxl/35Q
	 D43sU5L9kZln9JUBcideIjJ4/uB6ZlMmn1aQNmgCs/hamtp2GWOFzVZgToRVJQcC24
	 Kq7Gc1l7xIo/A==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso571673e87.2
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 05:36:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByvVxYp/jn9dCmovrHfcCwXKizL1eXN8B8Tqw3xoHps2HtagQArapGYyi9lD8ibou8inWJ9qj7EjYER@vger.kernel.org
X-Gm-Message-State: APuU4Z+T1ZYqFvCax5WHKQ9YT6kLMUw0pHcED6Lw7uFzMExhXuleoBvp
	8ohJQIySw3I6RWi06u4BQRVMfGRCkSzvClqdMHU5NskVPakCeWHZ5SDoSUhQrNqL3XUjbxUj166
	UY355ADE6WGzP5L3qBO88++Sqw5fXV4E=
X-Received: by 2002:a05:6512:68b:b0:5be:494a:f966 with SMTP id
 2adb3069b0e04-5bfd9571e12mr5446963e87.44.1793799382242; Wed, 04 Nov 2026
 05:36:22 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023204207.48277-1-olivier@mgcrea.io>
In-Reply-To: <20261023204207.48277-1-olivier@mgcrea.io>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:36:09 +0100
X-Gmail-Original-Message-ID: <CAD++jLnUz5StOgXDBg=+qk4vuNeTPXLWMFS4At4-10zxUGWeCg@mail.gmail.com>
X-Gm-Features: AclHuK8Br6Abn3u6QKR-oPrq0kq1mFspm9RRwGam09clbSBKp6bgXAIbayf0YeA
Message-ID: <CAD++jLnUz5StOgXDBg=+qk4vuNeTPXLWMFS4At4-10zxUGWeCg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: ingenic: Add X1600 groups for each I2S
 system clock
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 10:42=E2=80=AFPM Olivier Louvignes <olivier@mgcrea.=
io> wrote:

> The X1600 has a system clock (MCLK) pin for each direction: PB22 for
> receive, PB26 for transmit. "i2s-sysclk" takes both, which a board that
> only plays cannot use when PB22 has another job. Add "i2s-sysclk-rx" and
> "i2s-sysclk-tx" for one each.
>
> Used on a HiBy R1, which only plays and has an interrupt input on PB22:
> its DAC takes MCLK from "i2s-sysclk-tx".
>
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>

Patch applied!

Yours,
Linus Walleij

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4828A41DEE2
	for <linux-mips@vger.kernel.org>; Mon,  6 Jul 2026 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331832; cv=none; b=dpqgNjlfoX6QZ8fBwjvbJCmXJVwymC6f3rZGlnfkDQTdg1UMq5kUzv2e0z2Oe4T4DJNcQIUvQdfmru9+qV6lsMqatUx85jYD4mP/id8ZwRUshQkGaotiMo7BvZCr+rb9qK/9r8TAOyk9rCXdTV121yy6omVfb6rTVH7OACRlE3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331832; c=relaxed/simple;
	bh=58dWWAj8u1LIJ3lB1ZQTE5D7qZuasH22UdWojF0RmWY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TJLUG7BJCiLYJDuelim4QAt1qs8NFcks46J3ZztQCzAh58OfbxBYhsre1J6fmVCft6CuL9cXztGUJcLlX4k+Rbrvl5Zu03bhgrxMH2RtNIUt/Y5MRAXKsL9K/u062xHwW0IJiA6E3eFwqMG7yVhRGKWxFi4B6WjwkfvW6uF7R/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OlYlzU9t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OlYlzU9t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BB91F000E9
	for <linux-mips@vger.kernel.org>; Mon,  6 Jul 2026 09:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783331829;
	bh=58dWWAj8u1LIJ3lB1ZQTE5D7qZuasH22UdWojF0RmWY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=OlYlzU9tGeK98kl2f7sYAYYb0clVQdTxq6OZ3VI5FEEJRpj4ru6WCFrrmUMSw5dkU
	 /rr46zlEvx/gnbfNI3zRhRb0By4JVIrz5LBfKa67usYCi8maYdPv/ATJKLPlkOq8k+
	 uVpIU1CDy6wJGpYaq7C6THXznKO6o5MzN4twYSJc/U/uPzB0IE7alH7s3eTqP8YTHy
	 3Q9+Lr5Cz6pOzVC28sBpdGOWlEz6b4VAgCUVZIuLdgm8a6J0U8xwFIv8z1B0yn+Fkd
	 UTjRUybNdx/PhQlHGzBIlt3cgfQmqJWE2K1WCvjDmnkdrupR6kOlujmvjwcCyqUsCh
	 xDTV6qVxq5CtQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39b1eb7bd9bso23686391fa.2
        for <linux-mips@vger.kernel.org>; Mon, 06 Jul 2026 02:57:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrzxQbT/pDzIh5ods1SmxkIVzJu8HlHCPCd+8Zf3pu5POKL2uod/suJ7VjJCTMRT9pmfZBnvVkzbQOm@vger.kernel.org
X-Gm-Message-State: AOJu0YztzSxaryJW7uT7nI/W19QZVSzEeQQ3XWzro8mZxQerCAypVezn
	JPPsUgTPLvhG697+Km+iEL4KS7v9ZZPt0onTJ20Z0tiAPdRGC4H5Pc9pnOVvtxihXeqhJopFdgF
	PvGKoMsVtV1zCpkCeK/xf6itkJgxJRULIRvM/V+gIVw==
X-Received: by 2002:a05:651c:2124:b0:396:2a9e:d795 with SMTP id
 38308e7fff4ca-39b53b6c9d8mr18573241fa.2.1783331827992; Mon, 06 Jul 2026
 02:57:07 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 02:57:05 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 02:57:05 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260704-b4-bcm47xx-swnode-v1-3-730d59340237@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704-b4-bcm47xx-swnode-v1-0-730d59340237@gmail.com> <20260704-b4-bcm47xx-swnode-v1-3-730d59340237@gmail.com>
Date: Mon, 6 Jul 2026 02:57:05 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdHyrYvZh0gosXqpWGZsf1nfHL_9e28PT0A9vx=KAqbyA@mail.gmail.com>
X-Gm-Features: AVVi8CcIK_zf7nzweFAMWMMuw9MaoQEBuAM0z7qB142GjvYEHx8vHLhElT5O5ng
Message-ID: <CAMRc=MdHyrYvZh0gosXqpWGZsf1nfHL_9e28PT0A9vx=KAqbyA@mail.gmail.com>
Subject: Re: [PATCH 3/3] MIPS: BCM47XX: Convert buttons to software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Michael Buesch <m@bues.ch>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"

On Sun, 5 Jul 2026 07:25:10 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Convert the legacy gpio-keys platform device on BCM47XX boards to
> use software nodes/properties. This allows us to describe the GPIO
> keys and their GPIO bindings using software nodes, so that support
> for platform data can eventually be removed from the gpio-keys
> driver.
>
> Detect the active bus type (BCMA or SSB) and reference the
> corresponding GPIO controller's software node (bcma_gpio_swnode or
> ssb_gpio_swnode) in the button properties.
>
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDC778F4A
	for <linux-mips@vger.kernel.org>; Mon,  7 Sep 2026 09:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773995; cv=none; b=XTJqsWTyEN+T8zPmlG1FOp/FVqQzL1rfNyJx/5q+DC93821E/joBWqdFiVGtvoo/lN4XlYmOe+4JOfcCv71RV6774zHyXMcoK55d51qDOXN5UniIYv3s44PAnEmhv+wGdC+gESC9XJRA//o5TN3bBbGP9+wBZ+pyRR5rKHPUgfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773995; c=relaxed/simple;
	bh=WlL+j/Ie6m0Twd+B1P3rICow2WcfWKryEoGQ+1VVbBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g0YVEISKE9I4OO47oKiH/UZId0AznnhzoOe6T3tCWVry5s3ZLfUCFDZU/805mtGL9NSgYQvcTAvkiNo/H7o5kieAsh8Dm2hT9L9V9SOKLMILNwkUVPcJ4YxHaA7tN084UIkVLrf6X7YOAXISDEMtzTfgjqmt6tXrr4z9tUwzpSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c7d65c83feso3200509e0c.1
        for <linux-mips@vger.kernel.org>; Mon, 07 Sep 2026 02:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773993; x=1789378793;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=idsP1neYZsT92lOTYUcwf/RINlIKDTK8HxAaGpjV2+8=;
        b=O3c76+VILN0DHmByeLjjWaeB9mfQJOGmJHppqQTWUnOnlezAU0YAZev/WQvNWYtvmM
         5qS1j2OvBRtsl5EfD3VwAoxqAuJh/uOpycQVvKdgNMEA5nkjJenYuDsorG4v5+iuix8L
         f8mVWffnlTGndT46sUn++RUEWcocmO8CNkGfRAw6b4bHWSVy3t2htBa3W6zI4pZkp2j6
         Gn1XfF90s9h1i+uTj+uNu+Rq73LAUVW8DiVDy6Ffpg3eN+gvLCCRr5SYupCcvqb7UUSU
         AOCw26I3rK7VkH9lB308yntpv/YjvRWqnO0ggMJ0lQ/CvzVQLjZHRGdKhP30FE9PxUkl
         Ygcw==
X-Forwarded-Encrypted: i=1; AKwUvByG6ZAljo7KWN8ud6R9geVhRM3drl+y25eTL2c55zluTIiNUxOWbGZFcOd1L2Hu+WdYjbAOeIyZByEf@vger.kernel.org
X-Gm-Message-State: AFuF++k5s/R0R6Q4FLyMHoIsCY2+VhdGA8VlCVsHH35hR/tPd6x6bSB5
	QZ4Qui1isWGBKKB78aitMMAlQzb0B+01eVUGTdat5CCtfwR1arhot/ymsjqeodD2
X-Gm-Gg: AYBFou3L2FkrKMlh1HhrqcZqOvD6sYd+ePXVH8sa0ZM6aUzoX3XDxePlhKL9oBwxSev
	Yy0IYi8WuZ1WwrTBVnPtiwHqtaVViQsT9tuiuUm6B98OPgZg6J2Jm3eoCrS/7leZtmlRoD+B1+o
	Ocss2F4wlsf1jarG1P+DHVoU596vbKBJYXqjoK3ku5GSOsAoK081Vj5g3IoRDbQ+lJD3nAoKP4i
	MrKBx7eicNGauC9GSJM7ZnYtSV1+pYe9ZUbGVzLNPVt8wf4p73Gh/qr/05ssiALpgzHfX9ts9Pv
	8bWsYap9hiXaPfHzhfEuv6jcIwbnK0zwzNrhSpMbxyHKuxPAUyuJajSMbmNTClpbPxNCYwQ1XkH
	PvYcAA5Ku9zNyIKxkPESZrIIHsUF9xm8fgROkb1Fd4cXZQLlEMBE+jE8qvembOgfqsHQQGl1ONf
	iOgxNMCWcMnGFQZMjLwXXIznmhUZeBUDhcpykp36D/uK3dSG9qwLYBxAp/xWWQ5hiYX9f4RNzVW
	or9XCn7TLBEq03IF2D3BmKyIm4GlA==
X-Received: by 2002:ac5:ce1c:0:b0:5c7:ed31:3c11 with SMTP id 71dfb90a1353d-5c7ed796b9amr9005408e0c.3.1788773993381;
        Mon, 07 Sep 2026 02:39:53 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec25b9casm7432975e0c.11.2026.09.07.02.39.52
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:39:52 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so3134750e0c.0
        for <linux-mips@vger.kernel.org>; Mon, 07 Sep 2026 02:39:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxlqsEgqv0gzaQKtYf5m9t2+hmqLbmLwx3Z5tExDHcFXo7Srh/wVpe+dqAF7McuqImn55Cfbe+MnLfD@vger.kernel.org
X-Received: by 2002:a05:6122:c8f:b0:5c6:4bab:4cb2 with SMTP id
 71dfb90a1353d-5c7ed80403dmr10646528e0c.6.1788773992044; Mon, 07 Sep 2026
 02:39:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907090956.2825703-1-arnd@kernel.org> <20260907090956.2825703-2-arnd@kernel.org>
In-Reply-To: <20260907090956.2825703-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 11:39:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVc=ntgrDDqdNUzEbeQ=qjh7Pw=B3TSN+qOD5bRY4_i+g@mail.gmail.com>
X-Gm-Features: AcwNN1Wp7dWP-FBPz6xYVraXlAq6_uFTgT8pt9uLR2DvecmC1uG2AIElIe46m7g
Message-ID: <CAMuHMdVc=ntgrDDqdNUzEbeQ=qjh7Pw=B3TSN+qOD5bRY4_i+g@mail.gmail.com>
Subject: Re: [PATCH 1/2 v7] gpiolib: turn off legacy interface by default
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Gibson <warthog618@gmail.com>, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Sept 2026 at 11:10, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> All users of the legacy interface now select CONFIG_GPIOLIB_LEGACY,
> so it can be turned off by default and only get built on platforms
> that still have one unconverted driver.
>
> Allow turning it on manually for compile testing, in order to keep
> the build coverage of the legacy drivers in allmodconfig and
> randconfig.
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631802;
	b=ujDYZ2oyZIhQotUhilMDZt62VgOVikRqb4B4mMKxT97iuq/lojHmvzreCqCcY9fggiNq
	 jCC4DJgfDKizkCpdrt2dHcQfiDQa5XagHoHYIC2os+wywCu2R1VCr3DnuhNkV9xbCQ9rP
	 LS16Tf59MmRtJGUf/hbEGsVlwf4HrtnaCXedxO0SbmSmRPiLaP+A7jb9CnviRHIUEE6Jv
	 ef7AWXqSnMtCtJO1z5w/pR9TDmjUdZrfgzneX1kGdyaQSTF4+Fbn+w5Injcuw+eOJyo5M
	 IEUuUwgFd0by8J8aAf/Rb4w9wk9lZYtGeSaQZtjyUr5Km1hj+nIa2HWR0nfq7WiPbpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631802;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=I1kqIhwTQbIYkIwvzTT4amDSc4WG19rX5HvViezhfOs=;
	b=TcJNRcQ798H8qStk4NAfsirnKDwnFK2H7wxhf1vRZvfD0pnIyfe8lorNmRjNN0XLh1ND
	 uGYCuHzT1V3aZQv1Oy55Ym6oqwlfcA6GULO7FMgjk/+lorDGlwx6TVzjViGtTEGnAsZJ4
	 PkzMUDP/xHRElTlpBMEcJrOqCLt/0BnZiq7Rgp0T9hqwtt+Zzqmkq8uXd9FFPt7f9HidD
	 cACkMOeqY5PFGDJaON0TiNiGtKggjbJlrRys3TJfSMTf157be9TRzAmRiSCcR3YH9PJ9T
	 UlPgh98hImcJ2CjWuCnpboxQUEY4k8QLHh+FuBOPdvdr6wKRSNHjjuTyqSmrfT8h9GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iy5eNDXe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80D0606A327
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 18:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iy5eNDXe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D381F000E1
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 18:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631802;
	bh=I1kqIhwTQbIYkIwvzTT4amDSc4WG19rX5HvViezhfOs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iy5eNDXeajlfmYBUi3HVw+ZOUGhwAcS9hIiWwHa7pO/9JaOtuWpfYI/RLwVEFP+he
	 MsCg3O26VBHd/+Y0Sklk7Ge1L5580uROT71jaRSCDeXEgdGg6S+iO+ht2n8b+ATsG1
	 DT6lbqyVjrFBOoKjwEFfDrUxkVgMpJAyHqCWTfNPCWLy2voxOxy8wG+BTMilO9QyjF
	 oO3fltQ8TrI0PeHEl5mTbGB+xETSqFWYD89ZpwHqaa2/TCLonSH0z4/M/LVWl14tHc
	 2Q7yobtKPVNFJWfgdtBP1G5tbQlXVgiXLfhVm4gtKkXX5rthE91pHEZamYLxadoSA3
	 TD1odtsGC4Org==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c148d4dbfbso5560149e87.3
        for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 10:36:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEpEo8SduOS/7DxTBeNil2jIDU6HOtzEBhepdFjJNqJCbEzlTt4dfYFAcGq13FrFoiX5Jp6G62YjALz@vger.kernel.org
X-Gm-Message-State: APuU4Z/S2KW4qARJZMqQF0/xhz31nx0wRDg96hSys2OaBBn/kwf7AkOI
	b4Q+iiVjw0aPQ2uf1zcaTXftkN7ppl5dODdultYOF8Xrrg2gl64ADPPJITkyH0s4aOAzLIDToT6
	yqIAOc51noM8kbkq+aicACpp/MPBmOPs=
X-Received: by 2002:ac2:4c49:0:b0:5c1:6ed3:db66 with SMTP id
 2adb3069b0e04-5c1bc812fa8mr6445916e87.46.1795631801074; Wed, 25 Nov 2026
 10:36:41 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119204748.2558209-1-lee@kernel.org>
In-Reply-To: <20261119204748.2558209-1-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:36:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLktj_m6SzohDWE-1P2fktYy50Kq_V83gyAwvu4oHWuo0Q@mail.gmail.com>
X-Gm-Features: Aa3M54qAGgBABpC37EY4s-xGOSAZePImEjc0mtba_-nxodKr3zcHaitgsE_JuYQ
Message-ID: <CAD++jLktj_m6SzohDWE-1P2fktYy50Kq_V83gyAwvu4oHWuo0Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] pinctrl: Fix out-of-bounds accesses,
 divide-by-zero, and error handling
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Aaron Kling <webgeek1234@gmail.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Bartosz Golaszewski <brgl@kernel.org>, Daniel Golle <daniel@makrotopia.org>, 
	Hao Chang <ot_chhao.chang@mediatek.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Maoguang Meng <maoguang.meng@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, 
	Olivier Louvignes <olivier@mgcrea.io>, Paul Boddie <paul@boddie.org.uk>, 
	Paul Cercueil <paul@crapouillou.net>, Qingliang Li <qingliang.li@mediatek.com>, 
	Rob Herring <robh@kernel.org>, "Ryder.Lee" <ryder.lee@mediatek.com>, 
	Sam Shih <sam.shih@mediatek.com>, Sean Wang <sean.wang@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Thierry Reding <treding@nvidia.com>, 
	zhouyanjie@wanyeetech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:47=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> These issues were reported by Sashiko.
>
> v1 =3D> v2:
>  - Drop patches 05/10, 06/10, 07/10, and 10/10, already applied to pinctr=
l
>    for-next
>  - Drop patch 01/10 (sunxi) in favour of the broader Allwinner IRQ-bank
>    rework in flight (Andre, Sashiko)
>  - mediatek: Guard against NULL eint in mtk_eint_do_suspend() and
>    mtk_eint_do_resume() before resetting hw->eint to NULL on error (Sashi=
ko)

All the v2 patches applied (for v7.5), nice work!

Yours,
Linus Walleij

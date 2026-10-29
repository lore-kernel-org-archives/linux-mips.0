Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793276029;
	b=E6uQLUKMRX6kH4WYBpeoTDbuW+IMDWsS8HO4sMWWKyVv/fSngyf6FXUbEUE2WwZF/b1+
	 tKYnyasTdKEFqlwNqV58tX9ay8eS5UjesqWg8Z6krxmQ+0H+lZ4YTOIiRmNxmEVgdkyMr
	 7kzNM2xXV76tAcA0F2vhI/uULs8kz4ATJHCvLoKXAxLXM9h37hzjdchnm3Dv4HBnTp8TP
	 qXr4oANT+h/ZTqaeol/51BmuII4KvA3brhoC3dkR301W5burLUCltsgZ1yQ9gp1bdZrtK
	 n6IXF6ob6lCxvOUtoj1Txc+xM14lJI+Id2ZHJMcjyLwoMRLtf8BF5PnfWr6J1R2/4BA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793276029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
	b=qPgSp6+tVp48Qb9OUzEHLLDWUOsrluP1K4jHkafJ/R5DswJP+OP5QW4kdGGnGMkdM4qW
	 thqektOxupfaPJKeuiHOhYy5jcQv2b33pS96YK3sJFTHlampAYg8PGolI7KiNOO9Tqz+n
	 LRZvXiYaODJGI3X+jpTj44zdAHliJ5G7MbCWKTxpW2g581pCK9gv92cOlvtbc5GutOibs
	 Yb9AJZVNEK0t5hmxRjA0H3ZOSg2vosPY0EV8dgfePEugnA24z0Y7Ek6f9xVGNdkZ31AwJ
	 xkWzEav/cSireo7Ufsep8xlnk45YRE3jF9FBLpp2GzrEzw1HW0fvYLYDhET7firOSxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdjNoLtW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A7C606A31A
	for <linux-mips@vger.kernel.org>; Thu, 29 Oct 2026 12:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13A7C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdjNoLtW
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d0so15096291fa.2
        for <linux-mips@vger.kernel.org>; Thu, 29 Oct 2026 05:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793276027; cv=none;
        d=google.com; s=arc-20260327;
        b=jYIcayb6gKCfa9tEpbUEAQA6ZaDv/a8W0HYqIxUKDkYWAX0QDwdWhBV+Gf2OXlQ6++
         wUWCEu9ukn+VNAVTkCY8gBPR6JC3CANVl6uzusV8hrTH8rSxvILE7Bm2MdmBK2Xw2rer
         iVUnPt9hyJJc01t1qQdH7I9VEKO29cxzy8otU6AdMXugsp45JHsje39Wgv6Y8plKvWVB
         lo1vPSx89sEIJ7fkyLjUcjIv4VYe5FZmV9/peS13ROEGsZFm2guZXJy9kbxVdvWv/tpr
         bPG+Gjeg5OpTd8f1cgQbLgxKYAHPY7JNAS5PoIn97D+fzHXyahT9Lmai5z2Ix9bIn8wt
         KGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        fh=EcYkzoVGEjaU0uWwiEQbMY4GcV2kbeSG/mR21jCglow=;
        b=KDRxO2kqYTL/SaXiP/amzln/viJVc75en7nc8TQWK1rneikubtQAOOg2Bi4uPQzLRS
         q4Lnqc7nUkhRDik687CpCDC8SJiUK6M60tNkaHwweSG9l/Uo4syzSKOdNHXyHC2H3e5e
         0z4DuYVxDHD68vrv1RUyadi9PHgCPWQlTpz8QbnQRzIxG3hP06WIm8iztho0b/76VI7+
         eAi3Zl6kJ8wwXHrw3yBHeJ1Qq0VcEeJTX5eAhP/vOuswQbEVR5QoLfkUxm8sYk9u1zCS
         8SbFvzozBH9/WGFQF5rI/EpAxjeUEarj5Gr8uydcRBdolwE4syIovkgK/06rszPmO9a/
         q8hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793276027; x=1793880827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        b=SdjNoLtW9qanoocdo8XfaenLx7jG1vntJFcC8DkLO+gh6BZGq+GtSu/nUUaUUAYTV6
         2zn+32xB2BovX6Y27RtIK/EOCo683DTCuzzCkh1N3PXsFycx0m5ifziqVf6DIcldaxjb
         xFeM6ZZLoJ4TY2/2Z18WlvenLwcZiahgNKalU76tqMfRGU/srBmlyawiUjXoi2bjolO7
         4GarBiynJMxY7rC17kv2QulQqG8X9H8zkpNGO8MErSx+sneTtM9vL705EE0XGqM6Lp1n
         sxShBlDR4AcyaoIZLOQXPB6Pc2aChpyKoUsoA1iN6gOHBP6Xmg9sukVA3i5IM8zab+dl
         uQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793276027; x=1793880827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        b=a5LznwHJYJloC/780Ecn21g3u9yzVejvJdbLs+DkjnNFLTcKrTQHNbOAieALcRLS9v
         Q7SaStpxst/IyqIwtvuEEYI1tyoEIlZ+9YfctcaHvoCl15cGEwT4w9VsFOFxqNjciaPu
         E4AqEkEOe5gAr27nJzWdqhzzvVvKZbg3zMIVAaBFdvgq1wJj/Miw/GUW5Vfws4UmGMC5
         JwcHIabKLgr1wi0+6nJpJ2PWZ3Z4XPTkNuO06P9uROyAFwGTfPQN4OlDdO3DeyIXShHm
         RcwpbQyu2T/YC9+a4GqUN52ISRfZ4X4euYJE6k/78hYLXy8+hG3MPV8719mMjR8VYIGx
         181Q==
X-Forwarded-Encrypted: i=1; AKwUvBxkJ9p/hIvlHo0iXtPrGJaweH4s3GDUjoT0VA1tHyT+FjlFtOKLHJFzLamCeMPnI/NCn46F0Ts7Vhbs@vger.kernel.org
X-Gm-Message-State: AFq9FYJmute0qCVuVABjeYHdov1vtMu6HKn4L+2Q3Kxmi4/sRVNlEles
	ZWCVupAk3CDXiBfdFE4rQYJMlViT6WuWl7uXe8/obdea5PPl/V+QY9gmlIbOwawdmbYwuJbP8hM
	YAIslTG/UetNu0gGD36GlakWXG8XpWdM=
X-Gm-Gg: AYBFou1OFfkfmHH3f6dG2Nm0zGuQTwRJ9N12Za5osj3nZkRUMlD6Um0317Ep2r1m7Tz
	oyG07euAm8kVW7Kl+hGlSjzLp//KI7IDQlxasjH8tyxi7+5lUACa01KD8bHZRaw8t46w0Pc2hc/
	b0Es/J3j/tVwkb60wjyZr8a8yQVFJKBbGqnBQ02MNNA6D22UsmCpMq6ubKtVOcAosSYJMDPUgOB
	X9dy6reE1+OOyy6O391+NgY20ObPrjSLnDpVx15yKf3/5ng05U00CCyYdvTyxqxLAcyfQsrOfc7
	9byuJSp2AxoUzYqcSYoqqu220J8ZZbMr6hzUqQ4yGmM4YgCH+nEvfdb9jHpoXdO4MXtoFR7wwQR
	mZwYhoz1W2sHzxEAj0aa75iyt7b4Jb+WUcWKAewAb6oqPLPIDK82r5TRnUwArJ0QqM/QqrILS4S
	uUqYLd5H4Fch1pPUWCYWJSr2Q=
X-Received: by 2002:a05:6512:3d86:b0:5bf:b5a1:3c09 with SMTP id
 2adb3069b0e04-5bfcaddbde4mr1985707e87.31.1793276026925; Thu, 29 Oct 2026
 05:13:46 -0700 (PDT)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
 <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
In-Reply-To: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 29 Oct 2026 20:13:08 +0800
X-Gm-Features: AclHuK_9NKjNXktxauulycDv6ofwBJPad2Bl9GVrdKZysKXzXdts0yEdkZdQ85I
Message-ID: <CAJhJPsVQjajTzOwXyqUkdTT+Cw8wEX7-0NOS63S9cByvDSYLng@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dmaengine: virt-dma: share the DMAengine
 synchronization callback
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Longfang Liu <liulongfang@huawei.com>, Andy Shevchenko <andy@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Takao Orito <orito.takao@socionext.com>, 
	=?UTF-8?Q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Frank Li <Frank.li@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 2:43=E2=80=AFAM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> Several virt-dma drivers implement device_synchronize with a wrapper that
> only converts the DMA channel and calls vchan_synchronize(). Provide
> vchan_dma_synchronize() with the DMAengine callback signature so these
> drivers can assign it directly.
>
> Document the requirement to stop the channel and prevent new callbacks
> before synchronization, and the context in which the callback wait may
> run. Replace the equivalent wrappers in the existing drivers with the
> shared helper, preserving their callback-wait and descriptor-cleanup
> behavior.
>
> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ...
>  drivers/dma/loongson/loongson1-apb-dma.c       |  7 +------

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com> # loongson1, virt-dma

--=20
Best regards,

Keguang Zhang

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080707;
	b=pRdxQeIHKxDS3TjfmnI+Wxf5x3Ydqrewtz39apGYOMI1r2IakwPuRThYVV/7ENhLrgCo
	 YYTCsuW7QANsMnrmaz2maLg+/wTRlwl7htwKYTq6EmUdYhHgnVBMxUSq7cLtx6d/7+C9a
	 MFJxTfgzqOT1ZISib/L43F69buW7jGf3u/wW8JjW2inlwR0e0sKLLVzJX+mwgwH54wwcw
	 zhLd6uDBUcamZID7EwRJGsPtAQmTq4UTVG6WDyfa4bYhabHrXyKOFVygQM13bhKtjXzBY
	 hrEF/Ny2rZ1XpoQI6xPwGQGRfLHpOHOidvVbVl+vMQ1FAygAqJtyPSPA7J4Hv4qpMrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080707;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=GZbZTskx2cKfC4BEApfh90CpbM3Hx/m8Xyl39VhIKCY=;
	b=t0VfU9dUsfXUId6cTx4Kr6aVXs4My3N0mCu094JFK0Xxl8wWLfPY0LC3wZYhcjCkpnzP
	 uT32y45i+bUcAiQgwwiPpsHwJVk/BBzJ6CJVC1e5rF/kQwyBpmdLqpm+iOdaEEpP3HNya
	 zI9v10uJjo4y02KP/NGpcQ3AbniAJPDzoHKbLIxyHDMuJk6KyrbKh0VMEgmoKcrJ7Sni8
	 K7YITE5cYan7Fy7gYw+m/jS02dRkMtetzI13lC6I+8XfLZvP8K35V19MOJILNpxwFazE9
	 kY5IdyxJMFrDIOgde+VHOVbQXNJpK8Fn8E9uuTw51f7uO93IE5J4yrpB/jAoF0cPdKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DCE606A324
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 09:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6DCE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <90c71619b3207947cf3f52b2dcc00d68d927fb09.camel@crapouillou.net>
Subject: Re: [PATCH v4 18/20] drm/ingenic: Allow ingenic-dw-hdmi build with
 COMPILE_TEST=y
From: Paul Cercueil <paul@crapouillou.net>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
	dri-devel@lists.freedesktop.org
Cc: linux-mips@vger.kernel.org
Date: Thu, 19 Nov 2026 10:31:35 +0100
In-Reply-To: <20261118214518.29317-19-ville.syrjala@linux.intel.com>
References: <20261118214518.29317-1-ville.syrjala@linux.intel.com>
	 <20261118214518.29317-19-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Ville,

Le mercredi 18 novembre 2026 =C3=A0 23:45 +0200, Ville Syrjala a =C3=A9crit=
=C2=A0:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Allow DRM_INGENIC_DW_HDMI to be built with COMPILE_TEST=3Dy for greater
> coverage. The rest of the ingenic driver already allows this. Builds
> fine on x86, x86_64, arm and arm64 at least.
>=20
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: linux-mips@vger.kernel.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/gpu/drm/ingenic/Kconfig | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kc=
onfig
> index 987ed42f6f7a..60bff9ebee5d 100644
> --- a/drivers/gpu/drm/ingenic/Kconfig
> +++ b/drivers/gpu/drm/ingenic/Kconfig
> @@ -31,7 +31,7 @@ config DRM_INGENIC_IPU
> =C2=A0
> =C2=A0config DRM_INGENIC_DW_HDMI
> =C2=A0	tristate "Ingenic specific support for Synopsys DW HDMI"
> -	depends on MACH_JZ4780
> +	depends on MACH_JZ4780 || COMPILE_TEST
> =C2=A0	select DRM_DW_HDMI
> =C2=A0	help
> =C2=A0	=C2=A0 Choose this option to enable Synopsys DesignWare HDMI based=
 driver.

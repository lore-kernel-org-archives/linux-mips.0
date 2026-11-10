Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321609;
	b=Ah1MhWGuoRzKmIVd5D47NSGG7KtHG6rBklGYGS46yG3YWPpt+pkuVGlZT65tiUsRrX6j
	 +sPC/f6phNcAgkNMLkBfGRFWUMTYrFymunQ4kpawXf8eHCnhC0wBgZhoOUy1BaxNVRwwz
	 oyquvN1Z8Ll/yIVAJy4UxkjHjoHDLc04b9wixVZ2fqN2R9nude0pGCa9iAOk0rwEYPjhD
	 3Sxx6TajhABa2A1bMizukVEX6plj9tc1LESIgXcXq+rbi8PP6mVl5dUtDIszzc6GOKqq/
	 ff/yTccYfBp0yXDG1rY+KKEIS8VTMui+UGi+Xe+Vq70VdZosQUdVoyUQW47YLu8FWIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321609;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=zBf1r9G6tN4PCGIwYFRHeaYpu6V24z2k/HtpPlR30Ug=;
	b=MHO/AomeOq+rVYf/EqUA3jz9FApnRE1uT8zFMGdQp5Pfc2OyiyDFvZBw5vRCD7vrWm/1
	 w+Hau6sg+IeaNQmjqmn3+f4X4GpZHIhdq3iMucRNqHz3AUkK6MNk4qfjWcQFJ13lZR92a
	 NrqV42lykS+r+cPScnURAJ2uJ87SPgTzkVMSgCAIqqGiii0ww/qYmqgZ9hgVzJTEStnL9
	 JpQjJ6SnKVOxWefE3sw3l5sil3fNkOSnOBSmybcQdhSvo7I/ZHtKF7Ivvjx6b8udTr2QR
	 3t3b4tm64Schq1ePDPOVGKvSdWbPOkWaXNOk9vQ35AsbX43LJlIfIWh0DDhb+ZPZi5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pSOxUHET;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9775606A31C;
	Tue, 10 Nov 2026 14:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9775606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pSOxUHET
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 82FF5C79A8B;
	Tue, 10 Nov 2026 14:40:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 29B1D60012;
	Tue, 10 Nov 2026 14:40:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B66210329446;
	Tue, 10 Nov 2026 15:39:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794321604; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zBf1r9G6tN4PCGIwYFRHeaYpu6V24z2k/HtpPlR30Ug=;
	b=pSOxUHETAlFXI+QxO0WW4FSJeKEr49FdqteBMPfEWL9KNskt/L/e3a1+LI/AQszsy21LOC
	1NlT0H0HWtfK7Uv+GJVVShyw3iLtz3RJP9EnUPdgZDIcu404+Kra9omYZcJJ6FP/07d4dB
	gw+sxlsz/yd8NwY5Xcd152RP5ZfQ3457JmWq0R7BsLnd0C7hUtafcRkHfMuQT5y8MyJcPw
	KEuZWxhpLrdRaSGGrLm564bOifDacEA1Ueh1k5Hb6onexyivMRFUttRIIpMAC7v1o5005T
	BN4G+ai1XlVkiEsxqBir7KO4J5pU9NWMEV5Q7UYT2Tv5PHbXsBm2mLPZK9kZ/Q==
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 15:39:57 +0100
Message-Id: <DMRLX6IMODXH.1Q23T2VEIJVWI@bootlin.com>
Subject: Re: [PATCH] drm/ingenic: Allocate and register the internal bridge
 separately
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, "Paul Boddie"
 <paul@boddie.org.uk>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "open list:INGENIC JZ47xx SoCs"
 <linux-mips@vger.kernel.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>
To: "Paul Cercueil" <paul@crapouillou.net>, "Florian Fainelli"
 <f.fainelli@gmail.com>, <linux-kernel@vger.kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261105203517.2293404-1-f.fainelli@gmail.com>
 <fb84cd36838875ccd2530b9e3983700fbd23eb3c.camel@crapouillou.net>
In-Reply-To: <fb84cd36838875ccd2530b9e3983700fbd23eb3c.camel@crapouillou.net>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Nov 9, 2026 at 8:46 PM CET, Paul Cercueil wrote:
> Hi,
>
> Le jeudi 05 novembre 2026 =C3=A0 12:35 -0800, Florian Fainelli a =C3=A9cr=
it=C2=A0:
>> The LCD controller's internal bridge is embedded in an object
>> allocated
>> with drmm_encoder_alloc(). This initializes the encoder but leaves
>> the
>> bridge's reference count at zero. Since drm_bridge_attach() takes a
>> reference, probing the CI20 display produces addition-on-zero and
>> underflow warnings and fails to attach the HDMI bridge chain.
>>
>> Allocate the internal bridge with devm_drm_bridge_alloc() and
>> register
>> it with devm_drm_bridge_add() before attaching it. Keep the encoder
>> in a
>> separate DRM-managed allocation: encoder cleanup can drop the final
>> bridge reference before it has finished accessing the encoder. Find
>> the internal bridge through the encoder's bridge chain during mode
>> setting, and use the bridge argument directly in bridge callbacks.
>>
>> Fixes: 94d50c1a2ca3 ("drm/bridge: get/put the bridge reference in
>> drm_bridge_attach/detach()")
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>
> Looks like I lost my commit rights to drm-misc-next, I guess for
> inactivity.
>
> So I'll ack it (LGTM) and let someone else (Maxime?) commit it.

Ah, OK, I'll add it to my pipeline then.

> Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Thanks!

Cheers,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

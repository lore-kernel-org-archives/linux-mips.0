Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330314;
	b=mK1MQOjkINvyp77WQV5GlnY160OBPQcK+w8IfOqT7U1LQ9t0zJQEItGkE8Xu4cBl5lP5
	 i7om8beTW3wbB8e1SO4dWw9JBZKPKpm4ELpgCtaOahPsbnSD/EsFTHOrUCIlb9K8aJoAV
	 paxiWvsx1l9QrL5zYUFOuzrRwGFMb8nX9ALA5Ue+LirJmOSWU6HM2yv4ln4Onb9jbMGG0
	 PW89Aimw4x36gMdviVDfd5leCCYaDSRXlpztfX1aKENpsZNyfxrx3mL8GFYPrfYz2c6rq
	 TwtSxHD+H8/4dSXX5IyxIk2EBzNzRe3HF2350HRJL0eGea/IJdgxMlQP25F6a6bQo+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330314;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=i+PblSFW5rSWL+XOE14iSP6Y05pkEHzAEKdDJT11t1Q=;
	b=EWD9htWnOmPdrWd61t1A1lgq1J0nsXj/MJijako+bsQjvhzxXq1bbQ9AYgbzN430dFxh
	 UJIDh6ye/81o+SMcT/5+VKnOtzeoF9/YUO9i/rCp9G6wYcU0k5MP2Kym17MS0ifvnl0+i
	 hVukuVfFrzHF3c2uMFlhceAZ2qJl7iMEO/cRONNeAR/Ludj2xku8r+4rKZDaNFFQsfgc6
	 lnfAZdx4g5Qgqqe9ovfhB8QlEN9rf+/ijD0nJuNelZPkLjZjPIG+pN+QwhFOTkLI5KvPM
	 L6Ce8sxYqvY1KZmcQPDh10zVHaTL/5gGpgh3QDR9PNISxoe25EVo3RHV8lFqMEHDhdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3961D606A320;
	Tue, 10 Nov 2026 17:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3961D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <c763b6e7f130d329242c098807957c4c88ca2262.camel@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Allocate and register the internal bridge
 separately
From: Paul Cercueil <paul@crapouillou.net>
To: Maxime Ripard <mripard@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org, 
 "H. Nikolaus Schaller"	 <hns@goldelico.com>, Paul Boddie
 <paul@boddie.org.uk>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>,  "open
 list:INGENIC JZ47xx SoCs"	 <linux-mips@vger.kernel.org>, "open list:DRM
 DRIVERS"	 <dri-devel@lists.freedesktop.org>
Date: Tue, 10 Nov 2026 18:05:07 +0100
In-Reply-To: <avMt5CTevTANpXqO@houat>
References: <20261105203517.2293404-1-f.fainelli@gmail.com>
	 <fb84cd36838875ccd2530b9e3983700fbd23eb3c.camel@crapouillou.net>
	 <avMt5CTevTANpXqO@houat>
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

Hi Maxime,

Le mardi 10 novembre 2026 =C3=A0 15:45 +0100, Maxime Ripard a =C3=A9crit=C2=
=A0:
> On Mon, Nov 09, 2026 at 08:46:40PM +0100, Paul Cercueil wrote:
> > Hi,
> >=20
> > Le jeudi 05 novembre 2026 =C3=A0 12:35 -0800, Florian Fainelli a =C3=A9=
crit=C2=A0:
> > > The LCD controller's internal bridge is embedded in an object
> > > allocated
> > > with drmm_encoder_alloc(). This initializes the encoder but leaves
> > > the
> > > bridge's reference count at zero. Since drm_bridge_attach() takes a
> > > reference, probing the CI20 display produces addition-on-zero and
> > > underflow warnings and fails to attach the HDMI bridge chain.
> > >=20
> > > Allocate the internal bridge with devm_drm_bridge_alloc() and
> > > register
> > > it with devm_drm_bridge_add() before attaching it. Keep the encoder
> > > in a
> > > separate DRM-managed allocation: encoder cleanup can drop the final
> > > bridge reference before it has finished accessing the encoder. Find
> > > the internal bridge through the encoder's bridge chain during mode
> > > setting, and use the bridge argument directly in bridge callbacks.
> > >=20
> > > Fixes: 94d50c1a2ca3 ("drm/bridge: get/put the bridge reference in
> > > drm_bridge_attach/detach()")
> > > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> >=20
> > Looks like I lost my commit rights to drm-misc-next, I guess for
> > inactivity.
> >=20
> > So I'll ack it (LGTM) and let someone else (Maxime?) commit it.
>=20
> I just checked, your account still have access to drm-misc, and the last
> activity was yesterday.
>=20
> Did you lose access to that account?

I connected to gitlab.freedesktop.org yesterday, that was me.

I get a "denied publickey" when trying to sync the branch with dim, which i=
s
weird because my SSH public key set on gitlab is the correct one.

Cheers,
-Paul

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426987;
	b=VWrV3SP6/DHJA+K38LRhPvS31hCTls6j9kOA5AGoLbcBYGPuaoUdeD8HwWqWjBT1zIUS
	 2/ExcQnjyZJYKiDiNUpYS2fMwfOZQl5eiYlAl2oJtLfu2ZT9XTTqtPhhvQmyNNMEQbxA1
	 MNgiEpwC5cXj7iY5MihbwhX9i+VQw4yIzgPnlnaZJl0lo3oiPpInVc+7//iUKKhGGoith
	 xuKIhEUm1s/UX0iBWQ3oAIWXq5ebw4Id8/Ve8rPaAryHTnFqQt82gtINRrWZdpbsukYFh
	 XPfDBjMxMGl3xMhpYkLKOAV/rMShLPhVgSjSU0g6M9+MMPAk8SioyKd1tp8En1l4fPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=c2mdiRnTGW3Gwps9rTf99dl9KpELe38/AhZ0uri7Zbk=;
	b=qJc45+IC5HgM3a9nEo7SnJGKoE6b1aebrwKat40ImIa0CgCXYxT+UKrzWM0Dz4eyFr2m
	 7RfBOaRTTVwLGpfzUirRz6VLgVCHUA+2ure4WR38teqLbVZgexjc1LMVxUSd8nnWmTGEs
	 6Lc6D5bN1FDrDDKi4++tzOSCOr6MSEFIO3V8wt7QCDntE6tR3Zxgv993rEief6j4Gtm1c
	 3ooDcAXX0qcQCU7rHsHwJZyEyNXD9Ytod4k7/TgpV//sr7oEpQoZXkYiKTcEj1C0iuuel
	 04pATzHoUguZZYzPkvdzxvzmEhlciFMTkhPGGX+Qukhg8ZucvzmrI27r+CgUQlI/UNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KMMWTx7X;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0DA606A8B2
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 19:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F0DA606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KMMWTx7X
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so1191906c88.1
        for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 11:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794426986; x=1795031786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c2mdiRnTGW3Gwps9rTf99dl9KpELe38/AhZ0uri7Zbk=;
        b=KMMWTx7XNrJc0FASemx2jnpRfXqKIqX5CRrqhz0yI/WmYbBQxRu5YZV38bENsM3vOX
         5QhYjS7gsv8KFlU3rnDdcRVxzw3vIo4Tsp5EMeVXVehuYMdCA7VRPZCIsGbuZY4j9keZ
         02bes7rDTA7ab6STvh0T5QZDBcHshnOP1oZ583sMUH+FhlYcdPomwyz5u5tfn54hdKLI
         ZefCLlNyyhny8+7X2qCtLXkIvuv3vM1shMicC9BEd6qwwGaY4nOyB1bS37PjSGPxO/qL
         6T8o8exTuTjfSilbikdwQgaEyMQfTIk+Xl4CIdqtE3sYqbMkIHwlB/g7DJkmzLbBGvhD
         cTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426986; x=1795031786;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2mdiRnTGW3Gwps9rTf99dl9KpELe38/AhZ0uri7Zbk=;
        b=x4ymYmui7hdrGCws85I+I5Csqr3dH9ewRNusym1axO4PwmYy37NHGJTAigXQ4I5Wdg
         aefZBZ8CkkUBjWdfs7VADhQwUSp625SJQJzHVIb+BvQ5Elh7SCt99j6EvIEF9jIHROUF
         KkFYt0gdRw/HVycveWdWJtx2AJSkfYnpSb9OTWoxRjpr/NPcs2/F69AJLjpSEyhxxSxR
         1ua5kcgpGEmS+BuwhPQy/cJR38GBTwNJn8+yx82xksokKNxL3QuQMwLEgC1NE8IKS1at
         Rr5eCh7V+7zXuIhny0CEOX04egT43fi8sSnB3drLll6XInI9eqpd7hr3+Igl3h+1Qok/
         WVhA==
X-Forwarded-Encrypted: i=1; AL+hErHH4UNXQ/ocK+R0h465Tp4K861tHjoPhAJ5u97OEoCpHGjeYWdnhZPRp9J4zsTXIcLvgTr8IIE6Gs88@vger.kernel.org
X-Gm-Message-State: APuU4Z+BdpIE9FMoffwk8Y0z0LlW8DB/qeYmIczmQ3vMDqdC1Thpd/jP
	RoxBR9IJaQ05kdU7m/1Y5/7krlQPh24Dkr5TqhaXZmcpBpHbCW+LCB2k
X-Gm-Gg: AYBFou30H3mabMYCH+h9a6Gnz9kUPYbq3KQ5IwH9tSxCP9o7xb+kC4lS7NAuYVpZg6e
	atSo/r3i2x5UG1tHO0+o8Zsu7A/oKRqXF6qfxCo8U5qnnx7aCBXDW0EdJ1cUhmcCe4dA96FZfNa
	BibaHBLHwH8apZY85l5r277rl+of8uTaZlOcjXFbVQ9Fy7TeIlUQ2JIitYV0VwKzeATg8CdI7Pb
	mGYCx85OJwhPQ57ZS2WcK0lK6+17P5K8p6OSlotK8hHi3XDTXzgVz+JNB57QtW8jQLJERk0eYdF
	nsakXEhDT81C5NrQvTFzBSOeldE4zyiwTJpwL8UdW0c6yOfn1vPx/LnNr8NWbs3fg383E05nzbO
	Y67ul4bybrz8an/w/Vao/1RHc+vzBvwRLFnp6jK+aKGIWGy9YNV8YYce/IITDq9RyxNcCVRKWCr
	KzVNZgCBI8RAZo9g+O96FBGmtg+jnJ2IfwS2v8Ocs+eKVGRvl87gUn6aW/Ebby4HfbAxb9tIw40
	17YSjXaSGpluUtxg1PTy4wkhvPXaymgzhTWan1roOQsFl/JCD8BPDSW2a1Poi6jBcZ+4AC8GqYz
	dZkHhMr7VtyjjLePCKuLYMRHom01KouT9IRlkUoHOJh/zdU2D/mxZbSZG+Sq7yORMZ9ZXcDwJBk
	X05erWN6lZWB3Apxe+IyxYUdFHQ==
X-Received: by 2002:a05:701b:20ce:10b0:1b3:a05f:8929 with SMTP id a92af1059eb24-1b3c034b506mr3343896c88.39.1794426985566;
        Wed, 11 Nov 2026 11:56:25 -0800 (PST)
Received: from smalls.localdomain (ip-198-145-71-161.az.bambroadband.net. [198.145.71.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm21273012eec.26.2026.11.11.11.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:56:25 -0800 (PST)
From: Hunter Laux <hunterlaux@gmail.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Paul Boddie <paul@boddie.org.uk>,
	Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Subject: Re: [PATCH] MIPS: ingenic: Let Config.VI tell whether the icache is virtual
Date: Wed, 11 Nov 2026 12:56:25 -0700
Message-ID: <20261111195625.2694287-1-hunterlaux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <BA039439-3960-4865-B6D4-17B845BD77DB@goldelico.com>
References: <20261110-mips-xburst-icache-vi-v1-1-efba689606dd@gmail.com> <BA039439-3960-4865-B6D4-17B845BD77DB@goldelico.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nikolaus,

On Wed, 11 Nov 2026 18:00:47 +0100, H. Nikolaus Schaller wrote:
> it appears that this looks quite similar to what had been sent to us by
> Zhou Yanjie 5 years ago for testing and we integrated it into our
> out-of-tree kernel but it never arrived upstream

Thanks, that's the same change, and good to know it has run in Letux
for that long. v2 will credit Zhou's patch and link the Letux commit.

The other half of that commit, the UserLocal part, is needed too:
XBurst II implements UserLocal, and the override hides it. I have a
patch for it on my list, but I'm still looking into it.

Hunter

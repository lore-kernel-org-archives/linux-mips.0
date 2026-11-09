Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247155;
	b=F2LQQT6IwfQXQl6Ty83QMn+1cKR43BMpEWPkSo99KZT9UhDuxnY4AijS5M2QYyjfrRBJ
	 B28ToZS0CPoU95zofYgoRF33r8TdAViUtGdEUNGiB+H5Nofq6T0qpOA5XHHwyMrhi0xEn
	 dS57h5Ce8ANxzBNB9yEDORX+d1FsRBVMgxSdph6nC0jqSzNVUdjTRYOovBOPzbvMR8XG1
	 rJ1rt7+DmdFyrpYdnmEb6JyEXVD5hHJ6+x9KyvqzzELobRtMoW/1RXrTv9SYUBv8+XZjB
	 e9WEaLzRDrTRgwlKJuSAJyZelUKjLYIiIYBENN/wC4D7I7TZVaYf340xu5T31yBgHrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247155;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:User-Agent;
	bh=xzxrWa40iQ7LOYTF6q0Q+O79NFISPGm9rApGiB+AUmc=;
	b=4gp4x2k2FCZfK6MRnhkbAz4cJfiey80AVZeSUjybrkJLN3hA0TjmJwhufTvoSW818K5D
	 GRoBms4q3LGvJp+jR/x1AcjTmeDxDuMegWbn0cReHJbEFHRGw3STPFLmibYFsJx9p3T9h
	 F/JfhkIJmPddYLC5U+Wlh7wUkhuRzGU4Q5jpea8FSo0cgaFnN/td4GwcLQBhoBCeEi+M2
	 46bBR/+SF5juOoZeKpI/w7xWAtOagVReV9ETyB4BjcsqccURD8nqQAgRat1JBRQOSH3Xb
	 LOa0Foxik8gOYbmmfQI37N5BN+JBT/kDnpcxNlXhx/RNq8Vse6hFatN7OAdT/Q4dQVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NkyXxXqr;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Hfuq1k0U;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195FD606A338
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 17:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 195FD606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NkyXxXqr;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Hfuq1k0U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794247154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xzxrWa40iQ7LOYTF6q0Q+O79NFISPGm9rApGiB+AUmc=;
	b=NkyXxXqrpF+Xu/J80la0nrSXqdHWwnIonM/+vBN4R6nc+hyEj9ZQJapQQVm7mb0TWBUco5
	cJ5c0Ea5t2T/BOvYXfQ5bmgZfvYc1Ubh8JqzO8CXUlJ/Qeh79IIgu9snMIJenP0cirQzos
	Tk6Z1M/l/v94nxFz/4xL0bsDwyUitfU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-TMsJ12GJMWyhF8cJTulKPQ-1; Mon, 09 Nov 2026 12:59:12 -0500
X-MC-Unique: TMsJ12GJMWyhF8cJTulKPQ-1
X-Mimecast-MFC-AGG-ID: TMsJ12GJMWyhF8cJTulKPQ_1794247152
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91e89171fabso21955966d6.3
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 09:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794247152; x=1794851952; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzxrWa40iQ7LOYTF6q0Q+O79NFISPGm9rApGiB+AUmc=;
        b=Hfuq1k0U5lj48vN+VVbPE+g94Um9TL7NKt28h+pN/ZNFUl6D8MgsemgnVVqm33u//p
         3pyClyCyR2WrZyljS1BdUQd1gllRbbjlmwxGkP/YFf1rN1m7zvGZAFq6E4l6Ta8jdzpn
         QPdp4/enLhhwTeTrHvYeAc8xJhoqmCB+MzuCbdVGCFG5epxMgchtIpnMQKSB6j/tDEv3
         9ZgLzv1zArLUvhnjJ4u5FkUhP4ghYc/U5BlIagwgrJX9/+zVHeZuPhPXqJVDPz/S5r7j
         k8aa+Nj0tCwsT3Kk40rjH79/VjmtuapD4F3GG+bHm2x1fICu/CN51iM0xFdMkRaVCCT+
         4jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794247152; x=1794851952;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xzxrWa40iQ7LOYTF6q0Q+O79NFISPGm9rApGiB+AUmc=;
        b=B5RUwWomiijpKnI90RHhUQUjQeITYYHaTpNXelwEa/iL9z4k44kPoFTxH6WjgS5bH9
         u4wEJ8WB/8ObLweU8qwggzhMP2Y/Nq44+sPMxke3J+0wBOenxdhbsCc0iYW5a7dcxIV+
         PaaVvQ7I/omP+j3pfqBNrrmFIPCVPDNHKcChWuxEiars1m8feBwILpEj9TdZ1MEesYWf
         0md2nnSBGxvm1W66vbAZMc3fAsPpAuIhjlju7gyPQt3tTDipUUu9XhbKAhjB8+UwlK0I
         crKdOcXfym6t+g7+xlMBCQhDY8jvb4MmgQD90L5jBD1oVfFB5UWjIZRFe8xV1VKOkZwq
         p+MA==
X-Forwarded-Encrypted: i=1; AL+hErGcYg2B9xSDgLUrd+YBoY+xjkOzPykiNcPqVQ6KV7K1eYvXR0++/x8Iiu+ZcZjOFmpwQOoAuYQzgkfW@vger.kernel.org
X-Gm-Message-State: APuU4Z9msCG/2YpIvJJiAcutC9jjj1OIKUjFowSa9r3+HYVpQQBy3lSS
	NoPmZbDB9gLpeerFArIle+EAMzsYnZlMyG82EVFZN/z022N8cb2RF1XG+u6oIyjkfqqlA6k3X6U
	jxGZmCkQlvNlLLCPGl8ln8Ivho3iNZ0oVEIVX5+AeKY+7k5SDGv5VND2Ym8o5Qw4=
X-Gm-Gg: AYBFou0NhCG1bJ+KYNuEXfrE39ollM2Hqmaw8K7k8GpelNqRIZWqF7/3IG2AdJb8Ce7
	hMAtrmM2S1T570GdIZ1hvI4i7zlydqDdGeUsZ4ZbuIwpW55hbZT3y29vsMUAPT4HZ54OqtB48dH
	cjIXo7TsKUS7vcqPFogWnEWz1Eio/sxw0iMAoBfSQ7i2sOAJO+TGSyHAsl4JrHaffq0KXbQUzHX
	xyfxXk4gDgmkf5iWVtV+Hx2SaR65NJfBCcg70IP/dNMUg+OwhJBfEm5MUVBFXSYjcqi/ip9env1
	P0tlzR+PETgOobWWsaIeoVcfTd9/jmKSrmVz9FPUjomzHBY262AV+NCOD0W1CGJcLyrSIoBiYZA
	H2xhmJ1gGmIG0HnN0cDmYY8DwMAKghq9MtyBbdru1l410NyahSE7gQXoo9or1I0TYI3ttDvKZl9
	VHPncsIbjelv+TIr5W7EdxKXVLzfvNy3HhU2nFtFE=
X-Received: by 2002:a05:6214:5bca:b0:91e:8a59:5fd7 with SMTP id 6a1803df08f44-91eef724dbcmr7141526d6.3.1794247151849;
        Mon, 09 Nov 2026 09:59:11 -0800 (PST)
X-Received: by 2002:a05:6214:5bca:b0:91e:8a59:5fd7 with SMTP id 6a1803df08f44-91eef724dbcmr7141026d6.3.1794247151158;
        Mon, 09 Nov 2026 09:59:11 -0800 (PST)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef0540a8dsm1273966d6.41.2026.11.09.09.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:59:09 -0800 (PST)
Date: Mon, 9 Nov 2026 12:59:08 -0500
From: Brian Masney <bmasney@redhat.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: ingenic: convert to
 subsys_platform_driver_probe()
Message-ID: <avIJ7KZxtTzUkpfJ@redhat.com>
References: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com>
 <20261106-pinctrl-subsys-v1-1-f17582f32aaf@redhat.com>
 <CAHp75VfW-DV_HcorM_XWWkBnc6YVrj0fBReFf=WgziVCOoEjzg@mail.gmail.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfW-DV_HcorM_XWWkBnc6YVrj0fBReFf=WgziVCOoEjzg@mail.gmail.com>
User-Agent: Mutt/2.4.3 (2026-10-09)

Hi Andy,

On Sat, Nov 07, 2026 at 03:58:23PM +0200, Andy Shevchenko wrote:
> On Sat, Nov 7, 2026 at 2:27 AM Brian Masney <bmasney@redhat.com> wrote:
> >
> > Reduce boilerplate code in this driver and convert it over to use the
> > macro subsys_platform_driver_probe().
> 
> Wasn't there already a set of patches from somebody for the same reason?

I just searched the linux-gpio archives and I see the effort back in
June to also add subsys_platform_driver(). I wasn't aware of that
effort, and it was never unfortunately merged into the driver core.

I got the macros added in 7.4-rc1, and I posted patches across the tree
to use the new macros.

Brian


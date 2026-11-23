Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447536;
	b=XF8pbaXBrdDQdhWJAB4pxOWSnY+WV93U02Ga9g74Xrv4bce0pJw9ZP4P44jSU2rJtT59
	 laew2azSFlZ/pR2hyqlsj19V0BOl6ZZBGDhxCPd3xWSc+EWjUww9AAzbf08tzZuegWMXH
	 KbGR4OsKA6RWcQOGMhSU1W9RlDYwukSWMnvXSrpDKDK0Q/t7tAw/V0OOLcF9zeNv8IpjU
	 sJ8LHnXlhOUWrCgG6wlcvH0SQEYAVL0ATklJE8KUnvJmdw0zCLG9iQHRO0jfhNSfBZ3rJ
	 CXk6uuqZ4SsJmdCEqAtFwcH9wK+ByXsEqva5zAzXWG1HKB5ki4AGB7MzOHsAHONK98Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447536;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=0s4p6DQdNQlFaKL/LCIj9wFD1mYw+WEFw17qHB6S1I8=;
	b=btE6kZDyBA5QMKCRC5HjlZOjVsrxDd48APqllAC6YcywyIey8fTJcDRQTeCwksyEvfPn
	 BA1ykQhXVM9ZV3leJH2Mk1Dd14xNCTyrbAdIuCzbkxoyWYXs2qaXIG/Vp5hpaSxWZeaVt
	 p4kRicrQbl6a5NT23qUnVHyXx4Y5aZjKCReB+jNTCgL+1E+g5KvdgTP9paYBaGbqkh9AY
	 HnTwUlesLGzgUD9H8lZ9n2qWtTdA2cyGXqNm7PJrf9yH12zJeGg7Bv07922sGHSdRzHI4
	 hOjZkRWVxFFh4NGa1fbgRIKQ/Cnw4WOn2IDp6alSdvKAD1OAnS72naNg72ictKOlMuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=hRatJ6c0;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tN6NiDhh;
	arc=none smtp.remote-ip=103.168.172.150
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB2B606A69A
	for <linux-mips@vger.kernel.org>; Mon, 23 Nov 2026 15:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AB2B606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=hRatJ6c0;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tN6NiDhh
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 7B7E8EC0B3D
	for <linux-mips@vger.kernel.org>; Mon, 23 Nov 2026 10:25:35 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 23 Nov 2026 10:25:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795447530;
	 x=1795533930; bh=0s4p6DQdNQlFaKL/LCIj9wFD1mYw+WEFw17qHB6S1I8=; b=
	hRatJ6c0MVwM7NsTQ6x16RX02Rx0p159f6m92t9bjLZojaWHX73t+PpdDLY8IdX0
	FXtnTt9LaeOgh2GTmMPNoXmywag+DgygFub4WOIB1BBpZviH66e1pabC4Qig3ByD
	bRzOmUaS1ko+L1WxYflybQZmhGWA5Xtz9freK5VgYwtAZcQm121LTq8dkQz8n3zV
	Pl6mwgNH49AhmitMsuEt92oMHbyFDP63tbpeoCN92445NmrybNW9xtvDg34rLxyC
	4Vaem388r75zgSuBHT16buqWx8kRk+QoriWKcCBd2GlCX5+qzG+ZHXhscsVMsOeg
	R7jWCeTPSGBn/vmRykfuRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795447530; x=
	1795533930; bh=0s4p6DQdNQlFaKL/LCIj9wFD1mYw+WEFw17qHB6S1I8=; b=t
	N6NiDhhcW8AYBmOQdzLi+LWlJ27uIWKTKaGllHVX0omOlAzIg0IwEDBcGcOIkEy8
	foFbKzc4RjRqXVDBJ5Cfprrilkmo+9o6TN23RpgxhT2tvbyRXIGGHU89RXW+gcAc
	2FIne5Vb0ktSvTeh0RqBmPfB7D0ZcDbo/P4NdDIf4RGZ/7eqibn4xE+7bziweyTL
	qcHoca8Y7OOLAVRbn6hlC5oUOU1UUpRaXLFV/we7LNIIwwoYjJy8OtGnJYeRjgdV
	p89X2TGDG+e4tnOqPoLMFpSkJk3ba7DgPi9yVVtxo1fXP6xWB3ZsQ9+OCfkYue8q
	bHqliD/G3pcuNOeeILDMw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795447530; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LW1pcHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:fbmMI+d6PZp9O4xVKeLx3SAToCbUvOUiF3MwFTdNZaVOx+Z
	1Ckw2Gxlbu7PQY8InGsE76n/Ejkb23JL7aW57ffk8TKX9AsIT+E+i4g0+vdjJrdv
	NIs7D8fv5t+OAx7L3h+Wprs+WC5h0l/bYNS87QWK4hn4YOvi2jjX64YdXiNKDRJa
	N1EoWGrNoSVIsIcG/QyXfJfLCg3TW2/UpnUb8Ea78hCx1qi1UqGUrvQ1XvOxJZ6g
	j3Ns7j8xfvoimkZYMSU17jf+gReQy3J/4ZEEOxvrTouD9eLWqxmsOJEiMzmYGgey
	lUPYRZoJSjlnr+5HsCZwbjsZSUOIrUoKgRgx8QQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:hUqZyAVIjmUUkC/sfGeVEaPi9086gM2/fvLEnQB4K6o=:W7TU2vHc9HvrqqySqenGm1r668UZd7I6KeO/+9zcev4=;
X-ME-Sender: <xms:5VoEa9OCvxUI_HvsHrm31TiHj4gKDEbteEh3xVXb26WRlwJ-gMNcNg>
    <xme:5VoEa6wZJ8LvPdcCGi3bInRNSZQx0lPWMMy5fjBEQE1_uSBkfx3FOZbgatTroQGen
    AblVRlUV8Pw79_GiFqkz6gKoRIFKVjX5qtHeOFlsENECqPlXhZgR8E>
X-ME-Proxy-Cause: dmFkZTEkA5fYjyH7DoRZ9fSXTSyQM3CMBbgSoOWT7DzEXbdLuI/xu+QbsCUwVDqp6cmeBG
    rLSJyPAfNtppIjc2n9ISKm44YulXiHowpnhktIfScyFVw4u3iFGUP2/G/4ix+afnWqmBFI
    GzKvKqe2Gc5DWEBgFP4sFAJA6wGOUu3obgqUrxUPp1/9SLzSrA3NED7r55E6ImKfZNFgK6
    SbdNEW9MBID+uC34fbT5ngwFi3pkaLfFY9lszhY+r22v/RcSRobM25XjgNjlGeIb3pLrAb
    FweC00Urn/1ywn3DLW3xzTx8xfHHygJhiPzyve4IRXncArRK+LbMZ7PLowts6/MwaLYHJA
    1WehYI3RY3kD0LvS920puxloGptanWMjB4xGUhWNtwvah33c7v/VkLW1RhsZ4APfAYZNxe
    1q8QQUosNdvlBk9bBOBGvLdAFBek4N7yKDbegWn/Slw4wQvFSC7dHkrfSLPbW+VoSPNS6b
    03uTTkddiBSoDqGipOoT+98HOD4Xpuum1b6IuAUgcOW03bbXbhpiiNEyDdtvjD+zLScoNQ
    xj5SiuXMpICr3Akn/GPeIRZEXEmlMM9FDFR5eKUlYgdy3WFDZrLYvSJNzubIvrk9OaJZfp
    on1dYUgKQECyezlkKTPDfG0HzNxE1exvL/dLJ5dODoCg6MHeLI/7jCG2ynNg
X-ME-Proxy: <xmx:51oEa99lfrDTIMjZgQUJUk604TPbSQm-4RCSYSw9Qa9E8eaaB7YGkQ>
    <xmx:51oEa8HOIIjKm-knb9jwTcWGXBudJgcuuMDcOnZu8ypTY_vG8cU9NA>
    <xmx:51oEaxIObBSy_6N3MiU6GEqjqvGnfkv8lDtzMSvZhGbJ4WK3VIJRxg>
    <xmx:51oEa8lNpXYJ-7Dqd28CPM-ODpLeev6nDd7L6h-wLh3OKdQhZci16g>
    <xmx:6loEawZKY2QNsiqawwKmBneikxjE7uLuFTqAmZPL0avagYW8BXRslAq6>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2B80E32A009E; Mon, 23 Nov 2026 10:25:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AS3EG-ulzzHR
Date: Mon, 23 Nov 2026 16:24:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Linus Walleij" <linusw@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Kent Gibson" <warthog618@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-sh@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-wireless@vger.kernel.org
Message-Id: <8296a5c2-0aa2-4fc7-b65b-9d336bc4dff6@app.fastmail.com>
In-Reply-To: 
 <qvmy7iaxc7cjy2gkajqkr5ma6b4lwxz5ff64a5zsqrgewkxodr@odbjlv5x3hix>
References: <20261123085723.156933-1-arnd@kernel.org>
 <tdc6h325jthjgyik2ne4oistkm563maoc2cpnffqu7hh34tpl7@oscripzv4dwq>
 <qvmy7iaxc7cjy2gkajqkr5ma6b4lwxz5ff64a5zsqrgewkxodr@odbjlv5x3hix>
Subject: Re: [PATCH 0/2 v8] gpiolib: finish the legacy cleanup
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026, at 16:08, Bartosz Golaszewski wrote:
> On Mon, Nov 23, 2026 at 03:59:24PM +0100, Bartosz Golaszewski wrote:
>> On Mon, Nov 23, 2026 at 09:57:21AM +0100, Arnd Bergmann wrote:
>> >=20
>> > This was planned for 7.3 originally[1], but kept conflicting with
>> > ongoing cleanups for the broken rsk7203 board. I've skipped the
>> > oneline rsk change now, which will be fixed properly by Dmitry's
>> > patch [2].
>>=20
> Sashiko is right:
>
>   CC      arch/sh/boards/mach-rsk/devices-rsk7203.o
> arch/sh/boards/mach-rsk/devices-rsk7203.c: In function=20
> =E2=80=98rsk7203_devices_setup=E2=80=99:
> arch/sh/boards/mach-rsk/devices-rsk7203.c:127:9: error: implicit=20
> declaration of function =E2=80=98gpio_request=E2=80=99; did you mean =E2=
=80=98symbol_request=E2=80=99?=20
> [-Wimplicit-function-declaration]
>   127 |         gpio_request(GPIO_FN_TXD0, NULL);
>       |         ^~~~~~~~~~~~
>       |         symbol_request

Yes, this just seemed the easiest way out to avoid clashing with Dmitry's
patches again. If you want the version that doesn't break the build,
you can still apply v7 [1], but that likely means his series has go
through another revision to undo my change and remove the linux/gpio/leg=
acy.h
inclusion.

     Arnd

[1] https://lore.kernel.org/all/20260907090956.2825703-1-arnd@kernel.org=
/

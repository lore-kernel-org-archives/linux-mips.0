Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492290;
	b=tCMBctv53rZqEf8xiC0Ru813rC7h2LHUc31yfOIn+nOqYq5cVmoEUYeuS8wBfZA4KjoT
	 W/Oy7xKD9JRPk7K9EehVY0PbjY0G1UOc+KYb72TnfFfeHvbXj5jHWYGIYoBFgrDkDOFQH
	 gUcP0jx7LQGN4VvwUD+kPKZm4i392th/fNRngWXqcj81gNfj3jjb38/Zkr35VlxNDTDuO
	 pzl6E+GZ72Guw4Ngk+OHHepgvmnRm/JJc4FuzsJIIrEUS3QtN/63YG5jmswjNHR5tI7zY
	 KpZ5fa/Pb0ArHO/GJ3Y/bMPbjQLzrPMJ50DQy3/odWiazI/PPsOzQaeWRrljuit6ZbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492290;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=/tAXn9HhhI5i2xRr+VsFOZh/OUH+m9OqcmYc0kEYn+s=;
	b=lxoQPgN41KLkgdvInHrDib0sR/ngJvxeV/j3T/loVkjTje/xsmoS3ld43ZsiDyW5W9Hq
	 Vnq5zeUwchGoN4hKUfwo+4Jmp6CdiHL97fyHAyGhnvq3RGfZfPPHAT9jrZuoxSx46/Ui5
	 nouBBbvk3F65SENlThGC6iKvkEUV75wdYwFPL9tNsawEp6w81eEoY5dhFOc3O92hfGkBW
	 aJRb7lsDN3CosE/z5tvUERM55lpzbNvaoDusmRQD0uoXs52pC87dB2BY95Eacm9jY3F9Q
	 YQc6H3W0E0BZs5B/LhdSNsVJCtcOKwVq59PdAndXkhFmkOu8hoIVfg7ImhpYt8ttqxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=h6epGYND;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=E1F13uXq;
	arc=none smtp.remote-ip=202.12.124.158
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E55C606AE87
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 14:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E55C606AE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=h6epGYND;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=E1F13uXq
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 64EB27A00C3
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 09:04:49 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 09:04:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794492281;
	 x=1794578681; bh=/tAXn9HhhI5i2xRr+VsFOZh/OUH+m9OqcmYc0kEYn+s=; b=
	h6epGYNDiXOZ0U54jmhcFmhr9liTv0S3e/4nsnTQfdZmBFJGFRaPsxgpJKPUpAk1
	man4juZ+v7SfR72SVe3i5cfcS0G7NL3QkvZTt+0piUTA2wTEghZ7hXd9p0RBPABG
	5vhk1MBr3ULBoO0fTV4xpy4d/uBlLl/WFzoCs379XjgTDVtHfTWujuvdYu9H5pow
	2mXvdrxvo6BhDIXhZTTx/bO3Exp+PlvP7cK/DsGo9hy9sNUO0aoE67RezRNBDEZt
	Kasby90AUwr7/BWv+b6YVD+uqy69CBR415lbcTs4A9hLDdoP+N+5GcejR9XDXDhW
	w0ADKq6QwhGjXMVmZTHlJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794492281; x=
	1794578681; bh=/tAXn9HhhI5i2xRr+VsFOZh/OUH+m9OqcmYc0kEYn+s=; b=E
	1F13uXqZUsWP9ERbcmBRauF4vI+GEx2BkuRQNzoes0ataedMZtzqTjRBbAf7LabK
	6WDlDw915yi5GTALoa6bso7Dz4Pc0J9qUX9MgVn/kt3l+Lah3AavR6rBwmaTmSf1
	/Dkgzk8DNWALFs+mQR3HrIKBuWVqz/5oa9tJ3ZgIgjiHGDvTqNr6BNpbQqqJor89
	huWf3aFIMMPKU8muFWmaNaWYC1XeD81vPT0o1Ohqq1cIEcM1xxKA2Xzx7q+SLPfa
	QKwNqZZeCSI8o3vbKYTqsjy8jI/z1G4n6JK8HUwDxqK0p+GX20y40nbDpuam5VaR
	ofEDJNS4lNkRVhiMiG7mA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794492281; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LW1pcHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:P0Kke4GwFXwat174g81GPTScwGUfqw3Sh+w1yccEATpm8xQ
	bzikPAt5l39gDExQwgGQlJN9FYjKteE4vFTeAsG3yX14RzFzEXpZodx2znb/f3O1
	W+RpasfZLTwqn8Psff07SZsXn7vk6gT11KEb2U2X6AgTVh42Ggd/emo0ifMqyZsN
	CxtgeAxicCx5204o54vJPjcbMvf5bAUapT2uws5mNiGIfbrr/aD1k/fm2g8Z0YV9
	aMV4R06VY4oDmY9aTs6tqaLlHZi5VoCaNmMlfmZc+3lIG2G2KuiXsDRP8VafUB8+
	E39SnJiH8Wh0MdmiQKiMLVZW2rM2HqM6kL7pEMg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:yhBWo2F8Mg0lXsgAAiDFBLboJONwipmeaHVibNlXcm4=:/tAXn9HhhI5i2xRr+VsFOZh/OUH+m9OqcmYc0kEYn+s=;
X-ME-Sender: <xms:dcf1ap4UN1N1sYgm98NrBR9yMo43zP8zWJHt_KoCCUEsCOixwmXvbA>
    <xme:dcf1ahuPMMxteh0vrY0B4rNvmUkFDIN65y7XQAlfVmsmWslILsr3sEP7InMBsBFGj
    jbDb_lVhqrDpul3WXu1CnFH6muk8Of_T9-Lj4BHAQuKYb3qH8sFKJ4o>
X-ME-Proxy-Cause: dmFkZTEraX544mQ4uwFvdzCIHZ/nHTECZ1d9wNRCoCeA56HdTpiTyq3xSVAqiNV3X35/Z+
    dDXXwTcNSzIAJs5fwRvM3QaBeQigOW0u7sEAgv9lxlziJXvg6CryNer7nVzhQF8juyj+aa
    hRvH/YxuTpd4mrkR5o5OwzbwL4nDwtcuGyVhfjrnAyzbXG69muhVoQHXlcEoD8wQmkGr28
    VnetKWGF/1sn1HHrJB+F7J5TcmgHftJ59BVNmRvt+ttOpu2zJ8WeAveF1srqK9/1pU1bv9
    kQRD8+Jeqc9KbjeuF/GwuTL1cm0gvom1BFAQUMXqfIfM0hlgHFgzSKueKw1YJR40jKF1Kv
    1gxoiF0Xcg0X8YKBTOnVVdwZbEx7LTkcAo9TDrv5CmdIwZlhYabltHnf1TXjhEhFJ7mRh9
    CsavwvhJzZQje+YI9kWh/F4c3Byqi+Lh9cZ94FgydIu4K98FIU4bAF8yVVBQpwEVNFNrcV
    /Y8BolSDQx3UwXNXakz2fAlRJjSjz7Bcqoa/DazJqLfFkM9i0bZDaW55ekxupA1FzMDwsX
    2fYIe3mnx8s7qWJWF4kH37tOLKz6HQ9xmLTk66yk1/H2bO8Wqfi47UDgWnfhstGrZNWee4
    lE+sM2ptnn48DlRfenKAM500y06BMwBdjQDEM2nKvqkQ7fX1p3NjqkZSZqcQ
X-ME-Proxy: <xmx:d8f1anI4GyahBTQZsMiQINwhNdinl3W9pXUuBsnor0nDZiOGnXqGHA>
    <xmx:d8f1arzkSPTEAgh1hwjM-z_KEXo1JI1bT0cQNqGONl2t3IaIjdm0hA>
    <xmx:d8f1aq0bbLxprs1Ax6j_YjKbqVlZDjcm0WcWdgsV6Z2ubsV4AScf_Q>
    <xmx:d8f1ak9BDP92Kq051cUj7-aWz23-e42FFO7yN9MbetviFDBx2VwM2g>
    <xmx:ecf1aqEH4wnb05YC4zON_rcfe3sxx7jDz8fsDVXV3sknS5Vvne6Dwq7a>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2DC8932A009E; Thu, 12 Nov 2026 09:04:37 -0500 (EST)
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
X-ThreadId: AtwnaRLwEjKw
Date: Thu, 12 Nov 2026 15:04:16 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: "Christian Brauner" <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Message-Id: <b580eaab-100f-4375-a8df-7d1f4c751cbc@app.fastmail.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-13-8d1275885d9c@igalia.com>
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
 <20261105-tonyk-syscall_table-v9-13-8d1275885d9c@igalia.com>
Subject: Re: [PATCH v9 13/15] syscalls: Avoid matching substrings in the ABI parsing
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026, at 21:05, Andr=C3=A9 Almeida wrote:
> Currently, the abi parsing for grep will match substrings. For instanc=
e, an
> ABI called `abc` will match also the ABI called `abcde`. Use the space
> limiter to match a complete word and avoid matching substrings.
>
> While here, add a true command in the end of grep command to avoid the
> script exiting earlier and being able to do the cleanup.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
